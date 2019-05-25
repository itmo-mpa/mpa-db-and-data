<?php
header('Content-Type: text/html; charset=utf-8');

function transformToPredicates(&$medicine, $dbConnect)
{
	$contradictions = array();
	foreach($medicine["contraindications"]["substances_contraindications"] as $substanceName)
	{
		$query = 'SELECT * FROM "active_substance" WHERE "name"=$1';
        $result = pg_query_params($dbConnect, $query, array($substanceName));
        if (pg_fetch_array($result) == false) {
            $query = 'INSERT INTO "active_substance" ("name") VALUES ($1) RETURNING "id"';
            $result = pg_query_params($dbConnect, $query, array($substanceName));
        }
        $ActiveSubstanceId = pg_fetch_all($result);
        $ActiveSubstanceId = $ActiveSubstanceId[0]["id"];
		array_push($contradictions, "has({medicine.activeSubstanceId}, $ActiveSubstanceId)");
	}
	foreach($medicine["contraindications"]["patient_status_contraindications"] as $statusContradiction)
	{
		if($statusContradiction[attribute] != "age")
		{
			array_push($contradictions, "$statusContradiction[operator]({status.$statusContradiction[attribute]}, $statusContradiction[value])");
		}
		else
		{
			array_push($contradictions, "$statusContradiction[operator]({patient.$statusContradiction[attribute]}, $statusContradiction[value])");
		}
	}
	return $contradictions;
}

$config = json_decode(file_get_contents("db.ini"), True);
$dbServer = $config["dbServer"];
$dbPort = $config["dbPort"];
$dbPassword = $config["dbPassword"];
$dbUser =  $config["dbUser"];
$dbName =  $config["dbName"];

$connect = "hostaddr=".$dbServer." port=".$dbPort." dbname=".$dbName." user=".$dbUser." password=".$dbPassword;
$dbConnect = pg_connect($connect);

//Здесь ввести путь до Json'а
$input = file_get_contents("Ventolin.json");
$inputJson = json_decode($input, True);

$subtancesIds = array();

$query = 'SELECT * FROM "medicine" WHERE "name"=$1';
$result = pg_query_params($dbConnect, $query, array($inputJson["name"]));
if (pg_fetch_array($result) == false) {
    $query = 'INSERT INTO "medicine" ("name") VALUES ($1) RETURNING "id"';
    $result = pg_query_params($dbConnect, $query, array($inputJson["name"]));
    $MedicineId = pg_fetch_all($result);
    $MedicineId = $MedicineId[0]["id"];
    foreach($inputJson["active_substances"] as $substance){

        $query = 'SELECT * FROM "active_substance" WHERE "name"=$1';
        $result = pg_query_params($dbConnect, $query, array($substance));
        if (pg_fetch_array($result) == false) {
            $query = 'INSERT INTO "active_substance" ("name") VALUES ($1) RETURNING "id"';
            $result = pg_query_params($dbConnect, $query, array($substance));
        }
        $ActiveSubstanceId = pg_fetch_all($result);
        $ActiveSubstanceId = $ActiveSubstanceId[0]["id"];
		$subtancesIds[$substance] = $ActiveSubstanceId;

        $query = 'SELECT * FROM "active_substance_in_medicine" WHERE "active_substance_id"=$1 and "medicine_id"=$2';
        $result = pg_query_params($dbConnect, $query, array($ActiveSubstanceId, $MedicineId));
        if (pg_fetch_array($result) == false) {
            $query = 'INSERT INTO "active_substance_in_medicine" ("active_substance_id", "medicine_id") VALUES ($1, $2)';
            $result = pg_query_params($dbConnect, $query, array($ActiveSubstanceId, $MedicineId));
        }
    }
    foreach(transformToPredicates($inputJson, $dbConnect) as $predicate){
        $query = 'INSERT INTO "contraindications" ("medicine_id", "created_date", "predicate", "source") VALUES ($1, current_timestamp, $2, $3)';
        $result = pg_query_params($dbConnect, $query, array($MedicineId, $predicate, "no_source"));
    }
}
pg_close($dbConnect);

?>