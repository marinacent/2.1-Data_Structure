-- redundant code?? check the populate code in ex 2

INSERT INTO addresses VALUES (NULL, 'Pompeu Fabra', '2 bis', '2', 'A', 'Roses', '17480', 'Spain');  
INSERT INTO providers VALUES (NULL, 'Ulleres Joan', 1, '973456541', '973456542', 'A12345678');
INSERT INTO addresses VALUES (NULL, 'Garrotxa', '22', 'entresol', '2', 'Blanes', '17300', 'Spain');
INSERT INTO providers VALUES (NULL, 'Accessoris Vives', 2, '976567897', '976567898', 'B67891234');

INSERT INTO brands VALUES (NULL, 'Furla', 1);
INSERT INTO brands VALUES (NULL, 'Ray-Ban', 1);
INSERT INTO brands VALUES (NULL, 'Oakley', 2);

INSERT INTO glasses VALUES (NULL, 1, 'OD: -1.25 -0.50 x90', 'OS: -1.00 -0.25 x85', 'rimless', NULL, 'clear', 120.00);
INSERT INTO glasses VALUES (NULL, 1, 'OD: +2.00 ADD +1.50' , 'OS: +1.75 ADD +1.50', 'metal', 'red', 'polarized gray', 92.50);
INSERT INTO glasses VALUES (NULL, 2, 'OD: -2.50 -1.00 x10 ADD +2.00', 'OS: -2.25 -0.75 x170 ADD +2.00', 'plastic', 'dark green', 'transition gray', 134.00);
INSERT INTO glasses VALUES (NULL, 3, 'OD: 0.00 -0.75 x180', 'OS: 0.00 -0.50 x175', 'metal', 'pink', 'clear', 100.99);

INSERT INTO addresses VALUES (NULL, 'Consell de Cent', '138', '5', '2', 'Barcelona', '08013', 'Spain');
INSERT INTO customers VALUES (NULL, 'Sophia', 'Garcia', 3, '931234567', 'sophia.garcia@mysqlmail.com', DEFAULT, NULL);
INSERT INTO addresses VALUES (NULL, 'Mallorca', '13', '6', '3', 'Barcelona', '08029', 'Spain');
INSERT INTO customers VALUES (NULL, 'Josep', 'Vives', 4, '931287667', 'josep.vives@mysqlmail.com', DEFAULT, 1);

INSERT INTO employees VALUES (NULL, 'Ivan', 'Corda');
INSERT INTO employees VALUES (NULL, 'Judit', 'Portes');

INSERT INTO sales VALUES (NULL, 3, 1, 1, '2025-01-15 10:00:00');
INSERT INTO sales VALUES (NULL, 1, 2, 2, '2025-03-22 16:30:00');
INSERT INTO sales VALUES (NULL, 4, 1, 2, '2025-06-05 11:45:00');
INSERT INTO sales VALUES (NULL, 2, 1, 2, '2025-11-03 09:20:00');













