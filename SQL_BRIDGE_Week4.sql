/*
1. Create the table. Each row should minimally include the person’s name, the person’s supervisor, and the
person’s job title. Using ID columns is encouraged.
2. Populate the table with a few sample rows.
3. Provide a single SELECT statement that displays the information in the table, showing who reports to whom.
*/
 
DROP TABLE IF EXISTS Personal;
 
CREATE TABLE Personal
(
 emp_id INT NOT NULL AUTO_INCREMENT,                                              
 emp_name VARCHAR(50) NOT NULL,
 supervisor_id VARCHAR(50) NULL, 
 job_title VARCHAR(100) NULL,
 PRIMARY KEY (emp_id)
);
 
SELECT * FROM Personal;
 
INSERT INTO Personal 
  (emp_name, supervisor_id,job_title)
 VALUES 
  ("Steven Jobs", "", "CEO"),
  ("Mark Jackson", "1", "Executive VP"),
  ("Henry Smith", "1", "VP"),
  ("Marry Sweet", "1", "secretary"),
  ("Steven Bruce", "3", "Director"),
  ("Kevin Spacy", "2", "VP"),
  ("Kate Hudson", "5", "Manager"),
  ("Jane Fonda", "5", "Manager")
;
 
SELECT * FROM Personal;
 
SELECT a.emp_name AS Employee,
    b.emp_name AS Report_To,
    b.job_title AS Job_Title
   FROM Personal a inner join Personal b 
        ON a.emp_id = b.supervisor_id
  
 