
/* 参数表 */
CREATE TABLE IF NOT EXISTS tsConfig (
    configID            VARCHAR NOT NULL,                   /* 参数Key */
    userID              VARCHAR,                            /* 用户ID */
    deviceID            VARCHAR,                            /* 设备ID */
    value               VARCHAR,                            /* 值 */
    ex1                 VARCHAR,                            /* 拓展信息1 */
    ex2                 VARCHAR,                            /* 拓展信息2 */
    desc                VARCHAR                             /* 描述 */
);

/* 心率图表数据表 */
CREATE TABLE IF NOT EXISTS tb_heart_rate (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           DOUBLE,                             /* 时间戳 */
    data                INT                                 /* 心率数据心率值(次/分钟) */
);

/* 静息心率数据表 */
CREATE TABLE IF NOT EXISTS tb_rest_heart_rate (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           DOUBLE,                             /* 时间戳 */
    data                INT                                 /* 静息心率数据 */
);

/* 步数图表数据表 */
CREATE TABLE IF NOT EXISTS tb_step (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           DOUBLE,                             /* 时间戳 */
    date                TEXT,                               /* ??? */
    time                TEXT,                               /* ??? */
    interval            INT,                                /* 采样时长(s) */
    data                BLOB,                               /* 步数图表数据 */
    allStep             INT,                                /* 总步数 */
    totalMileage        DOUBLE,                             /* 距离(cm) */
    totalConsumption    INT,                                /* ??? */
    duration            DOUBLE,                             /* 运动时长(分钟) */
    calory              INT                                 /* 卡路里(小卡) */
);

/* 压力图表数据表 */
CREATE TABLE IF NOT EXISTS tb_stress (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           DOUBLE,                             /* 时间戳 */
    date                TEXT,                               /* ??? */
    time                TEXT,                               /* ??? */
    interval            INT,                                /* ??? */
    data                BLOB,                               /* 压力图表数据 */
    maxValue            INT,                                /* ??? */
    minValue            INT,                                /* ??? */
    averageValue        INT                                 /* ??? */
);

/* 血氧饱和度图表数据表 */
CREATE TABLE IF NOT EXISTS tb_oxyhemoglobin_saturation (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           DOUBLE,                             /* 时间戳 */
    date                TEXT,                               /* ??? */
    time                TEXT,                               /* ??? */
    interval            INT,                                /* ??? */
    data                BLOB,                               /* 血氧饱和度图表数据 */
    maxValue            INT,                                /* ??? */
    minValue            INT,                                /* ??? */
    averageValue        INT                                 /* ??? */
);

/* 体重表 */
CREATE TABLE IF NOT EXISTS tb_weight (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           DOUBLE,                             /* 时间戳 */
    date                TEXT,                               /* ??? */
    weight              double                              /* 体重 */
);

/* 睡眠数据表 */
CREATE TABLE IF NOT EXISTS tb_sleep (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           DOUBLE,                             /* 时间戳 */
    record_time         INT,                                /* ??? */
    start_time          INT,                                /* ??? */
    type                INT,                                /* 睡眠类型 参考TPSHistorySleep_Type */
    duration            INT,                                /* 改为用秒做单位，否则会有误差 */
    belong_day          INT,                                /* 睡眠属于哪一天，秒级时间戳，取那天的0时 */
    data                BLOB                                /* 睡眠数据 */
);

/* 血压图表数据表 */
CREATE TABLE IF NOT EXISTS tb_blood_pressure (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           DOUBLE,                             /* 时间戳 */
    record_time         INT,                                /* ??? */
    sbp                 INT,                                /* 收缩压 */
    dbp                 INT,                                /* 舒张压 */
    data                BLOB                                /* 血压图表数据 */
);

/* 跑步运动信息 */
CREATE TABLE IF NOT EXISTS tb_sport_running (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           double,                             /* 时间戳 */
    sport_id            INT,                                /* ??? */
    type                INT,                                /* ??? */
    start_time          double,                             /* 运动开始时间戳 */
    duration            INT,                                /* 运动持续时间(秒) */
    step                INT,                                /* 步数 */
    data                BLOB                                /* 跑步运动信息图表数据 */
);

/* 轨迹表 */
CREATE TABLE IF NOT EXISTS tb_sport_location (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           double,                             /* 时间戳 */
    sport_id            INT,                                /* ??? */
    type                INT,                                /* ??? */
    longitude           DOUBLE,                             /* 经度 */
    latitude            DOUBLE,                             /* 纬度 */
    speed               DOUBLE,                             /* 速度 */
    duration            DOUBLE                              /* ??? */
);

/* 每公里配速表 */
CREATE TABLE IF NOT EXISTS tb_sport_speed_per_km (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           double,                             /* 时间戳 */
    sport_id            INT,                                /* ??? */
    speed               DOUBLE,                             /* 速度(min/km) */
    distance            DOUBLE,                             /* 距离(m) */
    startTimestamp      DOUBLE,                             /* ??? */
    endTimestamp        DOUBLE                              /* ??? */
);

/* 活动记录表 */
CREATE TABLE IF NOT EXISTS tb_activity_record (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           double,                             /* 时间戳 */
    start_time          INT,                                /* ??? */
    data                BLOB                                /* ??? */
);

/* 跑步运动信息 添加运动心率 次/min */
ALTER TABLE [tb_sport_running] ADD [heartRate] INT NOT NULL DEFAULT 0;

/* 跑步运动信息 添加运动卡路里 千卡 */
ALTER TABLE [tb_sport_running] ADD [calories] DOUBLE;

/* 体温表 */
CREATE TABLE IF NOT EXISTS tb_bt_record (
    ID                  INTEGER PRIMARY KEY AUTOINCREMENT,  /* 数据ID */
    user_id             TEXT,                               /* 用户ID */
    device_mac          TEXT,                               /* 设备mac地址(设备ID) */
    timestamp           DOUBLE,                             /* 时间戳 */
    wristTemperature    double,                             /* 腕温（摄氏度） */
    bodyTemperature     double                              /* 体温（摄氏度） */
);
