CREATE TABLE person_discounts
(
    id          bigint  NOT NULL PRIMARY KEY,
    person_id   bigint  NOT NULL,
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person (id),
    pizzeria_id bigint  NOT NULL,
    CONSTRAINT fk_pizzeria_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id),
    discount    numeric NOT NULL
);


--DROP TABLE person_discounts;