create table change_log(
    id int not null auto_increment primary key,
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255),
    script_name VARCHAR(255),
    script_details VARCHAR(255)
)