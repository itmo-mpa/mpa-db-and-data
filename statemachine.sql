start transaction;

insert into attributes values (1, 'VA registered', 'bool');
insert into attributes values (2, 'CAD', 'bool');
insert into attributes values (3, 'VA', 'bool');
insert into attributes values (4, 'LVEF', 'double');
insert into attributes values (5, 'ECG exercise stress testing: TT, Bicycle testing', '["positive", "negative", "uncertain"]');
insert into attributes values (6, 'Exercise stress test with Ng. exercise stress ECG test', '["positive", "negative"]');
insert into attributes values (7, 'Coronary Angiography', '["positive", "negative"]');
insert into attributes values (8, 'Nonischemic VA', 'bool');
insert into attributes values (9, 'Ischemic VA', 'bool');
insert into attributes values (10, 'MR', '["positive", "negative"]');
insert into attributes values (11, 'AAE', '["positive", "negative"]');
insert into attributes values (12, 'MR Repeat', '["indicated", "not indicated"]');
insert into attributes values (13, 'Psychodiagnostics', '["indicated", "not indicated"]');
insert into attributes values (14, 'AD', '["positive", "negative"]');
insert into attributes values (15, 'AAE', '["positive", "negative"]');

insert into state values (1, 'HSt 1', 'VA Not registered', 1);
insert into state values (2, 'HSt 2', 'Algorithm for the management of patients with VA', 1);
insert into state values (3, 'HSt 3', 'Medical therapy', 1);
insert into state values (4, 'HSt 4', 'Optimal Medical Therapy CAD, AAT, CA, ICD', 1);
insert into state values (5, 'HSt 5', 'Beta-blockers', 1);
insert into state values (6, 'HSt 6', 'Амбулаторное лечение', 1);
insert into state values (7, 'HSt 7', 'Переход на другой автомат', 1);

insert into state values (8, 'HS1', 'ECG, ECG Monitoring', 1);
insert into state values (9, 'HS2', 'Search for Trigger VA', 1);
insert into state values (10, 'HS3', 'ECG exercise stress testing: TT, Bicycle testing', 1);
insert into state values (11, 'HS3.1', 'Exercise stress test with Ng. exercise stress ECG test', 1);
insert into state values (12, 'HS4', 'Coronary angiography', 1);
insert into state values (13, 'HS5', 'Определение показаний к MR', 1);
insert into state values (14, 'HS6', 'MR done; Recover after MR (6-9 months)', 1);
insert into state values (15, 'HS7', 'MR efficiency evaluation', 1);
insert into state values (16, 'HS8', 'Exercise stress ECG test, PET/SPECT, NIFCGM; MR Repeat decision', 1);
insert into state values (17, 'HS9', 'Psychodiagnostics requirement evaluation', 1);
insert into state values (18, 'HS10', 'Psychodiagnostics', 1);
insert into state values (19, 'HS11', 'Psychotherapy, psychotropic drugs', 1);
insert into state values (20, 'HS12', 'Уточнение', 1);

insert into predicate values (1, 'eq ({status.1}, true)');
insert into predicate values (2, 'and (eq ({status.2}, true), and (eq ({status.3}, true), gte ({status.4}, 0.4)))');
insert into predicate values (3, 'eq ({status.5}, “positive”)');
insert into predicate values (4, 'eq ({status.5}, “uncertain”)');
insert into predicate values (5, 'eq ({status.6}, “positive”)');
insert into predicate values (6, 'eq ({status.7}, “positive”)');
insert into predicate values (7, 'and (eq ({status.7, “negative”}), eq ({status.8}, true))');
insert into predicate values (8, 'and (eq ({status.7, “negative”}), eq ({status.9}, true))');
insert into predicate values (9, 'false'); /*not implemented*/
insert into predicate values (10, 'eq ({status.10}, “positive”)');
insert into predicate values (11, 'and (eq ({status.10, “negative”}), eq ({status.8}, true))');
insert into predicate values (12, 'and (eq ({status.10, “negative”}), eq ({status.9}, true))');
insert into predicate values (13, 'eq ({status.11}, “positive”)');
insert into predicate values (14, 'and (eq ({status.11, “negative”}), eq ({status.9}, true))');
insert into predicate values (15, 'and (eq ({status.11, “negative”}), eq ({status.8}, true))');
insert into predicate values (16, 'eq ({status.12}, “indicated”)');
insert into predicate values (17, 'eq ({status.12}, “not indicated”)');
insert into predicate values (18, 'eq ({status.13}, “not indicated”)');
insert into predicate values (19, 'eq ({status.13}, “indicated”)');
insert into predicate values (20, 'false'); /*not implemented*/
insert into predicate values (21, 'false'); /*not implemented*/
insert into predicate values (22, 'eq ({status.14}, “negative”)');
insert into predicate values (23, 'eq ({status.14}, “positive”)');
insert into predicate values (24, 'eq ({status.15}, “negative”)');
insert into predicate values (25, 'eq ({status.15}, “positive”)');

insert into transition values (1, 8, 9, 1);
insert into transition values (2, 9, 10, 2);
insert into transition values (3, 10, 12, 3);
insert into transition values (4, 10, 11, 4);
insert into transition values (5, 11, 12, 5);
insert into transition values (6, 12, 13, 6);
insert into transition values (7, 12, 17, 7);
insert into transition values (8, 12, 17, 8);
insert into transition values (9, 12, 20, 9);
insert into transition values (10, 13, 14, 10);
insert into transition values (11, 13, 17, 11);
insert into transition values (12, 13, 17, 12);
insert into transition values (13, 15, 3, 13);
insert into transition values (14, 15, 16, 14);
insert into transition values (15, 15, 17, 15);
insert into transition values (16, 16, 13, 16);
insert into transition values (17, 16, 4, 17);
insert into transition values (18, 17, 4, 18);
insert into transition values (19, 17, 18, 19);
insert into transition values (20, 17, 20, 20);
insert into transition values (21, 17, 7, 21);
insert into transition values (22, 18, 5, 22);
insert into transition values (23, 18, 19, 23);
insert into transition values (24, 19, 5, 24);
insert into transition values (25, 19, 6, 25);

commit;
