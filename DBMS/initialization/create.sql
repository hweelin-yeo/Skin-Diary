USE skinDiary;

CREATE TABLE customerPurchaseHistory(
    `customerId` VARCHAR(200) PRIMARY KEY,
    `purchaseOrder` INT UNSIGNED,
    `zipcode` VARCHAR(7),
    `location` VARCHAR(200),	
    `productId` INT UNSIGNED,
    `category` VARCHAR(200)
);

CREATE TABLE customer(
    `customerId` VARCHAR(200) PRIMARY KEY,
    `Age` INT UNSIGNED,
    `Gender` VARCHAR(7),
    `joinDate` DATETIME,
    `skinCondition` VARCHAR(200)
);

CREATE TABLE bestSellers(
    `productId` INT UNSIGNED PRIMARY KEY,
    `name` VARCHAR(200),
    `skinType` VARCHAR(200),
    `description` VARCHAR(200),
    `function` VARCHAR(200),
    `keywords` VARCHAR(200),
    `keyIngredients` VARCHAR(200),
    `concerns` VARCHAR(200)
);

CREATE TABLE bestSellersConcerns(
    `productId` INT UNSIGNED PRIMARY KEY,
    `concernId` INT UNSIGNED
);

CREATE TABLE bestSellerSkintypes(
    `productId` INT UNSIGNED PRIMARY KEY,
    `skinTypeID` INT UNSIGNED
);

CREATE TABLE concerns(
    `concernId` INT UNSIGNED PRIMARY KEY,
    `concern` VARCHAR(200)
);

CREATE TABLE skinTypes(
    `skinTypeID` INT UNSIGNED PRIMARY KEY,
    `skinType` VARCHAR(200)
);


