USE master;
CREATE DATABASE SWP391_FengShuiKoiConsultingPRN212_DB;
GO
USE SWP391_FengShuiKoiConsultingPRN212_DB;

-- Account Table
CREATE TABLE Account (
    UserID NVARCHAR(50) PRIMARY KEY,
    Password NVARCHAR(500) NOT NULL,
    Role NVARCHAR(255) NOT NULL,
    Email NVARCHAR(50) NOT NULL UNIQUE,
    Status NVARCHAR(255) NOT NULL
);

-- Member Table
CREATE TABLE Member (
    Name NVARCHAR(50) NOT NULL,
    Birthday DATE NOT NULL,
    UserID NVARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (UserID) REFERENCES Account(UserID)
);
-- Element Table
CREATE TABLE Element (
    ElementID NVARCHAR(50) PRIMARY KEY,
	Mutualism NVARCHAR(50) NOT NULL,
);
-- Package Table
CREATE TABLE Package (
    Rank NVARCHAR(50) PRIMARY KEY,
    Duration INT NOT NULL,
    Description NVARCHAR(255) NOT NULL,
	price FLOAT NOT NULL
);
-- Blog Table
CREATE TABLE Blog (
    BlogID NVARCHAR(50) PRIMARY KEY,
    Heading NVARCHAR(255) NOT NULL,
    Image NVARCHAR(MAX) NOT NULL,
    Link NVARCHAR(MAX) NOT NULL,
	status NVARCHAR(20) NOT NULL
);
-- Advertisement Table
CREATE TABLE Advertisement (
    AdID NVARCHAR(50) PRIMARY KEY,
    Heading NVARCHAR(255) NOT NULL,
    Image NVARCHAR(MAX) NOT NULL,
    Link NVARCHAR(MAX) NOT NULL,
    UserID NVARCHAR(50) NOT NULL,
    ElementID NVARCHAR(50),
	status NVARCHAR(10) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Member(UserID),
    FOREIGN KEY (ElementID) REFERENCES Element(ElementID)
);
-- Feedback Table
CREATE TABLE Feedback (
    FbID NVARCHAR(50) PRIMARY KEY,
    Description NVARCHAR(255) NOT NULL,
    AdID NVARCHAR(50) NOT NULL,
	Rate TINYINT NOT NULL,
    FOREIGN KEY (AdID) REFERENCES Advertisement(AdID),
	UserID NVARCHAR(50) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Member(UserID)
);

-- Ads_Package Table
CREATE TABLE Ads_Package (
    AdID NVARCHAR(50) NOT NULL,
    Rank NVARCHAR(50) NOT NULL,
	StartDate DATE NOT NULL,
	ExpiredDate DATE NOT NULL,
	Quantity INT NOT NULL,
	Total FLOAT NOT NULL,
	CreateAt DATETIME NOT NULL,
	PRIMARY KEY (AdID, Rank,CreateAt),
    FOREIGN KEY (AdID) REFERENCES Advertisement(AdID),
    FOREIGN KEY (Rank) REFERENCES Package(Rank)
);
-- Shape Table
CREATE TABLE Shape (
    ShapeID NVARCHAR(50) PRIMARY KEY,
	image NVARCHAR(MAX) NOT NULL
);

-- Quantity Table
CREATE TABLE QuantityOfFish (
    ElementID NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255) NOT NULL,
	PRIMARY KEY (ElementID),
    FOREIGN KEY (ElementID) REFERENCES Element(ElementID)
);

-- PointOfShape Table
CREATE TABLE PointOfShape (
    Point FLOAT NOT NULL,
    ElementID NVARCHAR(50) NOT NULL,
    ShapeID NVARCHAR(50) NOT NULL,
    PRIMARY KEY (ElementID, ShapeID),
    FOREIGN KEY (ElementID) REFERENCES Element(ElementID),
    FOREIGN KEY (ShapeID) REFERENCES Shape(ShapeID)
);

-- Koi_Variety Table
CREATE TABLE Koi_Variety (
    KoiType NVARCHAR(50) PRIMARY KEY,
    Image NVARCHAR(MAX) NOT NULL,
    Element NVARCHAR(50) NOT NULL,
    Description NVARCHAR(500) NOT NULL
);

-- Color Table
CREATE TABLE Color (
    ColorID NVARCHAR(50) PRIMARY KEY
);

-- Type_Color Table
CREATE TABLE Type_Color (
    KoiType NVARCHAR(50) NOT NULL,
    ColorID NVARCHAR(50) NOT NULL,
    Percentage FLOAT NOT NULL,
    PRIMARY KEY (KoiType, ColorID),
    FOREIGN KEY (KoiType) REFERENCES Koi_Variety(KoiType),
    FOREIGN KEY (ColorID) REFERENCES Color(ColorID)
);


-- Element_Color Table
CREATE TABLE Element_Color (
    ElementID NVARCHAR(50) NOT NULL,
    ColorID NVARCHAR(50) NOT NULL,
    ColorPoint FLOAT NOT NULL,
    PRIMARY KEY (ElementID, ColorID),
    FOREIGN KEY (ElementID) REFERENCES Element(ElementID),
    FOREIGN KEY (ColorID) REFERENCES Color(ColorID)
);

-- Direction Direction
CREATE TABLE Direction (
    DirectionID NVARCHAR(50) PRIMARY KEY
);

-- LifePalace LifePalace
CREATE TABLE LifePalace (
    LifePalaceID NVARCHAR(50) PRIMARY KEY
);

-- LifePalace_Direction Table
CREATE TABLE LifePalace_Direction (
    LifePalaceID NVARCHAR(50) NOT NULL,
    DirectionID NVARCHAR(50) NOT NULL,
    EightMansions NVARCHAR(50) NOT NULL,
    PointOfDirection FLOAT NOT NULL,
    Description NVARCHAR(255) NOT NULL,
    PRIMARY KEY (LifePalaceID, DirectionID),
    FOREIGN KEY (LifePalaceID) REFERENCES LifePalace(LifePalaceID),
    FOREIGN KEY (DirectionID) REFERENCES Direction(DirectionID)
);
