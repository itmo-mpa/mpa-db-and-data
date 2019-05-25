START TRANSACTION;

INSERT INTO disease_attributes (id, attribute_id, requirement_type_id, is_required, requirement_id) VALUES (1, 1, 1, False, 1);
INSERT INTO disease_attributes (id, attribute_id, requirement_type_id, is_required, requirement_id) VALUES (2, 2, 1, False, 1);
INSERT INTO disease_attributes (id, attribute_id, requirement_type_id, is_required, requirement_id) VALUES (3, 3, 2, False, 5);
INSERT INTO disease_attributes (id, attribute_id, requirement_type_id, is_required, requirement_id) VALUES (4, 3, 2, False, 8);
INSERT INTO disease_attributes (id, attribute_id, requirement_type_id, is_required, requirement_id) VALUES (5, 4, 1, False, 1);

COMMIT;