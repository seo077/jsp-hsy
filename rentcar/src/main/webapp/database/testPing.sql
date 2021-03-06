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
values("../resources/imgs/_1_rent.jpg",'59900','4',"??????","???2022?????????","?????????","2022",'1','1','1','1','1','0','1','1','0',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_2_rent.jpg",'502900','5',"??????","???????????????","?????????","2018~19",'1','1','1','1','1','1','1','1','0',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_3_rent.jpg",'536500','5',"??????","???2021??????","?????????","2021",'1','0','1','0','1','1','1','0','1',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_4_rent.jpg",'604700','5',"??????","???2022??????K3","?????????","2021",'2','1','1','1','1','1','1','1','1',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_5_rent.jpg",'598800','5',"??????","???2021???????????????","?????????","2021",'1','0','1','1','1','0','1','1','1',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_6_rent.jpg",'557500','5',"??????","??????????????????","?????????","2020",'3','1','1','1','1','1','1','1','1',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_7_rent.jpg",'631600','5',"??????","????????????DN8?????????","?????????","2019~20",'3','1','1','1','1','1','1','1','1',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_8_rent.jpg",'741400','5',"??????","???2022K5 LPG","LPG","2022",'2','1','1','0','1','1','1','1','0',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/_9_rent.gif",'711300','5',"??????","???2021?????????DN8 LPG","LPG","2021",'2','1','1','1','1','1','1','1','0',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/10_rent.jpg",'1172300','5',"??????","???G80","?????????","2021",'3','1','1','1','1','1','1','0','0',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/11_rent.gif",'1074100','5',"??????","???K8","?????????","2021",'2','1','1','1','1','1','1','1','0',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/12_rent.gif",'922100','5',"??????","??????????????????","?????????","2020~21",'2','0','1','0','1','1','1','1','0',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/13_rent.jpg",'1679500','7',"??????","???2021??????????????? 7?????? 4WD","??????","2021",'2','1','1','0','1','1','1','1','0',"SUV");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/14_rent.gif",'1457400','7',"??????","???4?????? ????????? 7?????? 4WD","??????","2021",'2','0','1','1','1','1','1','1','0',"SUV");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/15_rent.jpg",'1295900','5',"??????","???2022???????????? 4WD","??????","2022",'2','1','1','1','1','0','1','1','0',"SUV");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/16_rent.jpg",'1123300','5',"??????","????????????","??????","2016~17",'3','1','1','1','1','1','1','1','0',"SUV");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/17_rent.jpg",'683100','9',"??????","???4?????? ????????? 9??????","??????","2021",'1','1','1','1','1','1','1','1','0',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/18_rent.jpg",'597600','11',"??????","???4?????? ????????? 11??????","??????","2021",'2','1','1','1','1','1','1','1','0',"??????");

insert into rentalCar(img,price,usepeople,company,modelname,fuel,olds,qty,usein,usenavi,useseat,usewifi,userearcam,usehi_pass,useblack_box,isdiscount,car_type) 
values("../resources/imgs/19_rent.jpg",'587600','9',"??????","??????????????????9?????? ???????????????","??????","2020",'1','1','1','1','1','1','1','1','0',"??????");

