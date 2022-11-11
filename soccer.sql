
DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE "league" (
    "id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_league" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "teams" (
    "team_id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "team_id"
     )
);

CREATE TABLE "players" (
    "player_id" SERIAL   NOT NULL,
    "first_name" TEXT   NOT NULL,
    "last_name" TEXT   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "goals" (
    "goal_id" SERIAL   NOT NULL,
    CONSTRAINT "pk_goals" PRIMARY KEY (
        "goal_id"
     )
);

CREATE TABLE "games" (
    "match_id" SERIAL   NOT NULL,
    "stadium" TEXT   NOT NULL,
    "team1" TEXT   NOT NULL,
    "team2" TEXT   NOT NULL,
    CONSTRAINT "pk_games" PRIMARY KEY (
        "match_id"
     )
);

CREATE TABLE "referees" (
    "ref_id" SERIAL   NOT NULL,
    "first_name" TEXT   NOT NULL,
    "last_name" TEXT   NOT NULL,
    CONSTRAINT "pk_referees" PRIMARY KEY (
        "ref_id"
     )
);

CREATE TABLE "seasons" (
    "season_id" SERIAL   NOT NULL,
    "start_date" DATETIME   NOT NULL,
    "end_date" DATETIME   NOT NULL,
    CONSTRAINT "pk_seasons" PRIMARY KEY (
        "season_id"
     )
);

ALTER TABLE "league" ADD CONSTRAINT "fk_league_id" FOREIGN KEY("id")
REFERENCES "teams" ("team_id");

ALTER TABLE "teams" ADD CONSTRAINT "fk_teams_team_id" FOREIGN KEY("team_id")
REFERENCES "players" ("player_id");

ALTER TABLE "players" ADD CONSTRAINT "fk_players_player_id" FOREIGN KEY("player_id")
REFERENCES "goals" ("goal_id");

ALTER TABLE "games" ADD CONSTRAINT "fk_games_match_id" FOREIGN KEY("match_id")
REFERENCES "goals" ("goal_id");

ALTER TABLE "referees" ADD CONSTRAINT "fk_referees_ref_id" FOREIGN KEY("ref_id")
REFERENCES "games" ("match_id");

ALTER TABLE "seasons" ADD CONSTRAINT "fk_seasons_season_id" FOREIGN KEY("season_id")
REFERENCES "league" ("id");

