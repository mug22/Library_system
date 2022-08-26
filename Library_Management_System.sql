create database library_systems;
use library_systems;
CREATE TABLE readers
(
	reader_id VARCHAR(6),
    firstname VARCHAR(30),
    middlename VARCHAR(30),
    lastname VARCHAR(30),
    city VARCHAR(15),
    mobile VARCHAR(10),
    occupation VARCHAR(10),
    dob DATE,
    CONSTRAINT readers_pk PRIMARY KEY(reader_id)
);
INSERT INTO readers VALUES('L00001','Ravish','Kumar','Jain','Delhi','9954343092','Service','1972-06-03');
INSERT INTO readers VALUES('L00002','Avinash','Sira','Jha','Delhi','6002469190','Service','1977-12-11');
INSERT INTO readers VALUES('L00003','Sheetal',null,'Sharma','Rohtak','7007981909','Doctor','1990-05-02');
INSERT INTO readers VALUES('L00004','Christie','George','Shaw','Gurugram','9435143058','Business','1963-10-26');
INSERT INTO readers VALUES('L00005','Kripa',null,'Lahkar','Noida','6066712092','Service','2000-02-22');
INSERT INTO readers VALUES('L00006','Anita','Rama','Lingalla','Hyderabad','9954309233','Housewife','1989-01-01');
INSERT INTO readers VALUES('L00007','Noori',null,'Ahmed','Panipat','9944303321','Business','1992-11-21');
INSERT INTO readers VALUES('L00008','Prapti','Kashyap','Das','Sonipat','9432207738','Dentist','1988-04-17');
INSERT INTO readers VALUES('L00009','Muskaan',null,'Khan','Delhi','9953901132','Model','1995-12-13');
INSERT INTO readers VALUES('L00010','Simran',null,'Jowar','Agra','6223580943','Teacher','1987-01-31');
INSERT INTO readers VALUES('L00011','Aryan','Kaushik','Sarma','Delhi','7810245453','Student','2001-03-29');
INSERT INTO readers VALUES('L00012','Gaurav',null,'Joshi','Delhi','7659660593','Student','2000-12-26');
INSERT INTO readers VALUES('L00013','Arshad',null,'Iqbal','Gurugram','8473844107','Teacher','1990-07-27');
INSERT INTO readers VALUES('L00014','Chandrika',null,'Singh','Amritsar','9943521303','Writer','1994-02-15');
INSERT INTO readers VALUES('L00015','Lucy',null,'Smith','Rohtak','6069435673','Actor','1999-08-25');


CREATE TABLE Book
(
	bookid VARCHAR(6),
    bookname VARCHAR(40),
	bookdomain VARCHAR(30),
    CONSTRAINT book_bid_ok PRIMARY KEY(bookid)
);

INSERT INTO Book VALUES('B00001','The Three Muskeeteers','Fiction');
INSERT INTO Book VALUES('B00002','Charlie and the Chocolate Factory','Fantasy');
INSERT INTO Book VALUES('B00003','Twilight - Breaking Dawn','Fantasy');
INSERT INTO Book VALUES('B00004','A Fortunate Life','Autobiography');
INSERT INTO Book VALUES('B00005','Dune','Science-Fiction');
INSERT INTO Book VALUES('B00006','Harry Potter and the Chamber of Secrets','Fantasy');
INSERT INTO Book VALUES('B00007','March','Non-Fiction');
INSERT INTO Book VALUES('B00008','Stev Jobs','Biography');
INSERT INTO Book VALUES('B00009','Geetanjali','Poetry');
INSERT INTO Book VALUES('B00010','Into the Wild','Biography');
INSERT INTO Book VALUES('B00011','Da Vinci Code','Mystery');
INSERT INTO Book VALUES('B00012','The Shining','Horror');
INSERT INTO Book VALUES('B00013','Two States','Fiction');
INSERT INTO Book VALUES('B00014','The Girl with the Dragon Tattoo','Mystery');
INSERT INTO Book VALUES('B00015','Gone Girl','Thriller');


CREATE TABLE active_readers
(
	account_id VARCHAR(6),
    reader_id VARCHAR(6),
    bookid VARCHAR(6),
    atype VARCHAR(10),
    astatus VARCHAR(10),
    CONSTRAINT activereaders_acnumber_pk PRIMARY KEY(account_id),
    CONSTRAINT account_readers_readerId_fk FOREIGN KEY(reader_id) REFERENCES readers(reader_id),
    CONSTRAINT account_bookid_fk FOREIGN KEY(bookid) REFERENCES Book(bookid)
);

INSERT INTO active_readers VALUES('A00001','L00001','B00009','Regular','Active');
INSERT INTO active_readers VALUES('A00002','L00002','B00001','Regular','Active');
INSERT INTO active_readers VALUES('A00003','L00013','B00005','Premium','Active');
INSERT INTO active_readers VALUES('A00004','L00012','B00012','Premium','Active');
INSERT INTO active_readers VALUES('A00005','L00003','B00005','Premium','Terminated');
INSERT INTO active_readers VALUES('A00006','L00006','B00007','Regular','Active');
INSERT INTO active_readers VALUES('A00007','L00007','B00001','Premium','Active');
INSERT INTO active_readers VALUES('A00008','L00011','B00012','Regular','Active');
INSERT INTO active_readers VALUES('A00009','L00008','B00004','Regular','Active');
INSERT INTO active_readers VALUES('A00010','L00009','B00009','Regular','Suspended');
INSERT INTO active_readers VALUES('A00011','L00015','B00002','Regular','Terminated');
INSERT INTO active_readers VALUES('A00012','L00005','B00004','Premium','Active');
INSERT INTO active_readers VALUES('A00013','L00010','B00002','Regular','Active');
INSERT INTO active_readers VALUES('A00014','L00004','B00011','Premium','Active');
INSERT INTO active_readers VALUES('A00015','L00014','B00008','Regular','Terminated');

CREATE TABLE bookissue_details
(
	issuenumber VARCHAR(6),
    account_id VARCHAR(6),
    bookid VARCHAR(6),
    booksname VARCHAR(50),
    numbers_of_book_issued INT(7),
	CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(issuenumber),
    CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_id) REFERENCES active_readers(account_id)
);

INSERT INTO bookissue_details VALUES('T00001','A00001', 'B00009', 'Geetanjali', 12);
INSERT INTO bookissue_details VALUES('T00002','A00002', 'B00001', 'The Three Muskeeteers', 1);
INSERT INTO bookissue_details VALUES('T00003','A00004', 'B00012', 'The Shining', 5);
INSERT INTO bookissue_details VALUES('T00004','A00007', 'B00001', 'The Three Muskeeteers', 2);
INSERT INTO bookissue_details VALUES('T00005','A00009', 'B00004', 'A Fortunate Life', 1);
INSERT INTO bookissue_details VALUES('T00006','A00011', 'B00012', 'The Shining', 1);


