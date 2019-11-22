USE skinDiary;

CREATE TABLE customerPurchaseHistory(
    `purchaseOrder` INT UNSIGNED PRIMARY KEY,
    `customerId` VARCHAR(200),
    `zipcode` VARCHAR(7),
    `location` VARCHAR(200),
    `orderDate` DATETIME
);

CREATE TABLE purchaseProducts(
	`purchaseOrder` INT UNSIGNED NOT NULL,
	`productId` INT UNSIGNED NOT NULL,
    `productName` VARCHAR(200),
    CONSTRAINT purchaseId_productId PRIMARY KEY(`purchaseOrder`, `productId`)
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
    `description` VARCHAR(200),
    `productFunction` VARCHAR(200),
    `keywords` VARCHAR(200),
    `keyIngredients` VARCHAR(500)
);

CREATE TABLE bestSellersConcerns(
    `productId` INT UNSIGNED NOT NULL,
    `concernId` INT UNSIGNED NOT NULL,
    CONSTRAINT productId_concernId PRIMARY KEY(`productId`, `concernId`)
);

CREATE TABLE bestSellerSkintypes(
    `productId` INT UNSIGNED NOT NULL,
    `skinTypeId` INT UNSIGNED NOT NULL,
    CONSTRAINT productId_concernId PRIMARY KEY(`productId`, `skinTypeID`)
);

CREATE TABLE concerns(
    `concernId` INT UNSIGNED NOT NULL,
    `concern` VARCHAR(200) NOT NULL,
    CONSTRAINT productId_concernId PRIMARY KEY(`concernId`, `concern`)
);

CREATE TABLE skinTypes(
    `skinTypeId` INT UNSIGNED NOT NULL,
    `skinType` VARCHAR(200) NOT NULL,
    CONSTRAINT productId_concernId PRIMARY KEY(`skinTypeID`, `skinType`)
);

CREATE TABLE customerInputs(
	`dateCustomerId` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`customerId` VARCHAR(200),
    `mood` VARCHAR(200),
    `cupsOfWater` INT UNSIGNED,
    `sleepHours` INT UNSIGNED,
    `vegeFruit` BOOL,
    `refinedCarbs` BOOL,
    `sugar` BOOL,
    `dairy` BOOL,
	`meat` BOOL,
    `seafood` BOOL, 
    `dateOfEntry` DATETIME
);

CREATE TABLE entryProducts(
	`dateCustomerId` INT UNSIGNED NOT NULL,
    `productId` INT UNSIGNED NOT NULL,
    CONSTRAINT dateCustomerId_productId PRIMARY KEY(`dateCustomerId`, `productId`)
);    
	

