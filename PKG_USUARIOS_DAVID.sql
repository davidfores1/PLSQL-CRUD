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

     /* Declaración de variable tipo cursor */
    TYPE tipo_cursor IS REF CURSOR;


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
    
    Function PROC_DATOS_USUARIOS
    Return tipo_cursor;
    
      Function func_datos_id
	(
		procIdUsuario   IN    USUARIOS_DAVID.ID%TYPE
	)
    Return tipo_cursor;
    


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
        primer_nombre,
        segundo_nombre,
        primer_apellido,
        segundo_apellido,
        contrasena
		)
		VALUES
		(
        procUsuario.id,
		procUsuario.identificacion,
		procUsuario.primer_nombre,
        procUsuario.segundo_nombre,
		procUsuario.primer_apellido,
		procUsuario.segundo_apellido,
		procUsuario.contrasena
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
		primer_nombre = procUsuario.primer_nombre,
        segundo_nombre = procUsuario.segundo_nombre,
		primer_apellido = procUsuario.primer_apellido,
		segundo_apellido = procUsuario.segundo_apellido,
        contrasena = procUsuario.contrasena
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
    
   -------------------------------------------------------------------------------
  -- FUNCION PARA OBTENER UN CURSOR CON TODOS LOS DATOS
  -------------------------------------------------------------------------------
  Function PROC_DATOS_USUARIOS
  RETURN tipo_cursor IS
  
  /*VARIABLE CURSOR*/
  cursorDatosUsuarios tipo_cursor;

	Begin

   Open cursorDatosUsuarios For
       Select
        *
       From
        USUARIOS_DAVID;

    Return cursorDatosUsuarios;

	End PROC_DATOS_USUARIOS;
    
    -------------------------------------------------------------------------------
  -- FUNCION PARA OBTENER UN CURSOR CON SUS DATOS
  -------------------------------------------------------------------------------
  Function func_datos_id
	(
		procIdUsuario IN  USUARIOS_DAVID.ID%TYPE
	)
 RETURN tipo_cursor IS

  /*VARIABLE CURSOR*/
  cursorDatos tipo_cursor;

	Begin

   Open cursorDatos For
       Select
        *
       From
        USUARIOS_DAVID
       Where
        id = procIdUsuario;

    Return cursorDatos;

	End func_datos_id;

END PKG_USUARIOS_DAVID;