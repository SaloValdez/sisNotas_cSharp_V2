USE [DBNOTAS]
GO
/****** Object:  User [acuario]    Script Date: 7/01/2018 12:36:13 ******/
CREATE USER [acuario] FOR LOGIN [acuario] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [kenyi]    Script Date: 7/01/2018 12:36:13 ******/
CREATE USER [kenyi] FOR LOGIN [kenyi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [WILSON]    Script Date: 7/01/2018 12:36:13 ******/
CREATE USER [WILSON] FOR LOGIN [WILSON] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [acuario]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [acuario]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [acuario]
GO
ALTER ROLE [db_owner] ADD MEMBER [WILSON]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [WILSON]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [WILSON]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [WILSON]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [WILSON]
GO
ALTER ROLE [db_datareader] ADD MEMBER [WILSON]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [WILSON]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [WILSON]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [WILSON]
GO
/****** Object:  StoredProcedure [dbo].[actualizar_alumno]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[actualizar_alumno]
@nombre varchar(60),
@apellido varchar(90),
@direccion varchar(150),
@idcarrera int,
@idsemestre int,
@idalumno int
as
 update ALUMNO set 
 nombre = @nombre,
 apellido=@apellido,
 direccion=@direccion,
 idcarrera=@idcarrera,
 idsemestre=@idsemestre
 where idalumno = @idalumno

GO
/****** Object:  StoredProcedure [dbo].[actualizar_carrera]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[actualizar_carrera]
@descripcion varchar(50),
@idcarrera int
as
 update CARRERA set 
 descripcion = @descripcion
 where idcarrera = @idcarrera

GO
/****** Object:  StoredProcedure [dbo].[actualizar_curso]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[actualizar_curso]
@nombre varchar(50),
@idcurso int
as
 update CURSO set 
 nombre = @nombre
 where idcurso = @idcurso
GO
/****** Object:  StoredProcedure [dbo].[actualizar_docente]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[actualizar_docente]
@nombre varchar(100),
@iddocente int
as
 update DOCENTE set 
 nombre = @nombre
 where iddocente = @iddocente

GO
/****** Object:  StoredProcedure [dbo].[actualizar_registro]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[actualizar_registro]

@idcurso int,
@idalumno int,
@iddocente int,
@nota1 int,
@nota2 int,
@nota3 int,
@promedio decimal,
@observacion varchar(50),
@id int
as
 update REGISTRO set 
 idcurso = @idcurso,
 idalumno=@idalumno,
 iddocente=@iddocente,
 Nota1=@nota1,
 Nota2=@nota2,
   Nota3=@nota3,
 promedio=@promedio,
 Observacion = @observacion
 where idregistro = @id
GO
/****** Object:  StoredProcedure [dbo].[actualizar_semestre]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[actualizar_semestre]
@descripcion varchar(50),
@idsemestre int
as
 update SEMESTRE set 
 descripcion = @descripcion
 where idsemestre = @idsemestre

GO
/****** Object:  StoredProcedure [dbo].[actualizar_usuario]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[actualizar_usuario]
@usuario varchar(20),
@contrasena varchar(20),
@idusuario int
as
 update USUARIO set 
 usuario = @usuario,
 contrasena=@contrasena
 where idusuario = @idusuario

GO
/****** Object:  StoredProcedure [dbo].[eliminar_alumno]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  proc [dbo].[eliminar_alumno]
@idalumno int
as
delete from ALUMNO
where idalumno = @idalumno
GO
/****** Object:  StoredProcedure [dbo].[eliminar_carrera]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  proc [dbo].[eliminar_carrera]
@idcarrera int
as
delete from CARRERA
where idcarrera = @idcarrera
GO
/****** Object:  StoredProcedure [dbo].[eliminar_curso]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[eliminar_curso]
@idcurso int
as
delete from CURSO
where idcurso = @idcurso
GO
/****** Object:  StoredProcedure [dbo].[eliminar_docente]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  proc [dbo].[eliminar_docente]
@iddocente int
as
delete from DOCENTE
where iddocente = @iddocente
GO
/****** Object:  StoredProcedure [dbo].[eliminar_registro]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_registro]
@id int
as
delete from REGISTRO WHERE idregistro = @id
GO
/****** Object:  StoredProcedure [dbo].[eliminar_semestre]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  proc [dbo].[eliminar_semestre]
@idsemestre int
as
delete from SEMESTRE
where idsemestre = @idsemestre
GO
/****** Object:  StoredProcedure [dbo].[eliminar_usuario]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  proc [dbo].[eliminar_usuario]
@idusuario int
as
delete from USUARIO
where idusuario = @idusuario
GO
/****** Object:  StoredProcedure [dbo].[insertar_alumno]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_alumno]
@nombre varchar(60),
@apellido varchar(90),
@direccion varchar(150),
@idcarrera int,
@idsemestre int
as
insert into ALUMNO(nombre,apellido,direccion,idcarrera,idsemestre) values (@nombre,@apellido,@direccion,@idcarrera,@idsemestre)

GO
/****** Object:  StoredProcedure [dbo].[insertar_carrera]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_carrera]
@descripcion varchar(50)
as
insert into CARRERA(descripcion) values (@descripcion)
GO
/****** Object:  StoredProcedure [dbo].[insertar_curso]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_curso]
@nombre varchar(50)
as
insert into CURSO(nombre) values (@nombre)
GO
/****** Object:  StoredProcedure [dbo].[insertar_docente]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_docente]
@nombre varchar(100)
as
insert into DOCENTE(nombre) values (@nombre)
GO
/****** Object:  StoredProcedure [dbo].[insertar_registro]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertar_registro]
@idalumno int,
@idcurso int,
@iddocente int,
@nota1 int,
@nota2 int,
@nota3 int,
@promedio decimal,
@observacion varchar(50)
as
insert into REGISTRO(idalumno,idcurso,iddocente,nota1,nota2,nota3,promedio,observacion) values (@idalumno,@idcurso,@iddocente,@nota1,@nota2,@nota3,@promedio,@observacion)
GO
/****** Object:  StoredProcedure [dbo].[insertar_semestre]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_semestre]
@descripcion varchar(50)
as
insert into SEMESTRE(descripcion) values (@descripcion)
GO
/****** Object:  StoredProcedure [dbo].[insertar_usuario]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_usuario]
@usuario varchar(20),
@contrasena varchar(20)
as
insert into USUARIO(usuario,contrasena) values (@usuario,@contrasena)
GO
/****** Object:  StoredProcedure [dbo].[listar_alumno]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_alumno]
as
select idalumno,nombre,apellido,direccion,idcarrera,idsemestre from ALUMNO

GO
/****** Object:  StoredProcedure [dbo].[listar_alumno_rep]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_alumno_rep]
as
select * from ALUMNO
GO
/****** Object:  StoredProcedure [dbo].[listar_buscar_alumno]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_buscar_alumno]
@id int
as
select * from ALUMNO where idalumno = @id
GO
/****** Object:  StoredProcedure [dbo].[listar_buscar_carrera]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_buscar_carrera]
@id int
as
select * from CARRERA where idcarrera = @id; 
GO
/****** Object:  StoredProcedure [dbo].[listar_buscar_curso]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_buscar_curso]
@id int
as
select * from CURSO where idcurso = @id; 
GO
/****** Object:  StoredProcedure [dbo].[listar_buscar_docente]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_buscar_docente]
@id int
as
select * from DOCENTE where iddocente = @id
GO
/****** Object:  StoredProcedure [dbo].[listar_buscar_registro]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_buscar_registro]
@id int
as
select * from REGISTRO where idregistro = @id
GO
/****** Object:  StoredProcedure [dbo].[listar_buscar_semestre]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_buscar_semestre]
@id int
as
select * from SEMESTRE where idsemestre = @id
GO
/****** Object:  StoredProcedure [dbo].[listar_buscar_usuario]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_buscar_usuario]
@id int
as
select * from USUARIO where idusuario = @id
GO
/****** Object:  StoredProcedure [dbo].[listar_carrera]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_carrera]
as
select idcarrera,descripcion from CARRERA

GO
/****** Object:  StoredProcedure [dbo].[Listar_Carrera_Combo]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Listar_Carrera_Combo]
AS
BEGIN
SELECT idcarrera AS idcarrera,descripcion
from CARRERA
end
GO
/****** Object:  StoredProcedure [dbo].[listar_combo_carrera]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listar_combo_carrera]
as
select idcarrera,descripcion from CARRERA

GO
/****** Object:  StoredProcedure [dbo].[listar_combo_semestre]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listar_combo_semestre]
as
select idsemestre,descripcion from SEMESTRE
GO
/****** Object:  StoredProcedure [dbo].[listar_curso]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_curso]
as
select idcurso,nombre from CURSO
GO
/****** Object:  StoredProcedure [dbo].[listar_docente]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_docente]
as
select iddocente,nombre from DOCENTE

GO
/****** Object:  StoredProcedure [dbo].[listar_registro]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_registro]
as
select * from REGISTRO
GO
/****** Object:  StoredProcedure [dbo].[Listar_Registro_Rep]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Listar_Registro_Rep]
AS
BEGIN
SELECT idregistro , (AL.nombre + '' + AL.apellido) as nombres, CUR.nombre as curso , DOC.nombre as docente , REG.nota1 ,REG.nota2 ,REG.nota3 , REG.promedio , REG.observacion 
FROM registro REG inner join alumno AL on REG.idalumno=AL.idalumno 
inner join CURSO CUR on REG.idcurso = CUR.idcurso 
inner join docente DOC on REG.iddocente = DOC.iddocente
end
GO
/****** Object:  StoredProcedure [dbo].[listar_semestre]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_semestre]
as
select idsemestre,descripcion from SEMESTRE

GO
/****** Object:  StoredProcedure [dbo].[listar_usuario]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_usuario]
as
select idusuario,usuario,contrasena from USUARIO

GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[login]
@usuario varchar(20),
@contrasena varchar(20)
as 
select * from USUARIO
where usuario=@usuario AND contrasena=@contrasena
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_Categoria]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create proc [dbo].[sp_actualizar_Categoria]
	@IdCategoria int,
	@DescripcionCategoria varchar(50)

	as  update CATEGORIA set
	DescripcionCategoria=@DescripcionCategoria
	where IdCategoria = @IdCategoria
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_nombre_docente]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_buscar_nombre_docente]
	@nombreDocente varchar(100)
	as
	select iddocente,nombre 
from docente

where nombre like '%' + RTRIM(@nombreDocente) + '%'

GO
/****** Object:  StoredProcedure [dbo].[sp_combo_categoria]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create proc  [dbo].[sp_combo_categoria]
	as
	select * from categoria
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_categoria]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create proc [dbo].[sp_eliminar_categoria]
	@idcategoria int
	as
delete from categoria 
	where IdCategoria = @idcategoria
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_categoria]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_insertar_categoria]
	@DescripcionCategoria varchar(50)
	as
	insert into Categoria(DescripcionCategoria )
	values(@DescripcionCategoria)
	select max(IdCategoria)
	from  Categoria
GO
/****** Object:  StoredProcedure [dbo].[sp_lista_categoria]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_lista_categoria]
as select  * from CATEGORIA
GO
/****** Object:  Table [dbo].[ALUMNO]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ALUMNO](
	[idalumno] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
	[apellido] [varchar](90) NULL,
	[direccion] [varchar](150) NULL,
	[idcarrera] [int] NULL,
	[idsemestre] [int] NULL,
 CONSTRAINT [PK_ALUMNO] PRIMARY KEY CLUSTERED 
(
	[idalumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CARRERA]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CARRERA](
	[idcarrera] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_CARRERA] PRIMARY KEY CLUSTERED 
(
	[idcarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CURSO]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CURSO](
	[idcurso] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_CURSO] PRIMARY KEY CLUSTERED 
(
	[idcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DOCENTE]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DOCENTE](
	[iddocente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
 CONSTRAINT [PK_DOCENTE] PRIMARY KEY CLUSTERED 
(
	[iddocente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REGISTRO]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REGISTRO](
	[idregistro] [int] IDENTITY(1,1) NOT NULL,
	[idcurso] [int] NULL,
	[idalumno] [int] NULL,
	[iddocente] [int] NULL,
	[nota1] [int] NULL,
	[nota2] [int] NULL,
	[nota3] [int] NULL,
	[promedio] [decimal](18, 2) NULL,
	[observacion] [varchar](50) NULL,
 CONSTRAINT [PK_REGISTRO] PRIMARY KEY CLUSTERED 
(
	[idregistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEMESTRE]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEMESTRE](
	[idsemestre] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_SEMESTRE] PRIMARY KEY CLUSTERED 
(
	[idsemestre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 7/01/2018 12:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USUARIO](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](20) NULL,
	[contrasena] [varchar](20) NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ALUMNO] ON 

INSERT [dbo].[ALUMNO] ([idalumno], [nombre], [apellido], [direccion], [idcarrera], [idsemestre]) VALUES (2087, N'JUAN RANJIEL', N'SALAS MANRIQUE', N'SIMON BOLIVAR 234', 3, 1016)
INSERT [dbo].[ALUMNO] ([idalumno], [nombre], [apellido], [direccion], [idcarrera], [idsemestre]) VALUES (2088, N'GABRIEL', N'RUIZ MATOS', N'B N 234UGAMBILLAS', 1002, 1016)
INSERT [dbo].[ALUMNO] ([idalumno], [nombre], [apellido], [direccion], [idcarrera], [idsemestre]) VALUES (2089, N'NIKKO ROEL ', N'PAREZ ALARCON', N'MIRAFLORES  Nº 234', 2, 2)
INSERT [dbo].[ALUMNO] ([idalumno], [nombre], [apellido], [direccion], [idcarrera], [idsemestre]) VALUES (3707, N'sdsd', N'sdsd', N'sdsd', 3, 1015)
INSERT [dbo].[ALUMNO] ([idalumno], [nombre], [apellido], [direccion], [idcarrera], [idsemestre]) VALUES (3708, N'sdsd', N'sdsd', N'sdsd', 2, 2)
SET IDENTITY_INSERT [dbo].[ALUMNO] OFF
SET IDENTITY_INSERT [dbo].[CARRERA] ON 

INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (1, N'COMPUTACION E INFORMATICA')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2, N'CONTABILIDAD')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (3, N'DISEÑO GRAFICO')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (1002, N'NEGOCIOS INTERNACIONALES')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (1005, N'CONSTRUCCION CIVIL')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2017, N'ADASDASDASD')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2018, N'ASDASDASD')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2020, N'ASDASDASD')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2021, N'ASDASDASD')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2022, N'ASDASDAS')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2023, N'ASDASD')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2024, N'ASDASDAS')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2025, N'ASDASD')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2026, N'ASDASD')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2028, N'ASDASD')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2029, N'ASDASD')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2030, N'DDDDD')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2031, N'ASDASDASD')
INSERT [dbo].[CARRERA] ([idcarrera], [descripcion]) VALUES (2032, N'')
SET IDENTITY_INSERT [dbo].[CARRERA] OFF
SET IDENTITY_INSERT [dbo].[CURSO] ON 

INSERT [dbo].[CURSO] ([idcurso], [nombre]) VALUES (26, N'COMERCIO ELECTRONICO')
INSERT [dbo].[CURSO] ([idcurso], [nombre]) VALUES (28, N'ARITMETICAS')
SET IDENTITY_INSERT [dbo].[CURSO] OFF
SET IDENTITY_INSERT [dbo].[DOCENTE] ON 

INSERT [dbo].[DOCENTE] ([iddocente], [nombre]) VALUES (1032, N'MARIA BELLIDO CAMARON')
INSERT [dbo].[DOCENTE] ([iddocente], [nombre]) VALUES (1059, N'LUCAS LEOPOLDOS MATOS')
INSERT [dbo].[DOCENTE] ([iddocente], [nombre]) VALUES (1060, N'MARIA BELLIDO CAMARONES')
INSERT [dbo].[DOCENTE] ([iddocente], [nombre]) VALUES (1067, N'MARIA BELLIDO CAMARON')
INSERT [dbo].[DOCENTE] ([iddocente], [nombre]) VALUES (1068, N'GABRIEL RAMIREZ SOTO')
SET IDENTITY_INSERT [dbo].[DOCENTE] OFF
SET IDENTITY_INSERT [dbo].[REGISTRO] ON 

INSERT [dbo].[REGISTRO] ([idregistro], [idcurso], [idalumno], [iddocente], [nota1], [nota2], [nota3], [promedio], [observacion]) VALUES (5, 26, 2087, 1032, 44, 45, 45, CAST(45.00 AS Decimal(18, 2)), N'SDAS')
INSERT [dbo].[REGISTRO] ([idregistro], [idcurso], [idalumno], [iddocente], [nota1], [nota2], [nota3], [promedio], [observacion]) VALUES (6, 26, 2087, 1032, 12, 12, 12, CAST(12.00 AS Decimal(18, 2)), N'Aprobado')
INSERT [dbo].[REGISTRO] ([idregistro], [idcurso], [idalumno], [iddocente], [nota1], [nota2], [nota3], [promedio], [observacion]) VALUES (7, 26, 2087, 1032, 9, 9, 9, CAST(9.00 AS Decimal(18, 2)), N'Desaprobado')
INSERT [dbo].[REGISTRO] ([idregistro], [idcurso], [idalumno], [iddocente], [nota1], [nota2], [nota3], [promedio], [observacion]) VALUES (8, 26, 2087, 1032, 9, 2, 3, CAST(4.00 AS Decimal(18, 2)), N'Desaprobado')
INSERT [dbo].[REGISTRO] ([idregistro], [idcurso], [idalumno], [iddocente], [nota1], [nota2], [nota3], [promedio], [observacion]) VALUES (9, 28, 2089, 1067, 12, 12, 12, CAST(12.00 AS Decimal(18, 2)), N'Aprobado')
INSERT [dbo].[REGISTRO] ([idregistro], [idcurso], [idalumno], [iddocente], [nota1], [nota2], [nota3], [promedio], [observacion]) VALUES (10, 28, 2089, 1067, 12, 12, 12, CAST(12.00 AS Decimal(18, 2)), N'Aprobado')
INSERT [dbo].[REGISTRO] ([idregistro], [idcurso], [idalumno], [iddocente], [nota1], [nota2], [nota3], [promedio], [observacion]) VALUES (11, 26, 2087, 1032, 9, 2, 3, CAST(4.00 AS Decimal(18, 2)), N'Desaprobado')
SET IDENTITY_INSERT [dbo].[REGISTRO] OFF
SET IDENTITY_INSERT [dbo].[SEMESTRE] ON 

INSERT [dbo].[SEMESTRE] ([idsemestre], [descripcion]) VALUES (2, N'SEGUNDO')
INSERT [dbo].[SEMESTRE] ([idsemestre], [descripcion]) VALUES (1015, N'PRIMERO')
INSERT [dbo].[SEMESTRE] ([idsemestre], [descripcion]) VALUES (1016, N'TERCERO')
SET IDENTITY_INSERT [dbo].[SEMESTRE] OFF
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([idusuario], [usuario], [contrasena]) VALUES (4043, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
ALTER TABLE [dbo].[ALUMNO]  WITH CHECK ADD  CONSTRAINT [FK_ALUMNO_CARRERA] FOREIGN KEY([idcarrera])
REFERENCES [dbo].[CARRERA] ([idcarrera])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ALUMNO] CHECK CONSTRAINT [FK_ALUMNO_CARRERA]
GO
ALTER TABLE [dbo].[ALUMNO]  WITH CHECK ADD  CONSTRAINT [FK_ALUMNO_SEMESTRE] FOREIGN KEY([idsemestre])
REFERENCES [dbo].[SEMESTRE] ([idsemestre])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ALUMNO] CHECK CONSTRAINT [FK_ALUMNO_SEMESTRE]
GO
ALTER TABLE [dbo].[REGISTRO]  WITH CHECK ADD  CONSTRAINT [FK_REGISTRO_ALUMNO] FOREIGN KEY([idalumno])
REFERENCES [dbo].[ALUMNO] ([idalumno])
GO
ALTER TABLE [dbo].[REGISTRO] CHECK CONSTRAINT [FK_REGISTRO_ALUMNO]
GO
ALTER TABLE [dbo].[REGISTRO]  WITH CHECK ADD  CONSTRAINT [FK_REGISTRO_CURSO] FOREIGN KEY([idcurso])
REFERENCES [dbo].[CURSO] ([idcurso])
GO
ALTER TABLE [dbo].[REGISTRO] CHECK CONSTRAINT [FK_REGISTRO_CURSO]
GO
ALTER TABLE [dbo].[REGISTRO]  WITH CHECK ADD  CONSTRAINT [FK_REGISTRO_DOCENTE] FOREIGN KEY([iddocente])
REFERENCES [dbo].[DOCENTE] ([iddocente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REGISTRO] CHECK CONSTRAINT [FK_REGISTRO_DOCENTE]
GO
