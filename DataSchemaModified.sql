-- Створення таблиці "User"
CREATE TABLE User (
    ID VARCHAR(36) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL CHECK (FirstName LIKE '[A-Z]%'),
    LastName VARCHAR(50) NOT NULL CHECK (LastName LIKE '[A-Z]%'),
    DateOfBirth DATE NOT NULL
);

-- Створення таблиці "PhysicalMetrics"
CREATE TABLE PhysicalMetrics (
    ID VARCHAR(36) PRIMARY KEY,
    Weight DOUBLE PRECISION NOT NULL CHECK (Weight > 0),
    Height DOUBLE PRECISION NOT NULL CHECK (Height > 0),
    WaistCircumference DOUBLE PRECISION CHECK (WaistCircumference > 0),
    BodyFatPercentage DOUBLE PRECISION CHECK (BodyFatPercentage BETWEEN 0 AND 100),
    MeasurementDate DATE NOT NULL,
    UserID VARCHAR(36) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(ID)
);

-- Створення таблиці "System"
CREATE TABLE System (
    ID VARCHAR(36) PRIMARY KEY
);

-- Створення таблиці "Analysis"
CREATE TABLE Analysis (
    ID VARCHAR(36) PRIMARY KEY,
    HealthStatus TEXT NOT NULL,
    UserProgress TEXT NOT NULL,
    DataTrends TEXT NOT NULL,
    PhysicalMetricsID VARCHAR(36) NOT NULL,
    FOREIGN KEY (PhysicalMetricsID) REFERENCES PhysicalMetrics(ID)
);
