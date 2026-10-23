if not exists(select* from INFORMATION_SCHEMA.TABLES T WHERE T.TABLE_NAME = 'foro_maestro')
   BEGIN
create table foro_maestro
(
   id int NOT NULL,
   codusu nvarchar(20) NOT NULL,
   nomcaso nvarchar (200) NOT NULL,
   fecsys datetime NOT NULL DEFAULT(GETDATE()),
   comentarios int NOT NULL,
   descripcion nvarchar(1000),
   rutaimg nvarchar(400),
   estado bit NOT NULL
   CONSTRAINT [PK_for_maestro] PRIMARY KEY CLUSTERED
   (
     id ASC
   )
)
END

if not exists(select* from INFORMATION_SCHEMA.TABLES T WHERE T.TABLE_NAME = 'foro_imagen')
   BEGIN
create table foro_imagen
(
   idmaestro int NOT NULL,
   item int NOT NULL,
   ruta nvarchar(300) NOT NULL,
   idcomentario nvarchar(200) NOT NULL
   CONSTRAINT [PK_foro_imagen] PRIMARY KEY CLUSTERED
   (
     idmaestro ASC,
	 item ASC
   )
)
END


if not exists (select* from INFORMATION_SCHEMA.TABLES T Where t.TABLE_NAME = 'foro_detalle')
   BEGIN
     CREATE TABLE foro_detalle
	 (
	   idpregunta int NOT NULL,
	   idcomentario int NOT NULL,
	   codusu nvarchar(50) NOT NULL,
	   comentario nvarchar(1000) NOT NULL,
	   estrellas decimal(5,4) NOT NULL,
	   estado bit NOT NULL,
	   rutaimg nvarchar(300) NOT NULL
	   CONSTRAINT [PK_foro_detalle] PRIMARY KEY CLUSTERED
	   (
	     idpregunta ASC,
		 idcomentario ASC,
		 codusu ASC
	   )
	 )
   END
if not exists(select* from INFORMATION_SCHEMA.TABLES T where T.TABLE_NAME = 'foro_calificacion')
   BEGIN
     CREATE TABLE foro_calificacion
	 (
	   idpregunta int NOT NULL,	    
	   idcomentario int NOT NULL,
	   codusu nvarchar(50) NOT NULL,
	   puntuacion int NOT NULL
	   CONSTRAINT [PK_for_calificacion] PRIMARY KEY CLUSTERED
	   (
	     idpregunta ASC,
		 idcomentario ASC,
		 codusu ASC
	   )
	 )
   END
