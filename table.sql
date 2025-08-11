CREATE DATABASE banking_system;
USE banking_system;
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    mobile_number VARCHAR(15) UNIQUE NOT NULL,
    email_address VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO customers (full_name, gender, date_of_birth, mobile_number, email_address)
VALUES
('Aman Kumar Singh', 'Male', '1995-05-15', '9876543210', 'aman.singh@example.com'),
('Neha Sharma', 'Female', '1990-08-22', '9123456780', 'neha.sharma@example.com'),
('Ravi Patel', 'Male', '1988-12-05', '9988776655', 'ravi.patel@example.com'),
('Priya Gupta', 'Female', '1992-03-10', '9876501234', 'priya.gupta@example.com'),
('Alex Morgan', 'Other', '2000-07-25', '9001122334', 'alex.morgan@example.com');
CREATE TABLE addresses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    house_number VARCHAR(50) NOT NULL,
    street_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    pincode VARCHAR(10) NOT NULL,
    address_type ENUM('Current', 'Permanent') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);
INSERT INTO addresses (customer_id, house_number, street_name, city, state, pincode, address_type)
VALUES
(1, '123A', 'MG Road', 'Mumbai', 'Maharashtra', '400001', 'Current'),
(1, '123A', 'MG Road', 'Mumbai', 'Maharashtra', '400001', 'Permanent'),
(2, '45B', 'Park Street', 'Kolkata', 'West Bengal', '700016', 'Current'),
(3, '78C', 'Brigade Road', 'Bangalore', 'Karnataka', '560025', 'Current'),
(4, '12D', 'Connaught Place', 'Delhi', 'Delhi', '110001', 'Permanent'),
(5, '90E', 'Church Street', 'Bangalore', 'Karnataka', '560001', 'Current');

CREATE TABLE kyc_documents (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    document_name VARCHAR(50) NOT NULL,
    document_number VARCHAR(50) NOT NULL,
    issuing_authority VARCHAR(100),
    expiry_date DATE,
    file_path VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);
INSERT INTO kyc_documents (customer_id, document_name, document_number, issuing_authority, expiry_date, file_path)
VALUES
(1, 'Aadhaar Card', '1234-5678-9012', 'UIDAI', '2030-12-31', 'uploads/kyc/1_aadhaar.pdf'),
(2, 'PAN Card', 'ABCDE1234F', 'Income Tax Department', NULL, 'uploads/kyc/2_pan.pdf'),
(3, 'Passport', 'M1234567', 'Government of India', '2028-06-15', 'uploads/kyc/3_passport.pdf'),
(1, 'Driving License', 'DL-9876543210', 'RTO Mumbai', '2025-08-01', 'uploads/kyc/1_dl.pdf'),
(4, 'Voter ID', 'XYZ1234567', 'Election Commission', NULL, 'uploads/kyc/4_voterid.pdf');

CREATE TABLE referral_sources (
    id INT PRIMARY KEY AUTO_INCREMENT,
    referral_type VARCHAR(50) NOT NULL,
    description TEXT
);
INSERT INTO referral_sources (referral_type, description)
VALUES
('Friend', 'Referred by a friend or family member'),
('Social Media', 'Found through social media platforms like Facebook, Instagram'),
('Online Ads', 'Saw advertisements on websites or search engines'),
('Newspaper', 'Referral through newspaper ads or articles'),
('Television', 'Referred via TV commercials or programs'),
('Website', 'Came from the official company website'),
('Event', 'Referred at a company or community event');

CREATE TABLE onboarding_requests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    date_of_request DATE NOT NULL,
    source_of_request ENUM('Website', 'Branch Walk-in', 'Agent') NOT NULL,
    preferred_branch_location VARCHAR(100),
    notes_from_staff TEXT,
    referral_source_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (referral_source_id) REFERENCES referral_sources(id)
);
INSERT INTO onboarding_requests 
    (customer_id, date_of_request, source_of_request, preferred_branch_location, notes_from_staff, referral_source_id)
VALUES
    (1, '2025-08-01', 'Website', 'Mumbai Central Branch', 'Customer prefers evening appointments.', 1),
    (2, '2025-08-03', 'Branch Walk-in', 'Kolkata Park Street Branch', 'Walk-in requested expedited processing.', 2),
    (3, '2025-08-05', 'Agent', 'Bangalore MG Road Branch', 'Agent explained all documents required.', 3),
    (4, '2025-08-06', 'Website', NULL, 'No special notes.', NULL),
    (5, '2025-08-07', 'Agent', 'Delhi Connaught Place Branch', 'Customer requested callback next week.', 5);
    SELECT * FROM customers;
    SELECT full_name, email_address FROM customers;
    SELECT * FROM customers WHERE gender = 'Female';


    CREATE DATABASE management_system;
use  management_system;
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    mobile_number VARCHAR(15) UNIQUE NOT NULL,
    email_address VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO customers (full_name, gender, date_of_birth, mobile_number, email_address) VALUES
('Aman Kumar Singh', 'Male', '1995-05-15', '9876543210', 'aman.singh@example.com'),
('Neha Sharma', 'Female', '1990-08-22', '9123456780', 'neha.sharma@example.com'),
('Ravi Patel', 'Male', '1988-12-05', '9988776655', 'ravi.patel@example.com');
SELECT * 
FROM customers 
WHERE gender = 'Female';
SELECT * 
FROM customers 
WHERE date_of_birth < '1990-08-22';



CREATE TABLE account_types (
    id INT PRIMARY KEY AUTO_INCREMENT,
    account_name VARCHAR(50) NOT NULL,
    description TEXT,
    minimum_balance DECIMAL(15,2) NOT NULL
);
INSERT INTO account_types (account_name, description, minimum_balance) VALUES
('Savings', 'Savings account with interest', 1000.00),
('Current', 'Current account for businesses', 5000.00);
SELECT * FROM account_types;
SELECT account_name, minimum_balance 
FROM account_types;


CREATE TABLE branches (
    id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    ifsc_code VARCHAR(20) UNIQUE NOT NULL
);
INSERT INTO branches (branch_name, city, state, ifsc_code) VALUES
('Mumbai Central Branch', 'Mumbai', 'Maharashtra', 'MUMC0001234'),
('Kolkata Park Street Branch', 'Kolkata', 'West Bengal', 'KOLP0005678');

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    email_address VARCHAR(100) UNIQUE NOT NULL,
    branch_id INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES branches(id) ON DELETE CASCADE
);
INSERT INTO employees (full_name, designation, contact_number, email_address, branch_id) VALUES
('Rajesh Mehta', 'Relationship Manager', '9876543211', 'rajesh.mehta@bank.com', 1),
('Sunita Verma', 'Branch Manager', '9123456781', 'sunita.verma@bank.com', 2);

CREATE TABLE accounts (
    account_number BIGINT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type_id INT NOT NULL,
    branch_id INT NOT NULL,
    relationship_manager_id INT,
    opening_date DATE NOT NULL,
    initial_deposit_amount DECIMAL(15,2) NOT NULL,
    current_balance DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (account_type_id) REFERENCES account_types(id),
    FOREIGN KEY (branch_id) REFERENCES branches(id),
    FOREIGN KEY (relationship_manager_id) REFERENCES employees(id)
);
INSERT INTO accounts (account_number, customer_id, account_type_id, branch_id, relationship_manager_id, opening_date, initial_deposit_amount, current_balance) VALUES
(1000000001, 1, 1, 1, 1, '2025-01-15', 5000.00, 5500.00),
(1000000002, 2, 2, 2, NULL, '2025-02-10', 10000.00, 12000.00),
(1000000003, 3, 1, 1, 1, '2025-03-05', 2000.00, 2500.00);
SELECT account_number, current_balance
FROM accounts
WHERE current_balance > 10000;

CREATE DATABASE loanmanagement_system;
use loanmanagement_system;

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    mobile_number VARCHAR(15) UNIQUE NOT NULL,
    email_address VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO customers (full_name, gender, date_of_birth, mobile_number, email_address)
VALUES 
('Aman Kumar Singh', 'Male', '1990-05-15', '9876543210', 'aman@example.com'),
('Neha Sharma', 'Female', '1988-11-23', '9876543211', 'neha@example.com');


CREATE TABLE loan_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL,
    description TEXT,
    max_allowed_amount DECIMAL(15,2) NOT NULL
);
INSERT INTO loan_types (type_name, description, max_allowed_amount)
VALUES
('Personal', 'Personal loan for any purpose', 500000),
('Auto', 'Loan for purchasing vehicles', 1500000),
('Home', 'Home loan for buying property', 5000000);


CREATE TABLE loan_applications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    loan_type_id INT NOT NULL,
    loan_amount_requested DECIMAL(15,2) NOT NULL,
    application_date DATE NOT NULL,
    approval_status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    tenure_months INT NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (loan_type_id) REFERENCES loan_types(id) ON DELETE CASCADE
);
INSERT INTO loan_applications (customer_id, loan_type_id, loan_amount_requested, application_date, approval_status, tenure_months, interest_rate)
VALUES
(1, 1, 200000, '2025-07-01', 'Approved', 24, 12.5),
(2, 3, 3500000, '2025-07-05', 'Pending', 120, 8.5);


CREATE TABLE loan_payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    loan_application_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount_paid DECIMAL(15,2) NOT NULL,
    mode_of_payment VARCHAR(50) NOT NULL,
    due_date DATE NOT NULL,
    FOREIGN KEY (loan_application_id) REFERENCES loan_applications(id) ON DELETE CASCADE
);
INSERT INTO loan_payments (loan_application_id, payment_date, amount_paid, mode_of_payment, due_date)
VALUES
(1, '2025-08-01', 10000, 'Online Transfer', '2025-08-01'),
(1, '2025-09-01', 10000, 'Cash', '2025-09-01');


CREATE TABLE collaterals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    loan_application_id INT NOT NULL,
    item_type VARCHAR(50) NOT NULL,
    estimated_value DECIMAL(15,2) NOT NULL,
    owner_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    document_name_or_number VARCHAR(100),
    FOREIGN KEY (loan_application_id) REFERENCES loan_applications(id) ON DELETE CASCADE
);
INSERT INTO collaterals (loan_application_id, item_type, estimated_value, owner_name, location, document_name_or_number)
VALUES
(2, 'Property', 4000000, 'Neha Sharma', 'Delhi', 'Property Deed #12345');
SELECT * FROM customers;
SELECT type_name, max_allowed_amount FROM loan_types;
SELECT * FROM loan_applications
WHERE approval_status = 'Approved';




 

