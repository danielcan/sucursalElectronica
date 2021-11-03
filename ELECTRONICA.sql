create table tblcliente(
idcliente number,
nombreC varchar2(200),
fechaIngreso varchar2(200),
telefono varchar2(200),
identidad varchar(100),
CONSTRAINT pk_cliente primary key(idcliente)
);

--secuencia cliente
CREATE SEQUENCE cliente_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

--insercion cliente
insert into tblcliente VALUES(CLIENTE_SEQ.nextval,'dan','02/05/2021','2345242','05818468421');
insert into tblcliente VALUES(CLIENTE_SEQ.nextval,'javier','07/01/2021','22455742','02058184684');

select * from tblcliente;


--rol
--1 administrador
--2 cliente
create table tblusuario(
id number,
rol number,
login varchar2(200),
contrasenia varchar2(500),
idcliente number,
CONSTRAINT pk_usuario primary key(id),
CONSTRAINT fk_clienteu foreign key(idcliente) references tblcliente(idcliente)
);
--secuencia cliente 
CREATE SEQUENCE usuario_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
--insercion cliente
insert into TBLUsuario VALUES(USUARIO_SEQ.nextval,1,'Daca','contra',null);
insert into TBLUsuario VALUES(USUARIO_SEQ.nextval,2,'dan','contra',1);
insert into TBLUsuario VALUES(USUARIO_SEQ.nextval,2,'javierL','contra',2);

select * from tblusuario;

--tabla cuenta
create table tblcuenta(
id number,
saldo number,
idcliente number,
CONSTRAINT pk_cuenta primary key(id),
CONSTRAINT fk_clientec foreign key(idcliente) references tblcliente(idcliente)
);

-- secuentacia cuenta
CREATE SEQUENCE cuenta_seq START WITH 777000 INCREMENT BY 1 NOCACHE NOCYCLE;

--insercion cuenta
insert into tblcuenta VALUES(CUENTA_SEQ.nextval,87945,1);
insert into tblcuenta VALUES(CUENTA_SEQ.nextval,87975,2);

--mostrar inserciones 
select * from tblcuenta;

select id, saldo, idcliente from tblcuenta where idcliente=2;

select saldo from tblcuenta where id = 777000 


--tipo tarjeta 
create table tblTtarjeta(
id number,
tipo varchar2(200),
CONSTRAINT pk_tipo primary key(id)
);

--secuencia tipo de tarjeta de credito 

CREATE SEQUENCE tipo_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

--insercion tipo tarjeta
insert into tblttarjeta VALUES(TIPO_SEQ.nextval,'credito');
insert into tblttarjeta VALUES(TIPO_SEQ.nextval,'debito');


--tarjeta
create table tbltarjeta(
id number,
nombre varchar2(200),
fechaVen varchar2(200),
numero varchar2(200),
saldo number,
tipo number,
cuenta number,
CONSTRAINT pk_tarjeta primary key(id),
CONSTRAINT fk_ttipo foreign key(tipo) references tblttarjeta(id),
CONSTRAINT fk_cuentat foreign key(cuenta) references tblcuenta(id)
);

--secuencia
CREATE SEQUENCE tarjeta_seq START WITH 55420123000 INCREMENT BY 1 NOCACHE NOCYCLE;

--inserciones
insert into tbltarjeta VALUES(TARJETA_SEQ.nextval,'dan can','02/05/2023','3213546421121',5000,1,777000);
insert into tbltarjeta VALUES(TARJETA_SEQ.nextval,'javier','06/08/2024','87546541258',5000,2,777001);

select * from tbltarjeta;

delete from tbltarjeta where id = 2;


--tabla de estado
create table tblestadoT(
id number,
estado varchar2(100),
CONSTRAINT pk_estadot primary key(id)
);

--secuencia
CREATE SEQUENCE estado_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

--estado
insert into tblestadot VALUES(ESTADO_SEQ.nextval,'activo');
insert into tblestadot VALUES(ESTADO_SEQ.nextval,'en mora');

--tabla comercios disponibles

create table tblcomercio(
id number,
nombre varchar2(200),
CONSTRAINT pk_comercio primary key(id)
);

--secuencia
CREATE SEQUENCE comercio_seq START WITH 100100 INCREMENT BY 1 NOCACHE NOCYCLE;

--insercion de comercio
insert into tblcomercio VALUES(COMERCIO_SEQ.nextval,'expresso americano');
insert into tblcomercio VALUES(COMERCIO_SEQ.nextval,'joyeria');

select * from tblcomercio;

--tabla productos
create table tblproducto(
id number,
nombre varchar2(200),
comercio number,
valor number,
CONSTRAINT pk_producto primary key(id),
CONSTRAINT fk_comercio foreign key(comercio) references tblcomercio(id)
);

--secuencia
CREATE SEQUENCE producto_seq START WITH 1555000 INCREMENT BY 1 NOCACHE NOCYCLE;

--inserciones
insert into tblproducto VALUES(PRODUCTO_SEQ.nextval,'CAFE',100100,200);
insert into tblproducto VALUES(PRODUCTO_SEQ.nextval,'oro',100101,2000);

select * from tblproducto;

--tabla de informacion banco
create table banco(
id number,
mision varchar2(500),
vision varchar2(500),
politicas varchar2(500),
CONSTRAINT pk_banco primary key(id)
); 

--secuencia
CREATE SEQUENCE banco_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

insert into banco VALUES(BANCO_SEQ.nextval,'miSION','VISION','POLITICA');

create table ubicacionB(
id number,
posicionx number,
posiciony number,
primary key(id)
);

CREATE SEQUENCE  ubicacion_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;


insert into ubicacionb VALUES(UBICACION_SEQ.nextval,15.215,32.54);
insert into ubicacionb VALUES(ubicacion_SEQ.nextval,25.215,38.54);


select login,contrasenia,rol from TBLusuario;







--detalle de deposito
create table tbldetalleDepo(
id number,
nombre varchar2(100),
CONSTRAINT pk_detalle primary key(id)
);

--secuencia
CREATE SEQUENCE detaposi_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

--inserciones
insert into tbldetalleDepo VALUES(DETAPOSI_SEQ.nextval,'DEPOSITO');
insert into tbldetalleDepo VALUES(DETAPOSI_SEQ.nextval,'RETIRO');
insert into tbldetalleDepo VALUES(DETAPOSI_SEQ.nextval,'TRANSFERENCIA');
insert into tbldetalleDepo VALUES(DETAPOSI_SEQ.nextval,'PAGO');

select * from tbldetalleDepo;

--tabla depositos
create table tbldepositos(
id number,
cantidad number,
cuentaEnvio number,
cuentaRecibido number,
iddeta number,
CONSTRAINT pk_depositos primary key(id),
CONSTRAINT fk_detalledep foreign key(iddeta) references tbldetalleDepo(id)
);

--secuencia
CREATE SEQUENCE deposis_seq START WITH 4988788000 INCREMENT BY 1 NOCACHE NOCYCLE;

--inserciones
insert into tbldepositos VALUES(DEPOSIS_SEQ.nextval,2000,1,2,1);
insert into tbldepositos VALUES(DEPOSIS_SEQ.nextval,2000,2,2,2);
insert into tbldepositos VALUES(DEPOSIS_SEQ.nextval,2000,2,2,4);

select * from tbldepositos;

--
create table tblcompra(
id number,
idproducto number,
idcomercio number,
idtarjeta number,
idcliente number,
valor number,
CONSTRAINT pk_compras primary key(id),
CONSTRAINT fk_producte foreign key(idproducto) references tblproducto(id),
CONSTRAINT fk_comer foreign key(idcomercio) references tblcomercio(id),
CONSTRAINT fk_tarje foreign key(idtarjeta) references tbltarjeta(id),
CONSTRAINT fk_client foreign key(idcliente) references tblcliente(idcliente)
);

CREATE SEQUENCE compras_seq START WITH 79000 INCREMENT BY 1 NOCACHE NOCYCLE;

insert into tblcompra VALUES(COMPRAS_SEQ.nextval,1555002,100100,55420123002,1,5000);
insert into tblcompra VALUES(COMPRAS_SEQ.nextval,1555003,100101,55420123003,2,7000);
insert into tblcompra VALUES(COMPRAS_SEQ.nextval,1555003,100100,55420123002,1,6000);
insert into tblcompra VALUES(COMPRAS_SEQ.nextval,1555003,100100,55420123002,1,4000);

select * from tblcompra;

select idcliente, count(idcliente) from tblcompra group by idcliente 
select max(select count(idcliente) from tblcompra group by idcliente)

create table tblpagos(
id number,
saldo number,
idtarjeta number

);

create table tblestadoC(
id number,
subtotal number,
total number,
fecha varchar2(250),
idcliente number,
CONSTRAINT pk_estado primary key(id),
CONSTRAINT fk_clientC foreign key(idcliente) references tblcliente(idcliente)
);

CREATE SEQUENCE estadoc_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

insert into tblestadoc VALUES(estadoc_SEQ.nextval,1500,1575,'02/05/2023',1);
insert into tblestadoc VALUES(estadoc_SEQ.nextval,1500,1575,'02/05/2023',2);

select * from tblestadoc

select id,subtotal,total,fecha,idcliente from tblestadoc where idcliente= 2;

