-- Create new table with atomic values
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Insert normalized data
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John ', 'Laptop'),
(101, 'John ', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Table for orders (no partial dependency)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Table for order details (composite key)
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert into Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John '),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert into OrderDetails_2NF table
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
