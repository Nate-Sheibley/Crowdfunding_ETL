﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


DROP TABLE IF EXISTS category CASCADE;
CREATE TABLE "category" (
    "category_id" VARCHAR(16)   NOT NULL,
    "category" VARCHAR(32)   NOT NULL,
    PRIMARY KEY ("category_id")
);

DROP TABLE IF EXISTS subcategory CASCADE;
CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(16)   NOT NULL,
    "subcategory" VARCHAR(32)   NOT NULL,
    PRIMARY KEY ("subcategory_id")
);

DROP TABLE IF EXISTS contacts CASCADE;
CREATE TABLE "contacts" (
    "contact_id" INTEGER   NOT NULL,
    "first_name" VARCHAR(32)   NOT NULL,
    "last_name" VARCHAR(32)   NOT NULL,
    "email" VARCHAR(128)   NOT NULL,
    PRIMARY KEY ("contact_id")
);

DROP TABLE IF EXISTS campaign CASCADE;
CREATE TABLE "campaign" (
    "cf_id" INTEGER   NOT NULL,
    "contact_id" INTEGER NOT NULL REFERENCES contacts(contact_id),
    "company_name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "goal" FLOAT NOT NULL,
    "pledged" FLOAT NOT NULL,
    "outcome" VARCHAR(16),
    "backers_count" INTEGER NOT NULL,
    "country" VARCHAR(64) NOT NULL,
    "currency" VARCHAR(4) NOT NULL,
    "launch_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
--    "staff_pick" BOOLEAN,
--    "spotlight" BOOLEAN,
    "category_id" VARCHAR(16) NOT NULL REFERENCES category(category_id),
    "subcateogry_id" VARCHAR(16) NOT NULL REFERENCES subcategory(subcategory_id),
    PRIMARY KEY ("cf_id")

);

SELECT * FROM campaign;

SELECT * FROM contacts;

SELECT * FROM subcategory;

SELECT * FROM category;

-- check dtype of a field in postgres https://stackoverflow.com/questions/3827828/how-to-check-type-of-value-in-postgres  
--returns all as type "double precision" meaning the lack of desimal is a display setting not a datatype issue
SELECT pg_typeof(goal) FROM campaign;