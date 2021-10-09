# jd: Java / RDBMS integration by JDBC

- Java SE 17
- JUnit 5 + AssertJ 3

### JDBC on
- MySQL 8
- Oracle DB 18c
- PostgreSQL 14
- SQLite 3

### Database setup
- SQLite
  - Run migration.sql to (re)set data

- MySQL, Oracle, PostgreSQL
  - Run once setup.sql as dba to create user/schema "me"
  - Run migration.sql as "me" to (re)set data
