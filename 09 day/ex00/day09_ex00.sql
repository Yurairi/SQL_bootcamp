CREATE TABLE person_audit
(
    created    TIMESTAMP WITH TIME ZONE                      DEFAULT CURRENT_TIMESTAMP(1) NOT NULL,
    type_event CHAR(1) CHECK (type_event IN ('I', 'U', 'D')) DEFAULT 'I'                  NOT NULL,
    row_id     BIGINT                                                                     NOT NULL,
    name       VARCHAR,
    age        INT,
    gender     VARCHAR,
    address    VARCHAR
);

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS
$trg_person_insert_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit
        SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'I', NEW.*;
    END IF;
    RETURN NULL;
END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');