START TRANSACTION;

INSERT INTO disease (id, name) VALUES (1, 'Астма');

INSERT INTO doctor (id, name) VALUES (1, 'Влад Шелудченков');

INSERT INTO attributes (id, name, type) VALUES (1, 'ПСВ', 'double');
INSERT INTO attributes (id, name, type) VALUES (2, 'SpO2', 'double');
INSERT INTO attributes (id, name, type) VALUES (4, 'Accept hospitalization', 'bool');
INSERT INTO attributes (id, name, type) VALUES (3, 'Состояние', '["Признаки приступа", "Исчезновение свистящих хрипов", "Свистящие хрипы остаются", "Нарастание симптоматики"]');

INSERT INTO disease_attributes (id, requirement_type_id, requirement_id, is_required, attribute_id) VALUES (1, 1, 1, false, 1);
INSERT INTO disease_attributes (id, requirement_type_id, requirement_id, is_required, attribute_id) VALUES (2, 1, 1, false, 2);
INSERT INTO disease_attributes (id, requirement_type_id, requirement_id, is_required, attribute_id) VALUES (5, 1, 1, false, 4);
INSERT INTO disease_attributes (id, requirement_type_id, requirement_id, is_required, attribute_id) VALUES (6, 1, 1, false, 3);

--
-- contraindications
--
INSERT INTO medicine (id, name) VALUES (5, 'Вентолин');
INSERT INTO medicine (id, name) VALUES (6, 'Солу-Кортеф');
INSERT INTO medicine (id, name) VALUES (7, 'Сальгим');
INSERT INTO medicine (id, name) VALUES (8, 'Преднизолон');
INSERT INTO medicine (id, name) VALUES (9, 'Оксис турбухалер');
INSERT INTO medicine (id, name) VALUES (10, 'Ипрадол');
INSERT INTO medicine (id, name) VALUES (11, 'Фостер');
INSERT INTO medicine (id, name) VALUES (12, 'Эуфиллин');
INSERT INTO medicine (id, name) VALUES (13, 'Дексаметазон Никомед');
INSERT INTO medicine (id, name) VALUES (14, 'Беротек');
INSERT INTO medicine (id, name) VALUES (15, 'Беродуал');
INSERT INTO medicine (id, name) VALUES (16, 'Беклометазон');
INSERT INTO medicine (id, name) VALUES (17, 'Беклазон');
INSERT INTO medicine (id, name) VALUES (18, 'Атровент');
INSERT INTO medicine (id, name) VALUES (19, 'Асманекс твистхейлер');
INSERT INTO medicine (id, name) VALUES (20, 'Аминофиллин');

INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (1, 5, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (2, 6, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (3, 7, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (4, 8, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (5, 9, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (6, 10, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (7, 11, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (8, 12, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (9, 13, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (10, 14, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (11, 15, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (12, 16, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (13, 17, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (14, 18, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (15, 19, 1);
INSERT INTO medicine_for_diseases (id, medicine_id, disease_id) VALUES (16, 20, 1);

INSERT INTO active_substance (id, name) VALUES (10, 'Сальбутамол');
INSERT INTO active_substance (id, name) VALUES (11, 'Пропанол');
INSERT INTO active_substance (id, name) VALUES (12, 'Теофиллин');
INSERT INTO active_substance (id, name) VALUES (13, 'Гидрокортизон');
INSERT INTO active_substance (id, name) VALUES (14, 'Преднизолон');
INSERT INTO active_substance (id, name) VALUES (15, 'Амфотерицин');
INSERT INTO active_substance (id, name) VALUES (16, 'Формотерол');
INSERT INTO active_substance (id, name) VALUES (17, 'Гексопреналин');
INSERT INTO active_substance (id, name) VALUES (18, 'Беклометазон');
INSERT INTO active_substance (id, name) VALUES (19, 'Аминофиллин');
INSERT INTO active_substance (id, name) VALUES (20, 'Дексаметазон');
INSERT INTO active_substance (id, name) VALUES (21, 'Фенотерол');
INSERT INTO active_substance (id, name) VALUES (22, 'Ипратропия бромид');
INSERT INTO active_substance (id, name) VALUES (23, 'Атропиноподобные вещества');
INSERT INTO active_substance (id, name) VALUES (24, 'Бекламетазон');
INSERT INTO active_substance (id, name) VALUES (25, 'Мометазон');

INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (53, 10, 5);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (54, 13, 6);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (55, 10, 7);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (56, 14, 8);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (57, 16, 9);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (58, 17, 10);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (59, 18, 11);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (60, 16, 11);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (61, 19, 12);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (62, 20, 13);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (63, 21, 14);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (64, 21, 15);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (65, 18, 16);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (66, 24, 17);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (67, 22, 18);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (68, 25, 19);
INSERT INTO active_substance_in_medicine (id, active_substance_id, medicine_id) VALUES (69, 19, 20);

INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (70, 5, '2019-05-25 15:06:46.358371', 'has({medicine.activeSubstanceId}, 11)', 'no_source');
INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (71, 5, '2019-05-25 15:06:46.430445', 'has({medicine.activeSubstanceId}, 12)', 'no_source');
INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (72, 5, '2019-05-25 15:06:46.510239', 'lt({patient.age}, 2)', 'no_source');
INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (73, 8, '2019-05-25 15:09:23.798328', 'has({medicine.activeSubstanceId}, 15)', 'no_source');
INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (74, 9, '2019-05-25 15:10:15.758084', 'lt({patient.age}, 12)', 'no_source');
INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (75, 11, '2019-05-25 15:10:54.976731', 'lt({patient.age}, 18)', 'no_source');
INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (76, 14, '2019-05-25 15:11:49.575526', 'has({medicine.activeSubstanceId}, 12)', 'no_source');
INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (77, 15, '2019-05-25 15:12:07.958149', 'has({medicine.activeSubstanceId}, 22)', 'no_source');
INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (78, 15, '2019-05-25 15:12:08.030256', 'has({medicine.activeSubstanceId}, 21)', 'no_source');
INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (79, 15, '2019-05-25 15:12:08.114619', 'has({medicine.activeSubstanceId}, 23)', 'no_source');
INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (80, 16, '2019-05-25 15:12:25.838387', 'lt({patient.age}, 6)', 'no_source');
INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (81, 18, '2019-05-25 15:13:07.558578', 'lt({patient.age}, 6)', 'no_source');
INSERT INTO contraindications (id, medicine_id, created_date, predicate, source) VALUES (82, 19, '2019-05-25 15:13:24.229625', 'lt({patient.age}, 12)', 'no_source');

--
-- state machine for disease 1
--
INSERT INTO state (id, name, description, disease_id) VALUES (1, 'Ambulatory treatment', 'Амбулаторное лечение', 1);
INSERT INTO state (id, name, description, disease_id) VALUES (2, 'Diagnostics', 'Диагностика', 1);
INSERT INTO state (id, name, description, disease_id) VALUES (3, 'HS1', 'Признаки приступа бронхиальной астмы', 1);
INSERT INTO state (id, name, description, disease_id) VALUES (4, 'HS2', 'Свистящие хрипы остаются, ПСВ = 60–80%', 1);
INSERT INTO state (id, name, description, disease_id) VALUES (5, 'HS3.1', 'Нарастание симптоматики, ПСВ < 60%', 1);
INSERT INTO state (id, name, description, disease_id) VALUES (6, 'HS3.2', 'Нарастание симптоматики, ПСВ < 60%', 1);
INSERT INTO state (id, name, description, disease_id) VALUES (7, 'HS4', 'Стационарный этап, среднетяжелое обострение (нарастание симптоматики, ПСВ < 60%, SpO2 < 90%.)', 1);
INSERT INTO state (id, name, description, disease_id) VALUES (8, 'HS5', 'Стационарный этап лечения, неполный ответ (ПСВ = 50–70%, SpO2 < 90%)', 1);
INSERT INTO state (id, name, description, disease_id) VALUES (9, 'Intensive care unit', 'Отсутствие улучшения, необходима интенсивная терапия', 1);
INSERT INTO state (id, name, description, disease_id) VALUES (10, 'Not Asthma', 'Астма не подтверждена', 1);

INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (1, 2, 3, 'eq({status.3}, Признаки приступа)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (2, 2, 10, 'eq(1, 1)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (3, 3, 1, 'or(gt({status.1}, 80.0), eq({status.3}, Исчезновение свистящих хрипов)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (4, 3, 4, 'or(and(gt({status.1}, 60.0), lt({status.1}, 80.0)), eq({status.3}, Свистящие хрипы остаются))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (5, 4, 1, 'eq({status.3}, Признаки приступа)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (6, 4, 5, 'or(lt({status.1}, 60.0), eq({status.3}, Нарастание симптоматики))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (7, 4, 6, 'or(lt({status.1}, 60.0), eq({status.3}, Нарастание симптоматики))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (8, 4, 7, 'eq({status.4}, true)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (9, 5, 7, 'eq({status.4}, true)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (10, 6, 7, 'eq({status.4}, true)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (11, 6, 1, 'eq(1, 1)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (12, 5, 1, 'eq(1, 1)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (13, 7, 6, 'or(lt({status.1}, 60.0), eq({status.3}, Нарастание симптоматики))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (14, 6, 7, 'or(or(lt({status.2}, 90.0), lt({status.1}, 60.0)), eq({status.3}, Нарастание симптоматики))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (15, 7, 5, 'or(lt({status.1}, 60.0), eq({status.3}, Нарастание симптоматики))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (16, 5, 7, 'or(or(lt({status.2}, 90.0), lt({status.1}, 60.0)), eq({status.3}, Нарастание симптоматики))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (17, 7, 1, 'eq(1, 1)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (18, 7, 8, 'eq(1, 1)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (19, 8, 9, 'eq(1, 1)');

COMMIT;
