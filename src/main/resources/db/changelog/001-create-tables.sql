CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE account_status (
    id SERIAL PRIMARY KEY ,
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE client (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    full_name VARCHAR(255),
    citizenship VARCHAR(255),
    client_type VARCHAR(255),
    document_number VARCHAR(255),
    document_series VARCHAR(255),
    document_type VARCHAR(255),
    mdm_code BIGINT
);

CREATE TABLE account (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    status_id INT NOT NULL,
    client_id UUID NOT NULL,
    account_type VARCHAR(100) NOT NULL,
    currency_code VARCHAR(3) NOT NULL,

    CONSTRAINT fk_account_status FOREIGN KEY (status_id) REFERENCES account_status(id),
    CONSTRAINT fk_account_client FOREIGN KEY (client_id) REFERENCES client(id)
);

INSERT INTO account_status (name, description)
VALUES
    ('NEW', 'Счёт создан в БД'),
    ('IN_CREATION', 'Запрос на создание счёта был отправлен в смежную систему'),
    ('CREATED', 'Счёт создан в смежной системе'),
    ('CANCELLED', 'Счёт аннулирован'),
    ('CLOSED', 'Счёт закрыт')
ON CONFLICT (name) DO NOTHING;