-- CreateTable
CREATE TABLE `agent` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `logo` VARCHAR(255) NULL,
    `background` VARCHAR(255) NULL,
    `description` VARCHAR(3000) NULL,
    `address` VARCHAR(255) NULL,
    `ratings` INTEGER NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NULL,
    `featured` BOOLEAN NOT NULL DEFAULT false,
    `clientId` VARCHAR(191) NULL,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `facebook` VARCHAR(255) NULL,
    `instagram` VARCHAR(255) NULL,
    `website` VARCHAR(255) NULL,
    `twitter` VARCHAR(255) NULL,
    `linkedin` VARCHAR(255) NULL,
    `subdomain` VARCHAR(255) NULL,
    `subdomainUrl` VARCHAR(255) NULL,

    UNIQUE INDEX `agent_clientId_key`(`clientId`),
    UNIQUE INDEX `agent_subdomain_key`(`subdomain`),
    UNIQUE INDEX `agent_subdomainUrl_key`(`subdomainUrl`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `agent_site_setting` (
    `id` VARCHAR(191) NOT NULL,
    `pages` JSON NOT NULL,
    `homeSettings` JSON NOT NULL,
    `agentId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `agent_site_setting_agentId_key`(`agentId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `agent_site_featured_properties` (
    `id` VARCHAR(191) NOT NULL,
    `propertyId` VARCHAR(191) NOT NULL,
    `clientId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `agent_site_featured_properties_propertyId_key`(`propertyId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `agent_cities_city` (
    `agentId` VARCHAR(191) NOT NULL,
    `cityId` VARCHAR(191) NOT NULL,

    INDEX `IDX_a43359454fdaaa491af75913a4`(`agentId`),
    INDEX `IDX_ec4231dc26dd099f65295b5f72`(`cityId`),
    PRIMARY KEY (`agentId`, `cityId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `city` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `location` point NULL,
    `longtitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `isPublished` BOOLEAN NOT NULL DEFAULT false,
    `sortingPriority` INTEGER NOT NULL,
    `provinceId` VARCHAR(191) NULL,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NULL,

    INDEX `FK_95959bed787b5e4fd4be4e94fc5`(`provinceId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `name` VARCHAR(255) NULL,
    `picture` VARCHAR(255) NULL,
    `email` VARCHAR(255) NOT NULL,
    `active` BOOLEAN NULL DEFAULT true,
    `referral` VARCHAR(255) NULL,
    `password` VARCHAR(255) NULL,
    `resetToken` VARCHAR(255) NULL,
    `nickname` VARCHAR(255) NULL,
    `locked` TINYINT NOT NULL DEFAULT 0,
    `language` ENUM('es', 'en') NULL,
    `verificationToken` VARCHAR(191) NULL,
    `verificationDateSent` DATETIME(3) NULL,
    `verified` BOOLEAN NULL DEFAULT false,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NOT NULL DEFAULT 'bo',

    UNIQUE INDEX `client_email_key`(`email`),
    UNIQUE INDEX `client_verificationToken_key`(`verificationToken`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client_favorites_property` (
    `clientId` VARCHAR(191) NOT NULL,
    `propertyId` VARCHAR(191) NOT NULL,

    INDEX `IDX_3bec42d09eed13e0736e81d9dd`(`clientId`),
    INDEX `IDX_d2ba97838865f6d840f1994284`(`propertyId`),
    PRIMARY KEY (`clientId`, `propertyId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contact_form` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `clientId` VARCHAR(191) NULL,

    INDEX `FK_0e6799c5de62a5d9335285a3513`(`clientId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `course` (
    `id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `videoId` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `series` VARCHAR(255) NOT NULL,
    `recommended` TINYINT NULL DEFAULT 0,
    `offer` TINYINT NULL DEFAULT 0,
    `thumbnail_url` VARCHAR(255) NULL,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NULL,
    `userOnly` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `course_insight` (
    `id` VARCHAR(191) NOT NULL,
    `courseId` VARCHAR(191) NULL,
    `clientId` VARCHAR(191) NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    INDEX `FK_62391d11ff96129c8e915aae7b6`(`clientId`),
    INDEX `FK_c821e21a6472945a456a08a2e5f`(`courseId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `email_schedule` (
    `id` VARCHAR(191) NOT NULL,
    `searchId` VARCHAR(191) NOT NULL,
    `numOfProperties` INTEGER NOT NULL,
    `delivered` BOOLEAN NOT NULL,
    `reason` VARCHAR(255) NOT NULL DEFAULT '',
    `lastSent` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `email_schedule_searchId_key`(`searchId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enquiry` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `name` VARCHAR(255) NOT NULL DEFAULT '',
    `email` VARCHAR(255) NOT NULL DEFAULT '',
    `onlineVisit` BOOLEAN NOT NULL DEFAULT false,
    `visit` BOOLEAN NOT NULL DEFAULT false,
    `location` BOOLEAN NOT NULL DEFAULT false,
    `moreDetails` BOOLEAN NOT NULL DEFAULT false,
    `morePhotos` BOOLEAN NOT NULL DEFAULT false,
    `anotherQuestion` VARCHAR(255) NOT NULL DEFAULT '',
    `clientId` VARCHAR(191) NOT NULL,
    `propertyId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `exchange_rate` (
    `id` VARCHAR(191) NOT NULL,
    `currency` VARCHAR(255) NOT NULL,
    `rate` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `friendly_name` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(255) NOT NULL DEFAULT '',
    `agentId` VARCHAR(191) NULL,

    UNIQUE INDEX `friendly_name_name_key`(`name`),
    UNIQUE INDEX `friendly_name_agentId_key`(`agentId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `news_letter` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `ip_address` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,

    UNIQUE INDEX `news_letter_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `photo` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `name` VARCHAR(255) NULL,
    `url` VARCHAR(255) NOT NULL,
    `isOptimized` BOOLEAN NOT NULL DEFAULT false,
    `isPublished` TINYINT NOT NULL,
    `propertyId` VARCHAR(191) NULL,
    `sortNumber` INTEGER NULL,

    INDEX `FK_3c436075fa7feb9f9fb9e20f61b`(`propertyId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `property` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `location` point NULL,
    `longtitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `address` VARCHAR(255) NOT NULL,
    `propertyType` ENUM('flat', 'house', 'land', 'commercialLocal', 'office', 'countryHouse', 'parking', 'building', 'room', 'condominium', 'warehouse', 'multiFamilyHomes', 'chalet', 'study', 'penthouse', 'floor') NOT NULL,
    `contractType` ENUM('sale', 'rent', 'vacationRental', 'antiCritical') NOT NULL,
    `price` DOUBLE NULL,
    `parking` INTEGER NULL,
    `bedrooms` INTEGER NULL,
    `bathrooms` INTEGER NULL,
    `landArea` DOUBLE NULL,
    `propertyArea` DOUBLE NULL,
    `carSpace` SMALLINT NULL,
    `floorsNumber` MEDIUMINT NULL,
    `buildYear` MEDIUMINT NULL,
    `isNewBuilding` BOOLEAN NULL,
    `currency` ENUM('USD', 'BOB', 'GBP', 'EUR', 'CLP') NOT NULL,
    `referenceCode` VARCHAR(255) NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `isPublished` BOOLEAN NOT NULL DEFAULT true,
    `condition` ENUM('new', 'good', 'reform') NULL,
    `expenses` BOOLEAN NOT NULL,
    `isDisabled` BOOLEAN NOT NULL DEFAULT false,
    `cityId` VARCHAR(191) NULL,
    `zoneId` VARCHAR(191) NULL,
    `clientId` VARCHAR(191) NULL,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NULL,
    `normalizedPrice` DOUBLE NULL,
    `consumptionType` ENUM('A', 'B', 'C', 'D', 'E', 'F', 'G') NULL,
    `consumption` INTEGER NULL,
    `emissionType` ENUM('A', 'B', 'C', 'D', 'E', 'F', 'G') NULL,
    `emission` INTEGER NULL,
    `views` INTEGER NULL,
    `isArchived` BOOLEAN NOT NULL DEFAULT false,
    `test` BOOLEAN NOT NULL DEFAULT false,

    INDEX `FK_0cbc6a36b6436779b6bd711cbf2`(`clientId`),
    INDEX `FK_2c9571019f7b873765cf1ad4dcd`(`cityId`),
    INDEX `FK_92284fd7dd876b6120219f363f5`(`zoneId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `property_characteristics` (
    `id` VARCHAR(191) NOT NULL,
    `characteristic` ENUM('airConditioner', 'petFriendly', 'elevator', 'storage', 'furnished', 'heating', 'gas', 'pets', 'diningRoom', 'service', 'pool', 'grill', 'gym', 'closedC', 'clubHouse', 'garden', 'older', 'accesible', 'alarm', 'laundry', 'security', 'parking', 'multipurposeRooms', 'cat2', 'hepps', 'floors', 'balcony', 'terrace', 'fiberOptic', 'beachNearby', 'seaView', 'garage', 'playground', 'washerDryer', 'dishwasher') NOT NULL,
    `propertyId` VARCHAR(191) NULL,

    INDEX `FK_c407227959eb71c5324cf3affbd`(`propertyId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `property_insight` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `ipAddress` TEXT NULL,
    `geoLocation` VARCHAR(5) NULL,
    `clientId` VARCHAR(191) NULL,
    `propertyId` VARCHAR(191) NULL,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NULL,

    INDEX `FK_57c42640e02e04440071314b3ff`(`propertyId`),
    INDEX `FK_da2d0709f015db6bfd0aca4cf06`(`clientId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `property_tours` (
    `id` VARCHAR(191) NOT NULL,
    `tourLink` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `propertyId` VARCHAR(191) NULL,

    INDEX `FK_358b6d17177e11ab993fac9a22b`(`propertyId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `property_videos` (
    `id` VARCHAR(191) NOT NULL,
    `videoId` VARCHAR(255) NOT NULL,
    `platform` ENUM('youtube', 'vimeo') NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `propertyId` VARCHAR(191) NULL,

    INDEX `FK_3706b74ed9ba1bf38ded5bcedb7`(`propertyId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `province` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `name` VARCHAR(255) NOT NULL,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NULL,

    UNIQUE INDEX `province_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `search` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `name` VARCHAR(255) NOT NULL,
    `propertyType` VARCHAR(255) NULL,
    `contractType` VARCHAR(255) NULL,
    `minSize` VARCHAR(255) NULL,
    `maxSize` VARCHAR(255) NULL,
    `minPrice` VARCHAR(255) NULL,
    `maxPrice` VARCHAR(255) NULL,
    `bathrooms` VARCHAR(255) NULL,
    `bedrooms` VARCHAR(255) NULL,
    `instantAlert` TINYINT NOT NULL,
    `clientId` VARCHAR(191) NOT NULL,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NULL,
    `city` VARCHAR(255) NULL,
    `zone` VARCHAR(255) NULL,

    INDEX `FK_4dd2f17beb2093ebcec01563575`(`clientId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `search_insight` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `contractType` ENUM('sale', 'rent', 'vacationRental', 'antiCritical') NULL,
    `minSize` VARCHAR(255) NULL,
    `maxSize` VARCHAR(255) NULL,
    `minPrice` TEXT NULL,
    `maxPrice` TEXT NULL,
    `bedrooms` TEXT NULL,
    `bathrooms` TEXT NULL,
    `ipAddress` VARCHAR(100) NULL,
    `geoLocation` VARCHAR(5) NULL,
    `cityId` VARCHAR(191) NULL,
    `zoneId` VARCHAR(191) NULL,
    `clientId` VARCHAR(191) NULL,
    `propertyType` TEXT NULL,

    INDEX `FK_10839162d856ffb3af4c9186af4`(`zoneId`),
    INDEX `FK_965e17fa95cc869e0f928174df1`(`clientId`),
    INDEX `FK_d1d320f75acbfb286513492a963`(`cityId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subscriber` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `name` VARCHAR(255) NOT NULL DEFAULT '',
    `email` VARCHAR(255) NOT NULL DEFAULT '',
    `clientId` VARCHAR(255) NOT NULL DEFAULT '',
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NULL,

    UNIQUE INDEX `subscriber_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `service_company` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `logo` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `address` VARCHAR(255) NULL,
    `ratings` INTEGER NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NULL,
    `clientId` VARCHAR(191) NOT NULL,
    `cityId` VARCHAR(191) NULL,
    `zoneId` VARCHAR(191) NULL,
    `longtitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `currency` ENUM('USD', 'BOB', 'GBP', 'EUR', 'CLP') NOT NULL,
    `price` DOUBLE NULL,
    `normalizedPrice` DOUBLE NULL,
    `categoryId` VARCHAR(191) NOT NULL,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `facebook` VARCHAR(255) NULL,
    `instagram` VARCHAR(255) NULL,
    `website` VARCHAR(255) NULL,
    `twitter` VARCHAR(255) NULL,
    `linkedin` VARCHAR(255) NULL,
    `isDisabled` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `service_category` (
    `id` VARCHAR(191) NOT NULL,
    `category` VARCHAR(191) NOT NULL,
    `parentId` VARCHAR(191) NULL,

    UNIQUE INDEX `service_category_category_key`(`category`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `zone` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `location` point NULL,
    `longtitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `area` polygon NULL,
    `isPublished` TINYINT NOT NULL,
    `sortingPriority` INTEGER NOT NULL,
    `cityId` VARCHAR(191) NULL,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NULL,

    INDEX `FK_fd888d571e58d1d50c70fc9d755`(`cityId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `panorama_images` (
    `id` VARCHAR(191) NOT NULL,
    `url` VARCHAR(191) NOT NULL,
    `panoramaId` VARCHAR(191) NULL,
    `floorId` VARCHAR(191) NOT NULL,
    `roomName` VARCHAR(191) NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `panorama` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(255) NULL,
    `address` VARCHAR(255) NULL,
    `thumbnail` VARCHAR(255) NULL,
    `clientId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `panorama_property_floor` (
    `id` VARCHAR(191) NOT NULL,
    `panoramaId` VARCHAR(191) NOT NULL,
    `floorName` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `features` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NOT NULL DEFAULT 'all',
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `plan_prices` (
    `id` VARCHAR(191) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `currency` ENUM('USD', 'BOB', 'GBP', 'EUR', 'CLP') NOT NULL,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NOT NULL,
    `planId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `plan` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `planImage` VARCHAR(191) NULL,
    `planType` ENUM('single', 'bundle') NOT NULL,
    `stripeId` JSON NULL,
    `userType` ENUM('all', 'agent', 'client') NOT NULL DEFAULT 'all',
    `trial` BOOLEAN NOT NULL DEFAULT false,
    `haveTrialPeriod` BOOLEAN NOT NULL DEFAULT false,
    `trialInterval` INTEGER NULL,
    `trialIntervalCount` ENUM('days', 'month', 'year') NULL,
    `interval` INTEGER NULL,
    `intervalCount` ENUM('days', 'month', 'year') NULL,
    `isActive` BOOLEAN NOT NULL,
    `planTitle` JSON NULL,
    `cardText` JSON NULL,
    `sort` INTEGER NULL,
    `country` ENUM('bo', 'gi', 'all', 'cl', 'es') NOT NULL DEFAULT 'all',
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `plan_features` (
    `id` VARCHAR(191) NOT NULL,
    `planId` VARCHAR(191) NOT NULL,
    `featureId` VARCHAR(191) NOT NULL,
    `propertyAds` INTEGER NULL,
    `hasExpiry` BOOLEAN NOT NULL DEFAULT false,
    `interval` INTEGER NULL,
    `intervalCount` ENUM('days', 'month', 'year') NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `plan_subscriptions` (
    `id` VARCHAR(191) NOT NULL,
    `clientId` VARCHAR(191) NOT NULL,
    `planId` VARCHAR(191) NOT NULL,
    `startAt` DATETIME(3) NOT NULL,
    `endAt` DATETIME(3) NULL,
    `code` VARCHAR(191) NOT NULL,
    `isActive` BOOLEAN NOT NULL,
    `subscription` VARCHAR(191) NULL,
    `onTrialDuration` BOOLEAN NOT NULL DEFAULT false,
    `defaultUse` BOOLEAN NULL DEFAULT false,
    `isCancelled` BOOLEAN NULL DEFAULT false,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subscription_plan_usages` (
    `id` VARCHAR(191) NOT NULL,
    `planId` VARCHAR(191) NOT NULL,
    `subscriptionId` VARCHAR(191) NOT NULL,
    `clientId` VARCHAR(191) NOT NULL,
    `propertyId` VARCHAR(191) NOT NULL,
    `featureId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `hidden_address` (
    `id` VARCHAR(191) NOT NULL,
    `propertyId` VARCHAR(191) NOT NULL,
    `subscriptionId` VARCHAR(191) NOT NULL,
    `endAt` DATETIME(3) NULL,

    UNIQUE INDEX `hidden_address_propertyId_key`(`propertyId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `positional_preference` (
    `id` VARCHAR(191) NOT NULL,
    `propertyId` VARCHAR(191) NOT NULL,
    `subscriptionId` VARCHAR(191) NOT NULL,
    `endAt` DATETIME(3) NULL,

    UNIQUE INDEX `positional_preference_propertyId_key`(`propertyId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `featured_property` (
    `id` VARCHAR(191) NOT NULL,
    `propertyId` VARCHAR(191) NOT NULL,
    `subscriptionId` VARCHAR(191) NOT NULL,
    `endAt` DATETIME(3) NULL,

    UNIQUE INDEX `featured_property_propertyId_key`(`propertyId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `no_advertisements` (
    `id` VARCHAR(191) NOT NULL,
    `propertyId` VARCHAR(191) NOT NULL,
    `subscriptionId` VARCHAR(191) NOT NULL,
    `endAt` DATETIME(3) NULL,

    UNIQUE INDEX `no_advertisements_propertyId_key`(`propertyId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Appointments` (
    `id` VARCHAR(191) NOT NULL,
    `message` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NULL,
    `email` VARCHAR(191) NOT NULL,
    `interest` JSON NULL,
    `createdAt` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `blog_category` (
    `id` VARCHAR(191) NOT NULL,
    `name` JSON NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `sort` INTEGER NOT NULL,
    `featuredImage` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `blog_posts` (
    `id` VARCHAR(191) NOT NULL,
    `publishedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `featuredImage` VARCHAR(191) NOT NULL,
    `isFeatured` BOOLEAN NOT NULL,
    `views` INTEGER NOT NULL DEFAULT 0,
    `excerpt` LONGTEXT NOT NULL,
    `author` VARCHAR(191) NOT NULL,
    `body` LONGTEXT NOT NULL,
    `language` ENUM('es', 'en') NOT NULL DEFAULT 'es',
    `slug` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `blogCategoryId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `agent` ADD CONSTRAINT `agent_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `agent_site_setting` ADD CONSTRAINT `agent_site_setting_agentId_fkey` FOREIGN KEY (`agentId`) REFERENCES `agent`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `agent_site_featured_properties` ADD CONSTRAINT `agent_site_featured_properties_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `agent_site_featured_properties` ADD CONSTRAINT `agent_site_featured_properties_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `agent_cities_city` ADD CONSTRAINT `agent_cities_city_agentId_fkey` FOREIGN KEY (`agentId`) REFERENCES `agent`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `agent_cities_city` ADD CONSTRAINT `agent_cities_city_cityId_fkey` FOREIGN KEY (`cityId`) REFERENCES `city`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `city` ADD CONSTRAINT `city_provinceId_fkey` FOREIGN KEY (`provinceId`) REFERENCES `province`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `client_favorites_property` ADD CONSTRAINT `client_favorites_property_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `client_favorites_property` ADD CONSTRAINT `client_favorites_property_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `contact_form` ADD CONSTRAINT `contact_form_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `course_insight` ADD CONSTRAINT `course_insight_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `course_insight` ADD CONSTRAINT `course_insight_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `course`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `email_schedule` ADD CONSTRAINT `email_schedule_searchId_fkey` FOREIGN KEY (`searchId`) REFERENCES `search`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `enquiry` ADD CONSTRAINT `enquiry_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `enquiry` ADD CONSTRAINT `enquiry_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `friendly_name` ADD CONSTRAINT `friendly_name_agentId_fkey` FOREIGN KEY (`agentId`) REFERENCES `agent`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `photo` ADD CONSTRAINT `photo_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `property` ADD CONSTRAINT `property_cityId_fkey` FOREIGN KEY (`cityId`) REFERENCES `city`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `property` ADD CONSTRAINT `property_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `property` ADD CONSTRAINT `property_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `zone`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `property_characteristics` ADD CONSTRAINT `property_characteristics_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `property_insight` ADD CONSTRAINT `property_insight_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `property_insight` ADD CONSTRAINT `property_insight_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `property_tours` ADD CONSTRAINT `property_tours_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `property_videos` ADD CONSTRAINT `property_videos_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `search` ADD CONSTRAINT `search_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `search_insight` ADD CONSTRAINT `search_insight_cityId_fkey` FOREIGN KEY (`cityId`) REFERENCES `city`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `search_insight` ADD CONSTRAINT `search_insight_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `search_insight` ADD CONSTRAINT `search_insight_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `zone`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `service_company` ADD CONSTRAINT `service_company_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `service_company` ADD CONSTRAINT `service_company_cityId_fkey` FOREIGN KEY (`cityId`) REFERENCES `city`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `service_company` ADD CONSTRAINT `service_company_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `service_category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `service_company` ADD CONSTRAINT `service_company_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `zone`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `service_category` ADD CONSTRAINT `service_category_parentId_fkey` FOREIGN KEY (`parentId`) REFERENCES `service_category`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `zone` ADD CONSTRAINT `zone_cityId_fkey` FOREIGN KEY (`cityId`) REFERENCES `city`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `panorama_images` ADD CONSTRAINT `panorama_images_panoramaId_fkey` FOREIGN KEY (`panoramaId`) REFERENCES `panorama`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `panorama_images` ADD CONSTRAINT `panorama_images_floorId_fkey` FOREIGN KEY (`floorId`) REFERENCES `panorama_property_floor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `panorama` ADD CONSTRAINT `panorama_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `panorama_property_floor` ADD CONSTRAINT `panorama_property_floor_panoramaId_fkey` FOREIGN KEY (`panoramaId`) REFERENCES `panorama`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `plan_prices` ADD CONSTRAINT `plan_prices_planId_fkey` FOREIGN KEY (`planId`) REFERENCES `plan`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `plan_features` ADD CONSTRAINT `plan_features_planId_fkey` FOREIGN KEY (`planId`) REFERENCES `plan`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `plan_features` ADD CONSTRAINT `plan_features_featureId_fkey` FOREIGN KEY (`featureId`) REFERENCES `features`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `plan_subscriptions` ADD CONSTRAINT `plan_subscriptions_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `plan_subscriptions` ADD CONSTRAINT `plan_subscriptions_planId_fkey` FOREIGN KEY (`planId`) REFERENCES `plan`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subscription_plan_usages` ADD CONSTRAINT `subscription_plan_usages_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subscription_plan_usages` ADD CONSTRAINT `subscription_plan_usages_planId_fkey` FOREIGN KEY (`planId`) REFERENCES `plan`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subscription_plan_usages` ADD CONSTRAINT `subscription_plan_usages_featureId_fkey` FOREIGN KEY (`featureId`) REFERENCES `features`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subscription_plan_usages` ADD CONSTRAINT `subscription_plan_usages_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subscription_plan_usages` ADD CONSTRAINT `subscription_plan_usages_subscriptionId_fkey` FOREIGN KEY (`subscriptionId`) REFERENCES `plan_subscriptions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `hidden_address` ADD CONSTRAINT `hidden_address_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `hidden_address` ADD CONSTRAINT `hidden_address_subscriptionId_fkey` FOREIGN KEY (`subscriptionId`) REFERENCES `plan_subscriptions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `positional_preference` ADD CONSTRAINT `positional_preference_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `positional_preference` ADD CONSTRAINT `positional_preference_subscriptionId_fkey` FOREIGN KEY (`subscriptionId`) REFERENCES `plan_subscriptions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `featured_property` ADD CONSTRAINT `featured_property_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `featured_property` ADD CONSTRAINT `featured_property_subscriptionId_fkey` FOREIGN KEY (`subscriptionId`) REFERENCES `plan_subscriptions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `no_advertisements` ADD CONSTRAINT `no_advertisements_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `no_advertisements` ADD CONSTRAINT `no_advertisements_subscriptionId_fkey` FOREIGN KEY (`subscriptionId`) REFERENCES `plan_subscriptions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `blog_posts` ADD CONSTRAINT `blog_posts_blogCategoryId_fkey` FOREIGN KEY (`blogCategoryId`) REFERENCES `blog_category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
