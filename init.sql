-- Initialize the student_db database
USE student_db;

-- Grant privileges to the user (if not already done by environment variables)
GRANT ALL PRIVILEGES ON student_db.* TO 'username'@'%' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON student_db.* TO 'root'@'%' IDENTIFIED BY 'redhat';

-- Flush privileges to apply changes
FLUSH PRIVILEGES; 