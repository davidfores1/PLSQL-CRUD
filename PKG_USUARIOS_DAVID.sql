create or replace PACKAGE PKG_USUARIOS_DAVID AS
/*==============================================================*/
/* SISTEMA:     CRUD Usuarios David            					          */
/* PAQUETE:     PKG_USUARIOS_DAVID.sql     	                      */
/* DESCRIPCION: Crud para usuarios de David       			        */
/* AUTOR:       David Forero							                    */
/* FECHA:       23/02/2022                                      */
/*==============================================================*/
/*-------------------------------------------------------------------------------- 

	PROCEDIMIENTOS:
	--------------------------------------------------------------------------------
    INSERT	
	PROC_REGISTRAR_USUARIO[REGISTROS]
	--------------------------------------------------------------------------------
    UPDATE
    PROC_ACTUALIZAR_USUARIO[REGISTROS]
    --------------------------------------------------------------------------------
    Statement  DELETE
	PROC_ELIMINAR_USUARIO[Key]
	--------------------------------------------------------------------------------*/
/*==============================================================*/


	PROCEDURE PROC_REGISTRAR_USUARIO
	(
		procUsuario  IN  USUARIOS_DAVID%ROWTYPE
	);


	PROCEDURE PROC_ACTUALIZAR_USUARIO
	(
		procUsuario  IN  USUARIOS_DAVID%ROWTYPE
	);


	PROCEDURE PROC_ELIMINAR_USUARIO
	(
		 procIdUsuario   IN  USUARIOS_DAVID.ID%TYPE
	);


END PKG_USUARIOS_DAVID;
/

create or replace PACKAGE BODY PKG_USUARIOS_DAVID AS 
/*==============================================================*/
/* SISTEMA:     CRUD Usuarios David            					          */
/* PAQUETE:     PKG_USUARIOS_DAVID.sql     	                      */
/* DESCRIPCION: Crud para usuarios de David       			        */
/* AUTOR:       David Forero							                    */
/* FECHA:       23/02/2022                                      */
/*==============================================================*/
  -----------------------------------------------------------------------------
    -- INSERT	
	-- PROC_REGISTRAR_USUARIO[REGISTROS]
  -----------------------------------------------------------------------------
	PROCEDURE PROC_REGISTRAR_USUARIO
	(
		procUsuario IN USUARIOS_DAVID%ROWTYPE
	)
	IS


	BEGIN

		INSERT INTO USUARIOS_DAVID
		(
        id,
        identificacion,
        nombre,
        apellido1,
        apellido2,
		direccion,
        edad
		)
		VALUES
		(
        procUsuario.id,
		procUsuario.identificacion,
		procUsuario.nombre,
		procUsuario.apellido1,
		procUsuario.apellido2,
		procUsuario.direccion,
		procUsuario.edad
		);

	END PROC_REGISTRAR_USUARIO;


  -----------------------------------------------------------------------------
    -- UPDATE
    -- PROC_ACTUALIZAR_USUARIO[REGISTROS]
  -----------------------------------------------------------------------------
	PROCEDURE PROC_ACTUALIZAR_USUARIO
	(
		procUsuario IN USUARIOS_DAVID%ROWTYPE
	)
	IS


	BEGIN

		UPDATE USUARIOS_DAVID
		SET
        id = procUsuario.id,
		identificacion = procUsuario.identificacion,
		nombre = procUsuario.nombre,
		apellido1 = procUsuario.apellido1,
		apellido2 = procUsuario.apellido2,
		direccion = procUsuario.direccion,
		edad = procUsuario.edad
		WHERE
        id = procUsuario.id;

	END PROC_ACTUALIZAR_USUARIO;

  -----------------------------------------------------------------------------
    --DELETE
	--PROC_ELIMINAR_USUARIO[Key]
  -----------------------------------------------------------------------------
	PROCEDURE PROC_ELIMINAR_USUARIO
	(
		 procIdUsuario   IN  USUARIOS_DAVID.id%TYPE
	)

	IS

	BEGIN

	DELETE
        USUARIOS_DAVID
    WHERE
        id = procIdUsuario;

	END PROC_ELIMINAR_USUARIO;

END PKG_USUARIOS_DAVID;