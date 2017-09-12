SELECT dblink_connect('connect_to_test', 'dbname=test');

SELECT * FROM dblink('connect_to_test', 'SELECT test_char,test_date FROM test_table') 
AS towns(test_char varchar(255), test_date date);

SELECT dblink_disconnect('connect_to_test');