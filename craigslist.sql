
DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE "region" (
    "id" SERIAL   NOT NULL,
    "city" TEXT   NOT NULL,
    "state" TEXT   NOT NULL,
    CONSTRAINT "pk_region" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "users" (
    "user_id" SERIAL   NOT NULL,
    "username" TEXT   NOT NULL,
    "password" VARCHAR(16)   NOT NULL,
    "preferred_region" TEXT,
    "zip_code" VARCHAR(5),
    CONSTRAINT "pk_users" PRIMARY KEY (
        "user_id"
     )
);

CREATE TABLE "posts" (
    "post_id" SERIAL   NOT NULL,
    "title" VARCHAR(120)   NOT NULL,
    "text" TEXT   NOT NULL,
    CONSTRAINT "pk_posts" PRIMARY KEY (
        "post_id"
     )
);

CREATE TABLE "categories" (
    "category_id" SERIAL   NOT NULL,
    "category" TEXT   NOT NULL,
    CONSTRAINT "pk_categories" PRIMARY KEY (
        "category_id"
     )
);

ALTER TABLE "region" ADD CONSTRAINT "fk_region_id" FOREIGN KEY("id")
REFERENCES "users" ("user_id");

ALTER TABLE "users" ADD CONSTRAINT "fk_users_user_id" FOREIGN KEY("user_id")
REFERENCES "posts" ("post_id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_post_id" FOREIGN KEY("post_id")
REFERENCES "categories" ("category_id");

