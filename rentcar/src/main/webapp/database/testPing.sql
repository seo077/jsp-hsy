USE rentcar;

CREATE TABLE member(
	id VARCHAR(20) PRIMARY KEY,
    pw VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    birth_year date NOT NULL,
    gender VARCHAR(20) NOT NULL,
    email VARCHAR(50),
    country VARCHAR(20) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    regDate datetime DEFAULT CURRENT_TIMESTAMP
    );
    
    CREATE TABLE comments(
    commentNo int primary key auto_increment,
	boardNo int NOT NULL,
    userId VARCHAR(20) NOT NULL,
    comments VARCHAR(1000) NOT NULL,
    likes int(10) default 0,
    hates int(10) default 0,
    regdate datetime NOT NULL
);

CREATE TABLE likes(
	boardNo int NOT NULL,
    userId VARCHAR(20) NOT NULL
);

CREATE TABLE board(
	boardNo integer primary key auto_increment,
    userId VARCHAR(20) NOT NULL,
    title VARCHAR(50) NOT NULL,
    content VARCHAR(1000) NOT NULL,
    likes int(10) default 0,
    views int(10) default 0,
    regdate datetime NOT NULL
);

create table rentalCar(
	no integer primary key auto_increment,
    available int(10) default 0,
    img varchar(20) not null,
    price int not null,
    usepeople int(10) not null,
    company varchar(50) not null,
    modelname varchar(50) not null,
    fuel varchar(50) not null,
    olds varchar(20) not null,
    qty int not null,
    usein int not null,
    usenavi int not null,
    useseat int not null,
    usewifi int not null,
    userearcam int not null,
    usehi_pass int not null,
	useblack_box int not null,
	isdiscount int not null,
	car_type varchar(20) not null
);

create table reservation(
	carNo int not null,
    userId varchar(20) not null,
    startday varchar(50) not null,
    endday varchar(50)  not null,
    regdate datetime not null
);

create TABLE review(
	carNo int not null,
    userId varchar(20) not null,
    review varchar(100) not null,
    regdate datetime not null,
    realuser int not null
);

create table commentsLike(
	commentNo integer not null,
    userId varchar(20) not null
);
create table commentsHate(
	commentNo integer not null,
    userId varchar(20) not null
);

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_1_rent.jpg",'59900','4',"현대","★2022캐스퍼","휘발유","2022",'1','1','1','1','1','0','1','1','0',"경형");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_2_rent.jpg",'502900','5',"기아","★더뉴레이","휘발유","2018~19",'1','1','1','1','1','1','1','1','0',"경형");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_3_rent.jpg",'536500','5',"기아","★2021모닝","휘발유","2021",'1','0','1','0','1','1','1','0','1',"경형");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_4_rent.jpg",'604700','5',"기아","★2022더뉴K3","휘발유","2021",'2','1','1','1','1','1','1','1','1',"소형");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_5_rent.jpg",'598800','5',"기아","★2021올뉴아반떼","휘발유","2021",'1','0','1','1','1','0','1','1','1',"소형");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_6_rent.jpg",'557500','5',"기아","★더뉴아반떼","휘발유","2020",'3','1','1','1','1','1','1','1','1',"소형");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_7_rent.jpg",'631600','5',"기아","★소나타DN8휘발유","휘발유","2019~20",'3','1','1','1','1','1','1','1','1',"중형");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_8_rent.jpg",'741400','5',"기아","★2022K5 LPG","LPG","2022",'2','1','1','0','1','1','1','1','0',"중형");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_9_rent.gif",'711300','5',"현대","★2021쏘나타DN8 LPG","LPG","2021",'2','1','1','1','1','1','1','1','0',"중형");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/10_rent.jpg",'1172300','5',"현대","★G80","휘발유","2021",'3','1','1','1','1','1','1','0','0',"고급");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/11_rent.gif",'1074100','5',"기아","★K8","휘발유","2021",'2','1','1','1','1','1','1','1','0',"고급");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/12_rent.gif",'922100','5',"기아","★더뉴그랜져","휘발유","2020~21",'2','0','1','0','1','1','1','1','0',"고급");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/13_rent.jpg",'1679500','7',"현대","★2021팰리세이드 7인승 4WD","경유","2021",'2','1','1','0','1','1','1','1','0',"SUV");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/14_rent.gif",'1457400','7',"기아","★4세대 쏘렌토 7인승 4WD","경유","2021",'2','0','1','1','1','1','1','1','0',"SUV");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/15_rent.jpg",'1295900','5',"기아","★2022스포티지 4WD","경유","2022",'2','1','1','1','1','0','1','1','0',"SUV");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/16_rent.jpg",'1123300','5',"현대","★싼타페","경유","2016~17",'3','1','1','1','1','1','1','1','0',"SUV");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/17_rent.jpg",'683100','9',"기아","★4세대 카니발 9인승","경유","2021",'1','1','1','1','1','1','1','1','0',"승합");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/18_rent.jpg",'597600','11',"기아","★4세대 카니발 11인승","경유","2021",'2','1','1','1','1','1','1','1','0',"승합");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/19_rent.jpg",'587600','9',"기아","★더뉴카니발9인승 프레스티지","경유","2020",'1','1','1','1','1','1','1','1','0',"승합");

