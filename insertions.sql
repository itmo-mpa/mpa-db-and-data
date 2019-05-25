START TRANSACTION;

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

INSERT INTO attributes (id, name, type) VALUES (1, 'ПСВ', 'double');
INSERT INTO attributes (id, name, type) VALUES (2, 'SpO2', 'double');
INSERT INTO attributes (id, name, type) VALUES (3, 'Состояние',  '["Признаки приступа", "Исчезновение свистящих хрипов", "Свистящие хрипы остаются", "Нарастание симптоматики"]');
INSERT INTO attributes (id, name, type) VALUES (4, 'Accept hospitalization', 'bool');

INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (1, 2, 3, 'eq({status.cond}, Признаки приступа)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (2, 2, 10, 'eq(1, 1)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (3, 3, 1, 'or(gt({status.psv}, 80.0), eq({status.cond}, Исчезновение свистящих хрипов)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (4, 3, 4, 'or(and(gt({status.psv}, 60.0), lt({status.psv}, 80.0)), eq({status.cond}, Свистящие хрипы остаются))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (5, 4, 1, 'eq({status.cond}, Признаки приступа)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (6, 4, 5, 'or(lt({status.psv}, 60.0), eq({status.cond}, Нарастание симптоматики))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (7, 4, 6, 'or(lt({status.psv}, 60.0), eq({status.cond}, Нарастание симптоматики))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (8, 4, 7, 'eq({status.ah}, true)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (9, 5, 7, 'eq({status.ah}, true)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (10, 6, 7, 'eq({status.ah}, true)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (11, 6, 1, 'eq(1, 1)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (12, 5, 1, 'eq(1, 1)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (13, 7, 6, 'or(lt({status.psv}, 60.0), eq({status.cond}, Нарастание симптоматики))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (14, 6, 7, 'or(or(lt({status.spo2}, 90.0), lt({status.psv}, 60.0)), eq({status.cond}, Нарастание симптоматики))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (15, 7, 5, 'or(lt({status.psv}, 60.0), eq({status.cond}, Нарастание симптоматики))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (16, 5, 7, 'or(or(lt({status.spo2}, 90.0), lt({status.psv}, 60.0)), eq({status.cond}, Нарастание симптоматики))');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (17, 7, 1, 'eq(1, 1)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (18, 7, 8, 'eq(1, 1)');
INSERT INTO transition (id, state_from_id, state_to_id, predicate) VALUES (19, 8, 9, 'eq(1, 1)');

COMMIT;