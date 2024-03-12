Create database Autoker;

Create Table Varos(
    id int auto_increment Primary key,
    nev Varchar(50) NOT NULL
);

Create Table Auto_tipus(
    id int auto_increment Primary key,
    tipus Varchar(50) NOT NULL,
    gyartasiev Varchar(50) NOT NULL,
    marka Varchar(30) NOT NULL
);

Create Table Elado(
    hely_id int,
    email Varchar(100) NOT NULL,
    nev Varchar(60) NOT NULL,
    telefonszam char(11) Primary key NOT NULL,
    Foreign key (hely_id) references Varos(id) 
);

Create Table Vevo(
    lakhely_id int,
    email Varchar(100) NOT NULL,
    nev Varchar(60) NOT NULL,
    telefonszam char(11) Primary key NOT NULL,
    Foreign key (lakhely_id) references Varos(id) 
);

Create Table Autok(
    tipus_id int,
    rendszam Varchar(10) NOT NULL,
    ar int NOT NULL,
    alvazszam char(18) Primary key NOT NULL,
    Foreign key (tipus_id) references Auto_tipus(id) 
);

Create Table Eladasok(
    id int Primary key auto_increment,
    auto_azon char(18),
    vevo_azon char(11),
    elado_azon char(11),
    Foreign key (auto_azon) references Autok(alvazszam),
    Foreign key (vevo_azon) references Vevo(telefonszam),
    Foreign key (elado_azon) references Elado(telefonszam) 
);

