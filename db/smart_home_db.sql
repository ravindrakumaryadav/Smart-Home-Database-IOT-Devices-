-- creating new database - smart_home_db
create database smart_home_db;

use smart_home_db;

-- Table 1: Users

CREATE TABLE Users (
    user_id       INT          NOT NULL AUTO_INCREMENT,
    first_name    VARCHAR(45)  NOT NULL,
    last_name     VARCHAR(45)  NOT NULL,
    email         VARCHAR(100) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    phone         VARCHAR(20),
    created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_active     TINYINT(1)   NOT NULL DEFAULT 1,
 
    -- Primary Key
    CONSTRAINT pk_users PRIMARY KEY (user_id),
 
    -- Unique constraint: no two users can share same email
    CONSTRAINT uq_usr_email UNIQUE (email),
 
    -- Basic email format validation
    CONSTRAINT chk_email CHECK (email LIKE '%@%.%')
);

-- Changing datatype of active status of users-correcting mistake
ALTER TABLE Users 
MODIFY COLUMN is_active BOOLEAN NOT NULL DEFAULT TRUE;

-- Table - 2 Homes
CREATE TABLE Homes (
    home_id       INT          NOT NULL AUTO_INCREMENT,    
    home_name     VARCHAR(100) NOT NULL,
    address       VARCHAR(255) NOT NULL,
    wifi_ssid     VARCHAR(100) NOT NULL,
    wifi_password VARCHAR(255) NOT NULL,
    created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
 
    -- Primary Key
    CONSTRAINT pk_homes PRIMARY KEY (home_id) 
);

-- Table 3: Devices
CREATE TABLE Devices (
    device_id    INT          NOT NULL AUTO_INCREMENT,    
    device_name  VARCHAR(100) NOT NULL,
    device_type  ENUM(
                    'light',
                    'camera',
                    'lock',
                    'thermostat',
                    'appliance',
                    'sensor'
                 ) NOT NULL,
    status       ENUM('on', 'off', 'standby') NOT NULL DEFAULT 'off',
    ip_address   VARCHAR(45),
    firmware_ver VARCHAR(20),
    installed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 
    -- Primary Key
    CONSTRAINT pk_devices PRIMARY KEY (device_id)    
);

-- Table 4: Device_Schedules
CREATE TABLE Device_Schedules (
    schedule_id  INT  NOT NULL AUTO_INCREMENT,    
    start_time   TIME NOT NULL,
    end_time     TIME NOT NULL,
    frequency    ENUM(
                    'daily',
                    'weekly',
                    'weekdays',
                    'weekends',
                    'custom'
                 ) NOT NULL DEFAULT 'daily',
    status       ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    created_at   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 
    -- Primary Key
    CONSTRAINT pk_schedules PRIMARY KEY (schedule_id),
    
    -- End time must be after start time
    CONSTRAINT chk_schedule_times CHECK (end_time > start_time)
);

-- Table 5: Scenes
CREATE TABLE Scenes (
    scene_id     INT          NOT NULL AUTO_INCREMENT,    
    scene_name   VARCHAR(100) NOT NULL,
    description  TEXT,
    is_active    BOOLEAN NOT NULL DEFAULT TRUE,
    created_at   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
 
    -- Primary Key
    CONSTRAINT pk_scenes PRIMARY KEY (scene_id)    
);
 
 -- Table 6: Scene_Devices 
 CREATE TABLE Scene_Devices (
    scene_id      INT NOT NULL,   -- FK to Scenes
    device_id     INT NOT NULL,   -- FK to Devices
    target_status ENUM('on', 'off', 'standby') NOT NULL DEFAULT 'on',
 
    -- Composite Primary Key (scene + device combination must be unique)
    CONSTRAINT pk_scene_devices PRIMARY KEY (scene_id, device_id),
 
    -- Foreign Keys
    CONSTRAINT fk_sd_scene
        FOREIGN KEY (scene_id)
        REFERENCES Scenes(scene_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
 
    CONSTRAINT fk_sd_device
        FOREIGN KEY (device_id)
        REFERENCES Devices(device_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table 7:
CREATE TABLE Notifications (
    notification_id   INT          NOT NULL AUTO_INCREMENT,
    user_id           INT          NOT NULL,   -- FK to Users
    device_id         INT          NOT NULL,   -- FK to Devices
    message           VARCHAR(500) NOT NULL,
    notification_type ENUM(
                         'security',
                         'malfunction',
                         'schedule',
                         'info'
                      ) NOT NULL DEFAULT 'info',
    is_read           BOOLEAN NOT NULL DEFAULT false,
    created_at        DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
 
    -- Primary Key
    CONSTRAINT pk_notifications PRIMARY KEY (notification_id),
 
    -- Foreign Keys
    CONSTRAINT fk_notif_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
 
    CONSTRAINT fk_notif_device
        FOREIGN KEY (device_id)
        REFERENCES Devices(device_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table 8:
CREATE TABLE UserRoles (
    role_id      INT      NOT NULL AUTO_INCREMENT,
    user_id      INT      NOT NULL,   -- FK to Users
    home_id      INT      NOT NULL,   -- FK to Homes
    role_type    ENUM('admin', 'guest', 'viewer') NOT NULL DEFAULT 'viewer',
    access_level ENUM('full', 'limited', 'read-only') NOT NULL DEFAULT 'read-only',
    assigned_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 
    -- Primary Key
    CONSTRAINT pk_userroles PRIMARY KEY (role_id),
 
    -- Unique: a user can only have ONE role per home
    CONSTRAINT uq_user_home UNIQUE (user_id, home_id),
 
    -- Foreign Keys
    CONSTRAINT fk_roles_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
 
    CONSTRAINT fk_roles_home
        FOREIGN KEY (home_id)
        REFERENCES Homes(home_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- adding foreign key in Scene table
ALTER TABLE Scenes
ADD COLUMN home_id      INT          NOT NULL;   -- FK to Homes;

ALTER TABLE Scenes
ADD CONSTRAINT fk_scenes_home
FOREIGN KEY (home_id)
REFERENCES Homes(home_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- adding foreign key in Device_Schedules
ALTER TABLE Device_Schedules
ADD COLUMN device_id    INT  NOT NULL;  -- FK to Devices

    -- Foreign Key: schedule must belong to a valid device
ALTER TABLE Device_Schedules
ADD CONSTRAINT fk_schedules_device
FOREIGN KEY (device_id)
REFERENCES Devices(device_id)
ON DELETE CASCADE
ON UPDATE CASCADE;
 
-- adding foreign key in Device_Schedules
ALTER TABLE Devices
ADD COLUMN home_id      INT          NOT NULL;   -- FK to Homes

    -- Foreign Key: device must belong to a valid home
    ALTER TABLE Devices
    ADD CONSTRAINT fk_devices_home
        FOREIGN KEY (home_id)
        REFERENCES Homes(home_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE;

-- adding foreign key in Homes
ALTER TABLE Homes
ADD COLUMN user_id       INT          NOT NULL;   -- FK to Users (owner)
    -- Foreign Key: home must belong to a valid user
    ALTER TABLE Homes
    ADD CONSTRAINT fk_homes_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE;


CREATE TABLE device_logs (
    log_id        INT          NOT NULL AUTO_INCREMENT,
    device_id     INT          NOT NULL,
    user_id       INT          NULL,       
    old_status    ENUM('on','off','standby') NULL,
    new_status    ENUM('on','off','standby') NOT NULL,
    change_source ENUM('manual','schedule','scene','system') NOT NULL DEFAULT 'manual',
    changed_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
 
    -- Primary Key
    CONSTRAINT pk_device_logs PRIMARY KEY (log_id),
 
    -- FK: must reference a valid device
    CONSTRAINT fk_logs_device
        FOREIGN KEY (device_id)
        REFERENCES devices(device_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
 
    -- FK: nullable — system changes have no user
    CONSTRAINT fk_logs_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);







