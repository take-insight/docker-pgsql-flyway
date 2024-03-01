DROP TABLE IF EXISTS merchandises;
CREATE TABLE merchandises (
    merchandises_id INTEGER NOT NULL,
    name     VARCHAR(10) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_user VARCHAR(10) NOT NULL DEFAULT '',
    CONSTRAINT merchandises_pkey PRIMARY KEY (merchandises_id)
);

DROP TABLE IF EXISTS merchandise_profiles;
CREATE TABLE merchandise_profiles (
    merchandise_profiles_id INTEGER NOT NULL,
    merchandises_id INTEGER NOT NULL,
    display_name     VARCHAR(10) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_user VARCHAR(10) NOT NULL DEFAULT '',
    CONSTRAINT merchandises_profiles_pkey PRIMARY KEY (merchandise_profiles_id),
    CONSTRAINT merchandises_fkey FOREIGN KEY (merchandises_id)
        REFERENCES merchandises (merchandises_id)
        ON UPDATE NO ACTION ON DELETE CASCADE
);