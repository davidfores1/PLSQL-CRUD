create or replace PACKAGE PKG_CB_EMPLEADOS AS
/*==============================================================*/
/* SISTEMA:     4SD - PACKAGE CRUD           					          */
/* PAQUETE:     PKG_CB_EMPLEADOS.sql     	                      */
/* DESCRIPCION: CRUD PARA: EMPLEADO       			        */
/* AUTOR:       David Forero							                    */
/* FECHA:       05/02/2022                                      */
/*==============================================================*/
/*--------------------------------------------------------------------------------
	Métodos   
	--------------------------------------------------------------------------------
	Procedimientos 
	--------------------------------------------------------------------------------
		Statement INSERT
	--------------------------------------------------------------------------------
	pr_InsertEmpleado[Record]
	--------------------------------------------------------------------------------
		Statement  UPDATE
	--------------------------------------------------------------------------------
	pr_UpdateEmpleado[Record]
	--------------------------------------------------------------------------------
		Statement  DELETE
	--------------------------------------------------------------------------------
	pr_deleteEmpleado[Key]
	--------------------------------------------------------------------------------*/

  -----------------------------------------------------------------------------
  -- pr_InsertEmpleado
  -----------------------------------------------------------------------------
	PROCEDURE pr_InsertEmpleado
	(
		PrcEmpleado  IN  EMPLEADOS%ROWTYPE
	);

  -----------------------------------------------------------------------------
  -- pr_UpdateEmpleado
  -----------------------------------------------------------------------------
	PROCEDURE pr_UpdateEmpleado
	(
		PrcEmpleado  IN  EMPLEADOS%ROWTYPE
	);

  -----------------------------------------------------------------------------
  -- pr_deleteEmpleado
  -----------------------------------------------------------------------------
	PROCEDURE pr_deleteEmpleado
	(
		 PrcId_Docu   IN  EMPLEADOS.ID_EMPLEADO%TYPE
	);


END PKG_CB_EMPLEADOS;
/


create or replace PACKAGE BODY PKG_CB_EMPLEADOS AS 
/*==============================================================*/
/* SISTEMA:     4SD - PACKAGE CRUD           					          */
/* PAQUETE:     PKG_CB_EMPLEADOS.sql     	                      */
/* DESCRIPCION: CRUD PARA: EMPLEADO       			        */
/* AUTOR:       David Forero							                    */
/* FECHA:       05/02/2022                                      */
/*==============================================================*/
  -----------------------------------------------------------------------------
  -- pr_InsRecord
  -----------------------------------------------------------------------------
	PROCEDURE pr_InsertEmpleado
	(
		PrcEmpleado IN EMPLEADOS%ROWTYPE
	)
	IS


	BEGIN

		INSERT INTO EMPLEADOS
		(
        ID_EMPLEADO,
		CEDULA,
		NOMBRE,
		FECHE,
		ESTADO,
		OBSERVACION,
		SEXO
		)
		VALUES
		(
        PrcEmpleado.ID_EMPLEADO,
		PrcEmpleado.CEDULA,
		PrcEmpleado.NOMBRE,
		PrcEmpleado.FECHE,
		PrcEmpleado.ESTADO,
		PrcEmpleado.OBSERVACION,
		PrcEmpleado.SEXO
		);

	END pr_InsertEmpleado;


  -----------------------------------------------------------------------------
  -- pr_UpRecord
  -----------------------------------------------------------------------------
	PROCEDURE pr_UpdateEmpleado
	(
		PrcEmpleado IN EMPLEADOS%ROWTYPE
	)
	IS


	BEGIN

		UPDATE EMPLEADOS
		SET
		ID_EMPLEADO = PrcEmpleado.ID_EMPLEADO,
		CEDULA = PrcEmpleado.CEDULA,
		NOMBRE = PrcEmpleado.NOMBRE,
		FECHE = PrcEmpleado.FECHE,
		ESTADO = PrcEmpleado.ESTADO,
		OBSERVACION = PrcEmpleado.OBSERVACION,
		SEXO = PrcEmpleado.SEXO
		WHERE
        ID_EMPLEADO = PrcEmpleado.ID_EMPLEADO;

	END pr_UpdateEmpleado;

  -----------------------------------------------------------------------------
  -- pr_DelRecord
  -----------------------------------------------------------------------------
	PROCEDURE pr_deleteEmpleado
	(
		 PrcId_Docu   IN  EMPLEADOS.ID_EMPLEADO%TYPE
	)

	IS

	BEGIN

	DELETE
        EMPLEADOS
    WHERE
        ID_EMPLEADO 	=	PrcId_Docu;

	END pr_deleteEmpleado;

END PKG_CB_EMPLEADOS;