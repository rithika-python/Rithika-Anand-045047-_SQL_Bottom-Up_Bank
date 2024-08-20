create database bank;
use bank;

-- Creating the Customers Table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    date_of_birth DATE,
    pan_number CHAR(10),
    aadhaar_number CHAR(12),
    passport_number VARCHAR(8),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating the Accounts Table
CREATE TABLE Accounts (
    account_id INTEGER PRIMARY KEY AUTOINCREMENT,
    account_number CHAR(10) NOT NULL UNIQUE,
    account_type VARCHAR(50) NOT NULL,
    branch_code CHAR(5) NOT NULL,
    customer_id INTEGER NOT NULL,
    initial_deposit DECIMAL(10,2),
    mode_of_operation VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creating the Nominees Table
CREATE TABLE Nominees (
    nominee_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    relationship VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    customer_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creating the Service Requests Table
CREATE TABLE ServiceRequests (
    service_id INTEGER PRIMARY KEY AUTOINCREMENT,
    service_type VARCHAR(100) NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    customer_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creating the Documents Table
CREATE TABLE Documents (
    document_id INTEGER PRIMARY KEY AUTOINCREMENT,
    document_type VARCHAR(50) NOT NULL,
    document_number VARCHAR(20) NOT NULL,


    customer_id INTEGER NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Inserting Data into the Customers Table
INSERT INTO Customers (name, address, contact_number, email, date_of_birth, pan_number, aadhaar_number, passport_number)
VALUES
('Anjali Kumari', '123 Main St, New Delhi', '9876543210', 'anjali@example.com', '1990-01-15', 'ABCDE1234F', '123456789012', 'N1234567'),
('Anurag Sharma', '456 Elm St, Mumbai', '9876543211', 'anurag@example.com', '1988-05-20', 'BCDEA2345G', '234567890123', 'N2345678'),
('Vishal Kaushik', '789 Oak St, Bengaluru', '9876543212', 'vishal@example.com', '1992-07-10', 'CDEAB3456H', '345678901234', 'N3456789'),
('Rithika Anand', '321 Pine St, Chennai', '9876543213', 'rithika@example.com', '1995-09-25', 'DEABC4567I', '456789012345', 'N4567890');

-- Inserting Data into the Accounts Table
INSERT INTO Accounts (account_number, account_type, branch_code, customer_id, initial_deposit, mode_of_operation)
VALUES
('ACC1234561', 'Savings', 'BR001', 1, 10000.00, 'Self'),
('ACC1234562', 'Savings', 'BR002', 2, 20000.00, 'Joint'),
('ACC1234563', 'Current', 'BR003', 3, 15000.00, 'Self'),
('ACC1234564', 'Savings', 'BR004', 4, 25000.00, 'Self');

-- Inserting Data into the Nominees Table
INSERT INTO Nominees (name, relationship, address, customer_id)
VALUES
('Nitu Kumari', 'Mother', '123 Main St, New Delhi', 1),
('Arvind Sharma', 'Father', '456 Elm St, Mumbai', 2),
('Ashok Kaushik', 'Father', '789 Oak St, Bengaluru', 3),
('Sona Anand', 'Mother', '321 Pine St, Chennai', 4);

-- Inserting Data into the Service Requests Table
INSERT INTO ServiceRequests (service_type, status, customer_id)
VALUES
('Cheque Book Request', 'Completed', 1),
('Address Change Request', 'Pending', 2),
('ATM Card Request', 'Completed', 3),
('Mobile Number Update', 'Pending', 4);

-- Inserting Data into the Documents Table
INSERT INTO Documents (document_type, document_number, customer_id)
VALUES
('PAN Card', 'ABCDE1234F', 1),
('Aadhaar Card', '123456789012', 1),
('PAN Card', 'BCDEA2345G', 2),
('Aadhaar Card', '234567890123', 2),
('PAN Card', 'CDEAB3456H', 3),
('Aadhaar Card', '345678901234', 3),
('PAN Card', 'DEABC4567I', 4),
('Aadhaar Card', '456789012345', 4);