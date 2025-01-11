-- Створення таблиці "Користувач"
CREATE TABLE Користувач (
    Ідентифікатор VARCHAR(36) PRIMARY KEY, -- UUID
    Ім'я VARCHAR(50) NOT NULL CHECK (Ім'я ~ '^[A-ZА-ЯІЇЄҐ][a-zа-яіїєґ]+$'), -- Перше слово з великої літери
    Прізвище VARCHAR(50) NOT NULL CHECK (Прізвище ~ '^[A-ZА-ЯІЇЄҐ][a-zа-яіїєґ]+$'), -- Перше слово з великої літери
    Дата_народження DATE NOT NULL
);

-- Створення таблиці "Фізичні показники"
CREATE TABLE Фізичні_показники (
    Ідентифікатор VARCHAR(36) PRIMARY KEY, -- UUID
    Вага DOUBLE PRECISION NOT NULL CHECK (Вага > 0), -- Позитивна вага
    Зріст DOUBLE PRECISION NOT NULL CHECK (Зріст > 0), -- Позитивний зріст
    Об'єм_талії DOUBLE PRECISION CHECK (Об'єм_талії > 0), -- Позитивний об'єм
    Рівень_жиру_в_організмі DOUBLE PRECISION CHECK (Рівень_жиру_в_організмі >= 0 AND Рівень_жиру_в_організмі <= 100), -- Відсоткове значення
    Дата_вимірювання DATE NOT NULL,
    Користувач_ID VARCHAR(36) NOT NULL,
    FOREIGN KEY (Користувач_ID) REFERENCES Користувач(Ідентифікатор)
);

-- Створення таблиці "Система"
CREATE TABLE Система (
    Ідентифікатор VARCHAR(36) PRIMARY KEY -- UUID
);

-- Створення таблиці "Аналіз"
CREATE TABLE Аналіз (
    Ідентифікатор VARCHAR(36) PRIMARY KEY, -- UUID
    Поточний_стан_здоров'я TEXT NOT NULL,
    Прогрес_користувача TEXT NOT NULL,
    Тренди_даних TEXT NOT NULL,
    Фізичні_показники_ID VARCHAR(36) NOT NULL,
    FOREIGN KEY (Фізичні_показники_ID) REFERENCES Фізичні_показники(Ідентифікатор)
);
