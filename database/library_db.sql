CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    category VARCHAR(100),
    rack_no VARCHAR(20),
    shelf_no VARCHAR(20),
    quantity INT DEFAULT 0
);

TRUNCATE TABLE books;

INSERT INTO books
(title, author, category, rack_no, shelf_no, quantity)
VALUES
('Java Programming', 'James Gosling', 'Programming', 'R1', 'S1', 5),
('Database Management Systems', 'Korth', 'Database', 'R1', 'S2', 4),
('Machine Learning', 'Tom Mitchell', 'Machine Learning', 'R1', 'S3', 3),
('Python Programming', 'Guido van Rossum', 'Programming', 'R1', 'S4', 5),
('Deep Learning', 'Ian Goodfellow', 'AI', 'R1', 'S5', 3),

('Effective Java', 'Joshua Bloch', 'Programming', 'R2', 'S1', 4),
('Head First Java', 'Kathy Sierra', 'Programming', 'R2', 'S2', 3),
('Java: The Complete Reference', 'Herbert Schildt', 'Programming', 'R2', 'S3', 4),
('Clean Code', 'Robert C. Martin', 'Software Engineering', 'R2', 'S4', 3),
('The Pragmatic Programmer', 'Andrew Hunt', 'Software Engineering', 'R2', 'S5', 4),

('C Programming Language', 'Brian Kernighan', 'Programming', 'R3', 'S1', 5),
('C++ Primer', 'Stanley B. Lippman', 'Programming', 'R3', 'S2', 4),
('Programming in C', 'E. Balagurusamy', 'Programming', 'R3', 'S3', 5),
('Let Us C', 'Yashavant Kanetkar', 'Programming', 'R3', 'S4', 4),
('Programming with C++', 'D. Ravichandran', 'Programming', 'R3', 'S5', 3),

('Data Structures and Algorithms', 'Alfred V. Aho', 'Data Structures', 'R4', 'S1', 4),
('Introduction to Algorithms', 'Thomas H. Cormen', 'Algorithms', 'R4', 'S2', 3),
('Data Structures Using C', 'Reema Thareja', 'Data Structures', 'R4', 'S3', 5),
('Algorithms in C++', 'Robert Sedgewick', 'Algorithms', 'R4', 'S4', 3),
('Algorithms', 'Robert Sedgewick', 'Algorithms', 'R4', 'S5', 4),

('Operating System Concepts', 'Abraham Silberschatz', 'Operating Systems', 'R5', 'S1', 5),
('Modern Operating Systems', 'Andrew S. Tanenbaum', 'Operating Systems', 'R5', 'S2', 4),
('Operating Systems', 'William Stallings', 'Operating Systems', 'R5', 'S3', 3),
('Linux Kernel Development', 'Robert Love', 'Operating Systems', 'R5', 'S4', 3),
('Unix Operating System', 'Sumitabha Das', 'Operating Systems', 'R5', 'S5', 4),

('Computer Networks', 'Andrew S. Tanenbaum', 'Networks', 'R6', 'S1', 5),
('Data Communications and Networking', 'Behrouz A. Forouzan', 'Networks', 'R6', 'S2', 4),
('Computer Networking: A Top-Down Approach', 'James Kurose', 'Networks', 'R6', 'S3', 3),
('TCP/IP Illustrated', 'W. Richard Stevens', 'Networks', 'R6', 'S4', 3),
('Network Security Essentials', 'William Stallings', 'Cyber Security', 'R6', 'S5', 4),

('Artificial Intelligence: A Modern Approach', 'Stuart Russell', 'AI', 'R7', 'S1', 4),
('Artificial Intelligence', 'Elaine Rich', 'AI', 'R7', 'S2', 3),
('Pattern Recognition and Machine Learning', 'Christopher Bishop', 'Machine Learning', 'R7', 'S3', 3),
('Hands-On Machine Learning', 'Aurélien Géron', 'Machine Learning', 'R7', 'S4', 4),
('Machine Learning Yearning', 'Andrew Ng', 'Machine Learning', 'R7', 'S5', 5),

('Data Science from Scratch', 'Joel Grus', 'Data Science', 'R8', 'S1', 4),
('Python for Data Analysis', 'Wes McKinney', 'Data Science', 'R8', 'S2', 5),
('Practical Statistics for Data Scientists', 'Peter Bruce', 'Data Science', 'R8', 'S3', 3),
('R for Data Science', 'Hadley Wickham', 'Data Science', 'R8', 'S4', 4),
('Data Mining: Concepts and Techniques', 'Jiawei Han', 'Data Mining', 'R8', 'S5', 3),

('Natural Language Processing with Python', 'Steven Bird', 'NLP', 'R9', 'S1', 4),
('Speech and Language Processing', 'Dan Jurafsky', 'NLP', 'R9', 'S2', 3),
('Deep Learning for NLP', 'Palash Goyal', 'NLP', 'R9', 'S3', 3),
('Natural Language Processing in Action', 'Hobson Lane', 'NLP', 'R9', 'S4', 4),
('Transformers for Natural Language Processing', 'Denis Rothman', 'NLP', 'R9', 'S5', 3),

('Computer Organization and Design', 'David A. Patterson', 'Computer Architecture', 'R10', 'S1', 4),
('Computer Architecture', 'Morris Mano', 'Computer Architecture', 'R10', 'S2', 5),
('Structured Computer Organization', 'Andrew S. Tanenbaum', 'Computer Architecture', 'R10', 'S3', 3),
('Digital Design', 'Morris Mano', 'Digital Electronics', 'R10', 'S4', 4),
('Digital Logic and Computer Design', 'M. Morris Mano', 'Digital Electronics', 'R10', 'S5', 3),

('Software Engineering', 'Ian Sommerville', 'Software Engineering', 'R11', 'S1', 5),
('Software Engineering: A Practitioners Approach', 'Roger Pressman', 'Software Engineering', 'R11', 'S2', 4),
('Design Patterns', 'Erich Gamma', 'Software Engineering', 'R11', 'S3', 3),
('Refactoring', 'Martin Fowler', 'Software Engineering', 'R11', 'S4', 3),
('Agile Software Development', 'Robert C. Martin', 'Software Engineering', 'R11', 'S5', 4),

('Web Technologies', 'Uttam K. Roy', 'Web Development', 'R12', 'S1', 4),
('HTML and CSS', 'Jon Duckett', 'Web Development', 'R12', 'S2', 5),
('JavaScript: The Good Parts', 'Douglas Crockford', 'Web Development', 'R12', 'S3', 3),
('Learning React', 'Alex Banks', 'Web Development', 'R12', 'S4', 3),
('Full Stack Development', 'Chris Minnick', 'Web Development', 'R12', 'S5', 4),

('Servlets and JSP', 'Budi Kurniawan', 'Java Web', 'R13', 'S1', 4),
('Head First Servlets and JSP', 'Bryan Basham', 'Java Web', 'R13', 'S2', 3),
('Spring in Action', 'Craig Walls', 'Java Web', 'R13', 'S3', 4),
('Spring Boot in Action', 'Craig Walls', 'Java Web', 'R13', 'S4', 3),
('Java Persistence with Spring Data', 'Madhura Bhave', 'Java Web', 'R13', 'S5', 3),

('MySQL Cookbook', 'Paul DuBois', 'Database', 'R14', 'S1', 4),
('Learning SQL', 'Alan Beaulieu', 'Database', 'R14', 'S2', 5),
('SQL in 10 Minutes', 'Ben Forta', 'Database', 'R14', 'S3', 3),
('Fundamentals of Database Systems', 'Ramez Elmasri', 'Database', 'R14', 'S4', 4),
('Database System Concepts', 'Abraham Silberschatz', 'Database', 'R14', 'S5', 3),

('Cloud Computing', 'Rajkumar Buyya', 'Cloud Computing', 'R15', 'S1', 4),
('Cloud Computing Bible', 'Barrie Sosinsky', 'Cloud Computing', 'R15', 'S2', 3),
('Architecting the Cloud', 'Michael J. Kavis', 'Cloud Computing', 'R15', 'S3', 3),
('AWS Certified Solutions Architect', 'Stephane Maarek', 'Cloud Computing', 'R15', 'S4', 4),
('Google Cloud Platform in Action', 'Mark Amundsen', 'Cloud Computing', 'R15', 'S5', 3),

('Internet of Things', 'Arshdeep Bahga', 'IoT', 'R16', 'S1', 5),
('Building the Internet of Things', 'Maciej Kranz', 'IoT', 'R16', 'S2', 3),
('IoT Fundamentals', 'David Hanes', 'IoT', 'R16', 'S3', 4),
('Designing Connected Products', 'Claire Rowland', 'IoT', 'R16', 'S4', 3),
('IoT Solutions in Microsoft Azure', 'Dominic Betts', 'IoT', 'R16', 'S5', 3),

('Cybersecurity Essentials', 'Charles J. Brooks', 'Cyber Security', 'R17', 'S1', 4),
('Hacking: The Art of Exploitation', 'Jon Erickson', 'Cyber Security', 'R17', 'S2', 3),
('Computer Security', 'William Stallings', 'Cyber Security', 'R17', 'S3', 4),
('Security Engineering', 'Ross Anderson', 'Cyber Security', 'R17', 'S4', 3),
('Network Security', 'Charlie Kaufman', 'Cyber Security', 'R17', 'S5', 4),

('Computer Graphics with OpenGL', 'Donald D. Hearn', 'Graphics', 'R18', 'S1', 3),
('Computer Graphics', 'Donald Hearn', 'Graphics', 'R18', 'S2', 4),
('Game Programming Patterns', 'Robert Nystrom', 'Game Development', 'R18', 'S3', 3),
('Unity Game Development', 'John P. Doran', 'Game Development', 'R18', 'S4', 3),
('Beginning Game Programming', 'Jonathan S. Harbour', 'Game Development', 'R18', 'S5', 4),

('Mobile App Development', 'Neil Smyth', 'Mobile Development', 'R19', 'S1', 4),
('Android Programming', 'Bill Phillips', 'Mobile Development', 'R19', 'S2', 3),
('Flutter in Action', 'Eric Windmill', 'Mobile Development', 'R19', 'S3', 4),
('iOS Programming', 'Christian Keur', 'Mobile Development', 'R19', 'S4', 3),
('Cross-Platform App Development', 'Shane Conder', 'Mobile Development', 'R19', 'S5', 3),

('Blockchain Basics', 'Daniel Drescher', 'Blockchain', 'R20', 'S1', 4),
('Mastering Blockchain', 'Imran Bashir', 'Blockchain', 'R20', 'S2', 3),
('Blockchain Revolution', 'Don Tapscott', 'Blockchain', 'R20', 'S3', 3),
('Hands-On Blockchain', 'Daniel van Flymen', 'Blockchain', 'R20', 'S4', 4),
('Cryptocurrency and Blockchain', 'Arvind Narayanan', 'Blockchain', 'R20', 'S5', 3);

-- Check total books
SELECT COUNT(*) AS total_books FROM books;

-- Display all books
SELECT * FROM books ORDER BY book_id;
