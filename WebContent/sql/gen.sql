CREATE TABLE IF NOT EXISTS product(
	b_id int NOT NULL AUTO_INCREMENT,
	b_name VARCHAR(20),
	b_startPrice INTEGER,
	b_description TEXT,
	b_isPurchased boolean,
	b_condition INTEGER,
	b_fileName VARCHAR(20),
	b_currentUserId VARCHAR(20),
	PRIMARY KEY (b_id)
)default CHARSET=utf8;

CREATE TABLE member(
	id varchar(10) not null,
	password varchar(10) not null,
	primary key(id)
)default CHARSET=utf8;

insert into member values ("admin","admin");
insert into member values ("user1","passwd");


/* heidisql create code
 * CREATE TABLE `product` (
	`b_id` INT(11) NOT NULL AUTO_INCREMENT,
	`b_name` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`b_startPrice` INT(11) NULL DEFAULT NULL,
	`b_description` TEXT(65535) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`b_isPurchased` TINYINT(1) NULL DEFAULT NULL,
	`b_regid` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`b_fileName` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`b_currentUserId` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`b_id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=123134
;

 * 
 * CREATE TABLE `member` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`password` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

 * 
 * 
 */