-- tables.sql

CREATE TABLE IF NOT EXISTS cpi.dim_date (
    date_id         INTEGER PRIMARY KEY,      -- e.g. 202501
    year            SMALLINT NOT NULL,
    month           SMALLINT NOT NULL CHECK (month BETWEEN 1 AND 12),
    month_name      TEXT NOT NULL,
    month_start     DATE NOT NULL,
    month_end       DATE NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS ix_dim_date_year_month
ON cpi.dim_date (year, month);

--------------------------

CREATE TABLE IF NOT EXISTS cpi.dim_category (
    category_id            BIGINT PRIMARY KEY,
    category_name_en        TEXT NOT NULL,
    category_name_ar        TEXT,
    category_level          TEXT NOT NULL CHECK (category_level IN ('all_items', 'main', 'sub')),
    category_order          INTEGER NOT NULL,

    parent_category_id      BIGINT NULL,
    is_essential_core       BOOLEAN NOT NULL DEFAULT FALSE,
    is_essential_extended   BOOLEAN NOT NULL DEFAULT FALSE,

    source                  TEXT NOT NULL DEFAULT 'DOS',
    is_active               BOOLEAN NOT NULL DEFAULT TRUE
);

---------------------------------

CREATE TABLE IF NOT EXISTS cpi.fact_cpi (
    date_id         INTEGER NOT NULL,
    category_id     BIGINT NOT NULL,

    cpi_index       NUMERIC(10,3) NOT NULL,
    relative_weight NUMERIC(10,3),

    source          TEXT NOT NULL DEFAULT 'DOS',

    PRIMARY KEY (date_id, category_id),
    FOREIGN KEY (date_id) REFERENCES cpi.dim_date (date_id),
    FOREIGN KEY (category_id) REFERENCES cpi.dim_category (category_id)
);

CREATE INDEX IF NOT EXISTS ix_fact_cpi_date
ON cpi.fact_cpi (date_id);

CREATE INDEX IF NOT EXISTS ix_fact_cpi_category
ON cpi.fact_cpi (category_id);
