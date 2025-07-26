/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     25/07/2025 8:25:18 p. m.                     */
/*==============================================================*/


drop table if exists CARRITO;

drop table if exists CARRITODOMINIO;

drop table if exists CARRITOPAQUETE;

drop table if exists CUENTA;

drop table if exists DOMINIO;

drop table if exists EMPLEADO;

drop table if exists ESTADOCARRITO;

drop table if exists ESTADOEMPLEADO;

drop table if exists FACTURA;

drop table if exists METODOPAGOCUENTA;

drop table if exists PAIS;

drop table if exists PAQUETEHOSTING;

drop table if exists PERIODICIDADPAGO;

drop table if exists PERIODICIDADPRECIOPAQUETE;

drop table if exists PLAN;

drop table if exists SOLICITUDDOMINIO;

drop table if exists SOLICITUDESTADO;

drop table if exists TARJETA;

drop table if exists TIPOCUENTA;

drop table if exists TIPOEMPLEADO;

drop table if exists TIPOESTADOSSOLICITUD;

drop table if exists TIPOMETODOPAGO;

drop table if exists TIPOTARJETA;

/*==============================================================*/
/* Table: CARRITO                                               */
/*==============================================================*/
create table CARRITO
(
   IDCARRITO            int not null,
   IDESTADOCARRITO      varchar(3) not null,
   IDMETODOPAGOCUENTA   varchar(3) not null,
   IDFACTURA            int,
   primary key (IDCARRITO)
);

/*==============================================================*/
/* Table: CARRITODOMINIO                                        */
/*==============================================================*/
create table CARRITODOMINIO
(
   IDDOMINIO            varchar(150) not null,
   IDCARRITO            int not null,
   IDCARRITODOMINIO     varchar(10) not null,
   primary key (IDDOMINIO, IDCARRITO, IDCARRITODOMINIO)
);

/*==============================================================*/
/* Table: CARRITOPAQUETE                                        */
/*==============================================================*/
create table CARRITOPAQUETE
(
   IDCARRITO            int not null,
   IDPAQUETEHOSTING     varchar(3) not null,
   IDCARRITOPAQUETE     varchar(10) not null,
   primary key (IDCARRITO, IDPAQUETEHOSTING, IDCARRITOPAQUETE)
);

/*==============================================================*/
/* Table: CUENTA                                                */
/*==============================================================*/
create table CUENTA
(
   IDCUENTA             varchar(15) not null,
   IDTIPOCUENTA         numeric(2,0) not null,
   IDPAIS               numeric(3,0) not null,
   IDPLAN               varchar(15),
   PASSWORD             varchar(50) not null,
   IDENTIFICACION       varchar(15) not null,
   NOMBRECUENTA         varchar(150) not null,
   CORREO               varchar(50) not null,
   TELEFONO             int not null,
   FECHAREGISTRO        date not null,
   DIRECCION            varchar(30),
   primary key (IDCUENTA)
);

/*==============================================================*/
/* Table: DOMINIO                                               */
/*==============================================================*/
create table DOMINIO
(
   IDDOMINIO            varchar(150) not null,
   NOMBREPAGINA         varchar(150) not null,
   PRECIODOMINIO        decimal(10,2) not null,
   OCUPADO              bool not null,
   primary key (IDDOMINIO)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO
(
   IDEMPLEADO           varchar(3) not null,
   IDTIPOEMPLEADO       numeric(2,0) not null,
   IDESTADOEMPLEADO     varchar(3) not null,
   IDPAIS               numeric(3,0),
   PASSWORDEMPLEADO     varchar(50) not null,
   NOMBREEMPLEADO       varchar(15) not null,
   APELLIDOEMPLEADO     varchar(15) not null,
   CORREOEMPLEADO       varchar(30) not null,
   TELEFONOEMPLEADO     numeric(10,0) not null,
   IDENTIFICACIONEMPLEADO varchar(15) not null,
   primary key (IDEMPLEADO)
);

/*==============================================================*/
/* Table: ESTADOCARRITO                                         */
/*==============================================================*/
create table ESTADOCARRITO
(
   IDESTADOCARRITO      varchar(3) not null,
   NOMESTADOCARRITO     varchar(30) not null,
   primary key (IDESTADOCARRITO)
);

/*==============================================================*/
/* Table: ESTADOEMPLEADO                                        */
/*==============================================================*/
create table ESTADOEMPLEADO
(
   IDESTADOEMPLEADO     varchar(3) not null,
   NOMESTADOEMPLEADO    varchar(30) not null,
   primary key (IDESTADOEMPLEADO)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA
(
   IDFACTURA            int not null,
   IDCARRITO            int not null,
   PAGOFACTURA          date not null,
   VIGFACTURA           date not null,
   primary key (IDFACTURA)
);

/*==============================================================*/
/* Table: METODOPAGOCUENTA                                      */
/*==============================================================*/
create table METODOPAGOCUENTA
(
   IDMETODOPAGOCUENTA   varchar(3) not null,
   IDTARJETA            varchar(15),
   IDCUENTA             varchar(15),
   IDTIPOMETODOPAGO     numeric(2,0) not null,
   ACTIVOMETODOPAGOCUENTA bool not null,
   primary key (IDMETODOPAGOCUENTA)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS
(
   IDPAIS               numeric(3,0) not null,
   NOMBREPAIS           varchar(15) not null,
   primary key (IDPAIS)
);

/*==============================================================*/
/* Table: PAQUETEHOSTING                                        */
/*==============================================================*/
create table PAQUETEHOSTING
(
   IDPAQUETEHOSTING     varchar(3) not null,
   CANTIDADSITIOS       numeric(4,0) not null,
   NOMBREPAQUETEHOSTING varchar(20) not null,
   BD                   numeric(4,0) not null,
   GBENSSD              numeric(4,0) not null,
   CORREOS              numeric(3,0) not null,
   CERTIFICADOSSSLHTTPS numeric(3,0) not null,
   primary key (IDPAQUETEHOSTING)
);

/*==============================================================*/
/* Table: PERIODICIDADPAGO                                      */
/*==============================================================*/
create table PERIODICIDADPAGO
(
   IDPERIODICIDADPAGO   numeric(2,0) not null,
   NOMBREPERIODICIDAD   varchar(15) not null,
   primary key (IDPERIODICIDADPAGO)
);

/*==============================================================*/
/* Table: PERIODICIDADPRECIOPAQUETE                             */
/*==============================================================*/
create table PERIODICIDADPRECIOPAQUETE
(
   IDPAQUETEHOSTING     varchar(3) not null,
   IDPERIODICIDADPAGO   numeric(2,0) not null,
   IDPERIODICIDADPRECIOPAQUETE varchar(10) not null,
   PRECIO               decimal(10,2) not null,
   primary key (IDPAQUETEHOSTING, IDPERIODICIDADPAGO, IDPERIODICIDADPRECIOPAQUETE)
);

/*==============================================================*/
/* Table: PLAN                                                  */
/*==============================================================*/
create table PLAN
(
   IDPLAN               varchar(15) not null,
   NOMBREPLAN           varchar(15) not null,
   COMISION             numeric(2,0) not null,
   primary key (IDPLAN)
);

/*==============================================================*/
/* Table: SOLICITUDDOMINIO                                      */
/*==============================================================*/
create table SOLICITUDDOMINIO
(
   IDSOLICITUD          varchar(5) not null,
   IDDOMINIO            varchar(150) not null,
   IDSOLICITUDESTADO    varchar(10) not null,
   FECHASOLICITUD       date not null,
   primary key (IDSOLICITUD)
);

/*==============================================================*/
/* Table: SOLICITUDESTADO                                       */
/*==============================================================*/
create table SOLICITUDESTADO
(
   IDSOLICITUDESTADO    varchar(10) not null,
   IDTIPOESTADO         varchar(3),
   primary key (IDSOLICITUDESTADO)
);

/*==============================================================*/
/* Table: TARJETA                                               */
/*==============================================================*/
create table TARJETA
(
   IDTARJETA            varchar(15) not null,
   IDTIPOTARJETA        numeric(2,0) not null,
   NUMEROTARJETA        numeric(15,0) not null,
   CCV                  numeric(3,0) not null,
   FECHAVTO             date not null,
   primary key (IDTARJETA)
);

/*==============================================================*/
/* Table: TIPOCUENTA                                            */
/*==============================================================*/
create table TIPOCUENTA
(
   IDTIPOCUENTA         numeric(2,0) not null,
   NOMBRETIPO           varchar(30) not null,
   primary key (IDTIPOCUENTA)
);

/*==============================================================*/
/* Table: TIPOEMPLEADO                                          */
/*==============================================================*/
create table TIPOEMPLEADO
(
   IDTIPOEMPLEADO       numeric(2,0) not null,
   NOMBRETIPOEMPLEADO   varchar(15) not null,
   primary key (IDTIPOEMPLEADO)
);

/*==============================================================*/
/* Table: TIPOESTADOSSOLICITUD                                  */
/*==============================================================*/
create table TIPOESTADOSSOLICITUD
(
   IDTIPOESTADO         varchar(3) not null,
   NOMBREESTADO         varchar(15),
   primary key (IDTIPOESTADO)
);

/*==============================================================*/
/* Table: TIPOMETODOPAGO                                        */
/*==============================================================*/
create table TIPOMETODOPAGO
(
   IDTIPOMETODOPAGO     numeric(2,0) not null,
   NOMBRETIPOMETODOPAGO varchar(15) not null,
   primary key (IDTIPOMETODOPAGO)
);

/*==============================================================*/
/* Table: TIPOTARJETA                                           */
/*==============================================================*/
create table TIPOTARJETA
(
   IDTIPOTARJETA        numeric(2,0) not null,
   NOMBRETIPOTARJETA    varchar(15) not null,
   primary key (IDTIPOTARJETA)
);


alter table CARRITO add constraint FK_CARRITO_FACTURA foreign key (IDFACTURA)
      references FACTURA (IDFACTURA) on delete restrict on update restrict;

alter table CARRITO add constraint FK_ESTADO_CARRITO foreign key (IDESTADOCARRITO)
      references ESTADOCARRITO (IDESTADOCARRITO) on delete restrict on update restrict;

alter table CARRITO add constraint FK_METODOCUENTA_CARRITO foreign key (IDMETODOPAGOCUENTA)
      references METODOPAGOCUENTA (IDMETODOPAGOCUENTA) on delete restrict on update restrict;

alter table CARRITODOMINIO add constraint FK_CARRITO_DOMINIO foreign key (IDCARRITO)
      references CARRITO (IDCARRITO) on delete restrict on update restrict;

alter table CARRITODOMINIO add constraint FK_DOMINIO_CARRITO foreign key (IDDOMINIO)
      references DOMINIO (IDDOMINIO) on delete restrict on update restrict;

alter table CARRITOPAQUETE add constraint FK_CARRITO_PAQUETE foreign key (IDCARRITO)
      references CARRITO (IDCARRITO) on delete restrict on update restrict;

alter table CARRITOPAQUETE add constraint FK_PAQUETE_CARRITO foreign key (IDPAQUETEHOSTING)
      references PAQUETEHOSTING (IDPAQUETEHOSTING) on delete restrict on update restrict;

alter table CUENTA add constraint FK_PAIS_CLIENTE foreign key (IDPAIS)
      references PAIS (IDPAIS) on delete restrict on update restrict;

alter table CUENTA add constraint FK_PLAN_CUENTA foreign key (IDPLAN)
      references PLAN (IDPLAN) on delete restrict on update restrict;

alter table CUENTA add constraint FK_TIPOCUENTA_CUENTA foreign key (IDTIPOCUENTA)
      references TIPOCUENTA (IDTIPOCUENTA) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_EMPLEADO_ESTADO foreign key (IDESTADOEMPLEADO)
      references ESTADOEMPLEADO (IDESTADOEMPLEADO) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_PAIS_EMPLEADO foreign key (IDPAIS)
      references PAIS (IDPAIS) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_TIPOEMPLEADO_EMPLEADO foreign key (IDTIPOEMPLEADO)
      references TIPOEMPLEADO (IDTIPOEMPLEADO) on delete restrict on update restrict;

alter table FACTURA add constraint FK_CARRITO_FACTURA2 foreign key (IDCARRITO)
      references CARRITO (IDCARRITO) on delete restrict on update restrict;

alter table METODOPAGOCUENTA add constraint FK_CUENTA_METODOPAGO foreign key (IDCUENTA)
      references CUENTA (IDCUENTA) on delete restrict on update restrict;

alter table METODOPAGOCUENTA add constraint FK_TARJETA_METODOPAGO foreign key (IDTARJETA)
      references TARJETA (IDTARJETA) on delete restrict on update restrict;

alter table METODOPAGOCUENTA add constraint FK_TIPOPAGO_CUENTA foreign key (IDTIPOMETODOPAGO)
      references TIPOMETODOPAGO (IDTIPOMETODOPAGO) on delete restrict on update restrict;

alter table PERIODICIDADPRECIOPAQUETE add constraint FK_PAQUETE_PERIODICIDADPRECIO foreign key (IDPAQUETEHOSTING)
      references PAQUETEHOSTING (IDPAQUETEHOSTING) on delete restrict on update restrict;

alter table PERIODICIDADPRECIOPAQUETE add constraint FK_PERIODICIDAD_PRECIO foreign key (IDPERIODICIDADPAGO)
      references PERIODICIDADPAGO (IDPERIODICIDADPAGO) on delete restrict on update restrict;

alter table SOLICITUDDOMINIO add constraint FK_DOMINIO_SOLICITUDDOMINIO foreign key (IDDOMINIO)
      references DOMINIO (IDDOMINIO) on delete restrict on update restrict;

alter table SOLICITUDDOMINIO add constraint FK_SOLICITUD_ESTADO foreign key (IDSOLICITUDESTADO)
      references SOLICITUDESTADO (IDSOLICITUDESTADO) on delete restrict on update restrict;

alter table SOLICITUDESTADO add constraint FK_TIPO_ESTADO_SOLICITUD foreign key (IDTIPOESTADO)
      references TIPOESTADOSSOLICITUD (IDTIPOESTADO) on delete restrict on update restrict;

alter table TARJETA add constraint FK_TIPOTARJETA_TARJETA foreign key (IDTIPOTARJETA)
      references TIPOTARJETA (IDTIPOTARJETA) on delete restrict on update restrict;

-- Volcado de datos para la tabla metodopago
INSERT INTO tipometodopago (IDTIPOMETODOPAGO, NOMBRETIPOMETODOPAGO) VALUES
(1, 'TARJETA'),
(2, 'PSE');

-- Volcado de datos para la tabla pais
INSERT INTO pais (IDPAIS, NOMBREPAIS) VALUES
(76, 'BRASIL'),
(170, 'COLOMBIA'),
(218, 'ECUADOR'),
(604, 'PERÚ'),
(862, 'VENEZUELA');

-- Volcado de datos para la tabla paquetehosting
INSERT INTO paquetehosting (IDPAQUETEHOSTING, CANTIDADSITIOS, NOMBREPAQUETEHOSTING, BD, GBENSSD, CORREOS, CERTIFICADOSSSLHTTPS) VALUES
('1', 1, 'PLATA', 2, 10, 10, 1),
('2', 2, 'PLATINO', 20, 20, 20, 2),
('3', 5, 'ORO', 0, 60, 60, 5);

-- Volcado de datos para la tabla periodicidadpago
INSERT INTO periodicidadpago (IDPERIODICIDADPAGO, NOMBREPERIODICIDAD) VALUES
(1, 'MENSUAL'),
(2, 'SEMESTRAL'),
(3, 'ANUAL');

-- Volcado de datos para la tabla periodicidadpreciopaquete
INSERT INTO periodicidadpreciopaquete (IDPERIODICIDADPAGO, IDPAQUETEHOSTING, IDPERIODICIDADPRECIOPAQUETE, PRECIO) VALUES
(1, '1', '1', 3.00),
(1, '2', '4', 5.00),
(1, '3', '7', 11.00),
(2, '1', '2', 15.00),
(2, '2', '5', 25.00),
(2, '3', '8', 55.00),
(3, '1', '3', 30.00),
(3, '2', '6', 50.00),
(3, '3', '9', 110.00);

-- Volcado de datos para la tabla plan
INSERT INTO plan (IDPLAN, NOMBREPLAN, Comision) VALUES
('0', 'Sin plan', 0),
('1', 'Básico', 10),
('2', 'Premium', 15);

-- Volcado de datos para la tabla tipocuenta
INSERT INTO tipocuenta (IDTIPOCUENTA, NOMBRETIPO) VALUES
(1, 'CLIENTE'),
(2, 'DISTRIBUIDOR');

-- Volcado de datos para la tabla tipoempleado
INSERT INTO tipoempleado (IDTIPOEMPLEADO, NOMBRETIPOEMPLEADO) VALUES
(1, 'ADMIN'),
(2, 'SOPORTE');

-- Volcado de datos para la tabla tipotarjeta
INSERT INTO tipotarjeta (IDTIPOTARJETA, NOMBRETIPOTARJETA) VALUES
(1, 'VISA'),
(2, 'MASTERCARD'),
(3, 'DINERS');