--GRANT SELECT,UPDATE,INSERT on all tables in schema analysis to 
--leis;

REVOKE ALL ON ALL TABLES IN SCHEMA analysis FROM
username;
GRANT SELECT ON ALL TABLES IN SCHEMA analysis TO 
username;