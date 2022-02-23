	--------------------------------------------------------------------------------
-- INNSERT
	--------------------------------------------------------------------------------
declare

usuario USUARIOS_DAVID%ROWTYPE;

BEGIN

SELECT
SEC_ID_USUARIOS_DAVID.NEXTVAL,
1143985244,
'Carol',
'Fernanda',
'Torres',
'Villa',
'132545'
INTO usuario
FROM DUAL;

PKG_USUARIOS_DAVID.PROC_REGISTRAR_USUARIO(usuario);

END;

select * from USUARIOS_DAVID;

	--------------------------------------------------------------------------------
--UPDATE
	--------------------------------------------------------------------------------
declare

updateUsuario USUARIOS_DAVID%ROWTYPE;

BEGIN

SELECT
9,
1234567,
'Carol',
'Andrea',
'LOPEZ',
'MERA',
'6554654ms'
INTO updateUsuario
FROM DUAL;

PKG_USUARIOS_DAVID.PROC_ACTUALIZAR_USUARIO(updateUsuario);

END;

select * from USUARIOS_DAVID;

	--------------------------------------------------------------------------------
--DELETE
	--------------------------------------------------------------------------------
declare

idUsuario USUARIOS_DAVID.id%TYPE;

BEGIN

SELECT
10
INTO idUsuario
FROM DUAL;

PKG_USUARIOS_DAVID.PROC_ELIMINAR_USUARIO(idUsuario);

END;

select * from USUARIOS_DAVID;

	--------------------------------------------------------------------------------
--consultar datos por id de usuarios_david
	--------------------------------------------------------------------------------
select PKG_USUARIOS_DAVID.func_datos_id(9)as usuario from dual;

	--------------------------------------------------------------------------------
--consultar todos los datos de usuarios_david
	--------------------------------------------------------------------------------
select PKG_USUARIOS_DAVID.PROC_DATOS_USUARIOS from dual;