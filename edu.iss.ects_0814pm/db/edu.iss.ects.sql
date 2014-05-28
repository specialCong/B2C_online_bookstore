##  删除数据库
drop  database  ects;

##  创建数据库
create database ects;   

##  使用数据库
use ects;

##  创建商品表结构 
create table product(
		product_id     int primary key auto_increment,
		name           varchar(64) not null,
		author         varchar(64),
		publish        varchar(64),
		price          double not null,
		pages          int not null,
		image          varchar(200),
		description    varchar(4000),
		category_id    int references category(category_id)
		);

##  创建商品类型表结构
create table category(
		category_id   int primary key auto_increment,
		name          varchar(64) not null,
		description   varchar(512)
   	    );

##  用户基本信息表结构
create table user(
		user_id     int primary key auto_increment,
		name        varchar(32) not null,
		password    varchar(16) not null
		);

##  用户信息关联信息表结构
create table contactinfo(
		contactinfo_id   int primary key references user(user_id),		
		name             varchar(32),
		sex		 varchar(2),
		street1          varchar(64),
		street2      	 varchar(64),
		city        	 varchar(32),		
		zip          	 varchar(16),
		email        	 varchar(64),
		homephone    	 varchar(32),
		cellphone    	 varchar(32),
		officephone  	 varchar(32),
		province_id   	 int references province(province_id),
		country_id       int references country(country_id)
		);

##  创建订单表结构
create table orders(
	  	order_id        int primary key auto_increment,
	  	cost            double not null,	
	  	user_id         int references user(user_id),
	  	orderstatus_id  int references orderstatus(orderstatus_id),
		payway_id       int references payway(payway_id)
		);

##  创建订单明细表结构
create table orderline(
	    orderline_id   int primary key auto_increment,
	    amount         int, 
	    order_id       int references orders(order_id),
	    product_id     int references product(product_id)
	    );

##  创建订单状态表结构			
create table orderstatus(
	    orderstatus_id    int primary key auto_increment,
	    name              varchar(32),
	    description       varchar(128)
        );

##  创建付款方式表结构    
create table payway(
        payway_id   int primary key auto_increment,
   	    paystyle    varchar(32) not null
   	    );

##  国家表结构    
create table country(
  	    country_id   int primary key auto_increment,
  	    name         varchar(64) not null
   	    );

##  省份表数据结构    
create table province(
		province_id   int primary key auto_increment,
		name          varchar(32),
		country_id    int references country(country_id)
		);

##  创建用户评价表
create table comment(
		comment_id     int primary key auto_increment,
		user_id        int references user(user_id),
		product_id     int references product(product_id),
		score          int,
		description    varchar(4000)
		);

## =========================================================

##  模似商品类别数据
insert into category(name,description) values('杂志','zazhi');
insert into category(name,description) values('艺术','yishu');
insert into category(name,description) values('社会人文','shehuirenwen');
insert into category(name,description) values('工具书','gongjushu');
insert into category(name,description) values('小说','xiaoshuo');


##  模似商品数据

##  插入杂志
insert into product(name,author,publish,price,pages,image,description,category_id) values('独唱

团','韩寒','上海文艺出版社',18.0,'32','images\/duchangtuan.jpg','《独唱团》是青年作家韩寒出品的杂志

。韩寒透露，《独唱团》这个名字他原本想用于一本小说。关于杂志第一期的内容，网上流传着很多版本，韩寒

表示不可信。对于具体内容，出版方和韩寒签订了保密协定。 《独唱团》出版方华文天下图书有限公司表示，该

杂志第一期30万册已经印刷完毕，将于2010年6月10日在北京全国图书订货会上正式举行新闻发布会。《独唱团》

第一期分为限量版和普通版。相对普通版，限量版只有2万册，装帧更精美，价格也更贵些。',1);
insert into product(name,author,publish,price,pages,image,description,category_id) values('独唱

团','韩寒','上海文艺出版社',18.0,'32','images\/duchangtuan1.jpg','《独唱团》是青年作家韩寒出品的杂

志。韩寒透露，《独唱团》这个名字他原本想用于一本小说。关于杂志第一期的内容，网上流传着很多版本，韩

寒表示不可信。对于具体内容，出版方和韩寒签订了保密协定。 《独唱团》出版方华文天下图书有限公司表示，

该杂志第一期30万册已经印刷完毕，将于2010年6月10日在北京全国图书订货会上正式举行新闻发布会。《独唱团

》第一期分为限量版和普通版。相对普通版，限量版只有2万册，装帧更精美，价格也更贵些。',1);
insert into product(name,author,publish,price,pages,image,description,category_id) values('时尚

COSMO','时尚','XXX出版社',32.8,'45','images\/COSMO.jpg','搏击你的眼球',1);


##  插入艺术
insert into product(name,author,publish,price,pages,image,description,category_id) values('哥特式艺

术','拉尔','河北教育出版社',18.0,'32','images\/geteshiyishu.jpg','呵呵',2);
insert into product(name,author,publish,price,pages,image,description,category_id) values('贴心家饰

','贴心','中国轻工业出版社',18.0,'32','images\/tiexinjiashi.jpg','呵呵',2);
insert into product(name,author,publish,price,pages,image,description,category_id) values('新平

面','前卫','XXX出版社',32.8,'45','images\/xinpingmian.jpg','呵呵',2);


##  插入社会人文

insert into product(name,author,publish,price,pages,image,description,category_id) values('读者','

佚名','河北教育出版社',3.0,'30','images\/duzhe.jpg','呵呵',3);
insert into product(name,author,publish,price,pages,image,description,category_id) values('萌芽','

佚名','中国轻工业出版社',3.0,'30','images\/mengya.jpg','呵呵',3);
insert into product(name,author,publish,price,pages,image,description,category_id) values('青年文摘

','佚名','XXX出版社',3.0,'30','images\/qingnianwenzhai.jpg','呵呵',3);


##  插入工具书

insert into product(name,author,publish,price,pages,image,description,category_id) values('牛津袖珍

英语词典','佚名','河北教育出版社',16.0,'500','images\/niujinxiuzhen.jpg','呵呵',4);
insert into product(name,author,publish,price,pages,image,description,category_id) values('精选日汉

汉日词典','佚名','中国轻工业出版社',35,'895','images\/rihanhanri.jpg','呵呵',4);
insert into product(name,author,publish,price,pages,image,description,category_id) values('现代汉语

词典','佚名','XXX出版社',48,'1128','images\/xiandaihanyucidian.jpg','呵呵',4);


##  插入小说

insert into product(name,author,publish,price,pages,image,description,category_id) values('达芬奇密

码','佚名','河北教育出版社',22.0,'345','images\/dafenqimima.jpg','呵呵',5);
insert into product(name,author,publish,price,pages,image,description,category_id) values('悬疑

志','佚名','中国轻工业出版社',18,'289','images\/xuanyizhi.jpg','呵呵',5);
insert into product(name,author,publish,price,pages,image,description,category_id) values('追风筝的

人','佚名','XXX出版社',26,'412','images\/zhuifengzhengderen.jpg','呵呵',5);


##  模似订单状态数据
insert into  orderStatus(name, description) values
('配货状态','订单正在配货状态三天内将发出');
insert into  orderStatus(name, description) values
('成功状态','订单已经成功发送货物');
insert into  orderStatus(name, description) values
('交易途中','订单正在送货状态');
insert into  orderStatus(name, description) values
('缺货状态','订单涉及货品暂时缺货');             
			
##  模拟付款方式数据
insert into payway(paystyle) values("现金付款");
insert into payway(paystyle) values("网银付款");
insert into payway(paystyle) values("电汇付款");   

##  模拟国家表数据 
insert into country(name) values('中国');

## 模拟省份表数据
INSERT INTO province (name , country_id ) VALUES ('安徽', 1);
INSERT INTO province (name , country_id ) VALUES ('北京', 1);
INSERT INTO province (name , country_id ) VALUES ('重庆', 1);
INSERT INTO province (name , country_id ) VALUES ('福建', 1);
INSERT INTO province (name , country_id ) VALUES ('广东', 1);
INSERT INTO province (name , country_id ) VALUES ('甘肃', 1);
INSERT INTO province (name , country_id ) VALUES ('广西', 1);
INSERT INTO province (name , country_id ) VALUES ('贵州', 1);
INSERT INTO province (name , country_id ) VALUES ('河南', 1);
INSERT INTO province (name , country_id ) VALUES ('湖北', 1);
INSERT INTO province (name , country_id ) VALUES ('河北', 1);
INSERT INTO province (name , country_id ) VALUES ('海南', 1);
INSERT INTO province (name , country_id ) VALUES ('香港', 1);
INSERT INTO province (name , country_id ) VALUES ('黑龙江', 1);
INSERT INTO province (name , country_id ) VALUES ('湖南', 1);
INSERT INTO province (name , country_id ) VALUES ('吉林', 1);
INSERT INTO province (name , country_id ) VALUES ('江苏', 1);
INSERT INTO province (name , country_id ) VALUES ('江西', 1);
INSERT INTO province (name , country_id ) VALUES ('辽宁', 1);
INSERT INTO province (name , country_id ) VALUES ('澳门', 1);
INSERT INTO province (name , country_id ) VALUES ('内蒙古', 1);
INSERT INTO province (name , country_id ) VALUES ('宁夏', 1);
INSERT INTO province (name , country_id ) VALUES ('青海', 1);
INSERT INTO province (name , country_id ) VALUES ('四川', 1);
INSERT INTO province (name , country_id ) VALUES ('山东', 1);
INSERT INTO province (name , country_id ) VALUES ('上海', 1);
INSERT INTO province (name , country_id ) VALUES ('陕西', 1);
INSERT INTO province (name , country_id ) VALUES ('山西', 1);
INSERT INTO province (name , country_id ) VALUES ('天津', 1);
INSERT INTO province (name , country_id ) VALUES ('台湾', 1);
INSERT INTO province (name , country_id ) VALUES ('新疆', 1);
INSERT INTO province (name , country_id ) VALUES ('西藏', 1);
INSERT INTO province (name , country_id ) VALUES ('云南', 1);
INSERT INTO province (name , country_id ) VALUES ('浙江', 1);
INSERT INTO province (name , country_id ) VALUES ('其它', 1);
