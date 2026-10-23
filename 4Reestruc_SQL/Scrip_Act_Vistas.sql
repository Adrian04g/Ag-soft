------------
-- Vistas --
------------
IF OBJECT_ID('vArticulosInv','V') IS NOT NULL 
BEGIN
	DROP View  vArticulosInv
END
GO
CREATE view vArticulosInv
AS
SELECT	dbo.alm_articulos.codart, dbo.alm_articulos.nomart, dbo.alm_articulos.codgru, dbo.alm_articulos.codlin, dbo.alm_articulos.undart, dbo.alm_articulos.ivaart, 
        dbo.alm_articulos.codter, dbo.alm_articulos.refart, dbo.alm_articulos.preart, dbo.alm_articulos.ubic, dbo.alm_articulos.codmar, dbo.alm_inventario.caninv, 
        dbo.alm_inventario.valprom, dbo.alm_inventario.pvcart, dbo.alm_inventario.pvdart, dbo.alm_inventario.pveart, dbo.alm_inventario.pvmart, 
        dbo.alm_inventario.pvaart, dbo.alm_inventario.pvbart, dbo.alm_grupos.nomgru, dbo.alm_inventario.idemp, dbo.alm_inventario.codcto, 
        dbo.alm_articulos.porutil AS margen, dbo.alm_articulos.codbar, dbo.alm_articulos.codtalla, dbo.alm_articulos.codcol
FROM    dbo.alm_articulos 
		INNER JOIN dbo.alm_inventario ON dbo.alm_articulos.codart = dbo.alm_inventario.codart 
		INNER JOIN dbo.alm_grupos     ON dbo.alm_articulos.codgru = dbo.alm_grupos.codgru
GO

IF OBJECT_ID('vActInventario','V') IS NOT NULL 
BEGIN
	DROP View  vActInventario
END
GO
CREATE view vActInventario
AS
	SELECT	k.idemp, k.codcto, k.codart, 
			SUM((CASE t .tipcon WHEN 'E' THEN k.qtyart WHEN 'S' THEN k.qtyart * - 1 END)) AS cantidad,
			SUM((CASE t .tipcon WHEN 'E' THEN k.qtyart*Cosart WHEN 'S' THEN (k.qtyart*Cosart) * - 1 END)) AS saldoAnt
	FROM    dbo.alm_kardex AS k WITH(NOLOCK) 
			INNER JOIN dbo.glb_transaccion AS t WITH(NOLOCK) ON k.codcon = t.codtran and k.docdelete=0
	WHERE	K.undart!='FRC'
	GROUP BY k.idemp, k.codcto, k.codart
GO

IF OBJECT_ID('vComboProv','V') IS NOT NULL 
BEGIN
	DROP View  vComboProv
END
GO
CREATE view vComboProv
AS
	SELECT nitter, nomter, codigo
	FROM   dbo.glb_terceros
	WHERE  (terpro = 1 and Terinactivo=0)
GO

IF OBJECT_ID('vNitNomTer','V') IS NOT NULL 
BEGIN
	DROP View  vNitNomTer
END
GO
CREATE view vNitNomTer
AS
	SELECT     nitter, nomter
	FROM       dbo.glb_terceros
GO 


IF OBJECT_ID('vAllZonas','V') IS NOT NULL 
Begin
	Drop View vAllZonas
END
Go
CREATE VIEW vAllZonas
AS
	SELECT       Z.codigo AS codzona, Z.nombre AS nomzona, B.codbarr, B.nombarr, B.horaini1, B.horafin1, B.horaini2, B.horafin2, B.valor1, B.valor2
	FROM         dbo.glb_zonas AS Z INNER JOIN
                 dbo.glb_barrio AS B ON Z.codigo = B.codzona OR Z.codigo = B.codzona2
	Group By	 Z.nombre, B.codbarr,Z.codigo,B.nombarr,B.horaini1, B.horafin1, B.horaini2, B.horafin2, B.valor1, B.valor2

GO

IF OBJECT_ID ('vArticuloMarca','V') IS NOT NULL
Begin 
	Drop View vArticuloMarca 
End
go
CREATE VIEW vArticuloMarca
AS
	SELECT   dbo.alm_articulos.codart, dbo.alm_articulos.nomart,iif(dbo.alm_marcas.nommar is null,'',dbo.alm_marcas.nommar) as nommar, dbo.alm_articulos.refart, 
                dbo.alm_articulos.codbar, dbo.alm_articulos.codgru, dbo.alm_grupos.tipgru, dbo.alm_marcas.codmar, 
                dbo.alm_tallasart.nombre AS talla,dbo.alm_articulos.inactivo
	FROM     dbo.alm_articulos left JOIN
                dbo.alm_marcas ON dbo.alm_marcas.codmar = dbo.alm_articulos.codmar INNER JOIN
                dbo.alm_grupos ON dbo.alm_articulos.codgru = dbo.alm_grupos.codgru LEFT OUTER JOIN
                dbo.alm_tallasart ON dbo.alm_tallasart.codigo = dbo.alm_articulos.codtalla

GO

IF OBJECT_ID ('vArticulos','V') IS NOT NULL
Begin 
	Drop view vArticulos
End
Go
CREATE VIEW vArticulos
AS
	SELECT	dbo.alm_articulos.codart, dbo.alm_articulos.nomart, dbo.glb_terceros.nomter AS nompro, dbo.alm_articulos.codter, dbo.alm_articulos.codgru, 
            dbo.alm_articulos.codlin, dbo.alm_grupos.ctacmp AS codcue, SPACE(90) AS motivo, dbo.alm_grupos.nomgru, dbo.alm_lineas.nomlin, dbo.alm_marcas.nommar, 
            dbo.alm_grupos.tipgru, dbo.alm_articulos.refart, dbo.alm_articulos.codmar, CAST(0 AS bit) AS ok, dbo.alm_grupos.consigna, dbo.alm_articulos.undart,
			dbo.alm_articulos.uzona,dbo.alm_articulos.upasillo,dbo.alm_articulos.uestante,dbo.alm_articulos.ucasilla
	FROM    dbo.alm_articulos 
			INNER JOIN dbo.alm_grupos ON dbo.alm_articulos.codgru = dbo.alm_grupos.codgru 
			left JOIN dbo.alm_lineas ON dbo.alm_articulos.codlin = dbo.alm_lineas.codlin AND dbo.alm_grupos.codgru = dbo.alm_lineas.codgru 
			left  JOIN dbo.alm_marcas ON dbo.alm_articulos.codmar = dbo.alm_marcas.codmar 
			left JOIN dbo.glb_terceros ON dbo.alm_articulos.codter = dbo.glb_terceros.nitter
	WHERE   (dbo.alm_articulos.inactivo = 0)	
GO

IF OBJECT_ID ('vCencosParametros','V')IS NOT NULL 
Begin 
	Drop view vCencosParametros
End 
Go
CREATE VIEW  vCencosParametros
AS
	SELECT        C.idemp, A.prealm, A.diralm, A.telalm, A.facalm, C.codcto, C.nomcto, C.codalm, C.ctacaj, A.nomalm, A.nitalm, A.nota, A.resol, A.comemp, A.factura, A.tiremp, 
                         A.rangoi, A.rangof, A.nomequipo, A.ciualm, A.Nrocontrato,A.leyenda 
	FROM            dbo.glb_almacen AS A INNER JOIN
                         dbo.glb_empresa AS E ON E.id = A.idemp INNER JOIN
                         dbo.con_cencostos AS C ON C.almfac = A.codalm AND C.idemp = A.idemp
GO

IF OBJECT_ID ('vCiudane','V') IS NOT NULL 
Begin 
	Drop view vCiudane
End 
Go
CREATE VIEW vCiudane
AS
	SELECT   nomciu, coddane
	FROM         dbo.glb_ciudad
Group By nomciu, coddane 

GO	

IF OBJECT_ID ('vClasiven','V') IS NOT NULL 
Begin 
	Drop view vClasiven
End
Go
CREATE VIEW vClasiven
AS
	SELECT     nombre, codigo
	FROM       dbo.glb_clasiven

GO

IF OBJECT_ID ('vCliente','V') IS NOT NULL 
Begin 
	Drop view vCliente
End 
Go 
CREATE VIEW vCliente
AS
	SELECT     nitter, nomter, tipter, divter,  terotr, terven, teremp, terpro, tercli, tercob, telter, dirter, dirter2, ciuter,  
				fecsys,  contacto, celular, fax, descrip, codpro, codigo, fecnac, mail, sexo, web, lista, arp, cesantia, 
				codest, conduc, eps, pension, barrio,  apellido1, apellido2, cupocre, diasvenc, dptoter, nombre1, otros,  tipid, 
				vendedor, civil,  codtipo,  lugexp, porcom,  terprof, zona, cedulafiad, 
				 celfiad1, celfiad2, dirfiad1, dirfiad2, nombrefiad, telfiad1, telfiad2, telter2, 
				ucmvmcl, upgomcl, cupo, diacobro1, diacobro2, fcobro, finicial, periodo, vrcuota, vrinicial, 
				codcargo, codhobby, codprof, empresa, hijos, sueldo, celfiad3, dirfiad3, telfiad3, act_eco, 
				ciiu, estrato, fec_exp, inicio_labora, nit_empresa, niv_est, per_cargo, tip_contrato, tercon, ocultaremi, 
                datacredito, diremp, telemp, contac, clasiven,  guia, codpais, 
				 montorf, porrefte, porrica, porriva, rfuente, rica, riva, estado, nrotarjeta, cmprfuente, cmprica, cmpriva,
				nombrefiad2, nombrefiad3, cedulafiad2, cedulafiad3, datacredito1, datacredito2,nomcom, diascart 
	FROM		dbo.glb_terceros
	WHERE     (tercli = 1 and Terinactivo=0)

GO

IF OBJECT_ID ('vCobrador','V') IS NOT NULL 
Begin
	Drop View vCobrador
End 
Go
CREATE VIEW vCobrador
AS
	SELECT        nitter, nomter, tipter, divter, terotr, terven, teremp, terpro, tercli, tercob, telter, dirter, dirter2, ciuter,  fecsys,  contacto, celular, fax, descrip, 
                         codpro, codigo, fecnac, mail, sexo, web, lista, arp, cesantia, codest, conduc, eps, pension, barrio, apellido1, apellido2, cupocre, 
                         diasvenc, dptoter, nombre1, otros,  tipid, vendedor,  civil,  codtipo,  lugexp,  porcom, terprof, 
                         zona, cedulafiad,  celfiad1, celfiad2,  dirfiad1, dirfiad2, nombrefiad, telfiad1, telfiad2, telter2, ucmvmcl, 
                         upgomcl, cupo, diacobro1, diacobro2, fcobro, finicial, periodo, vrcuota, vrinicial, codcargo, codhobby, codprof, empresa, 
                         hijos, sueldo, celfiad3, dirfiad3, telfiad3, act_eco, ciiu, estrato, fec_exp, inicio_labora, nit_empresa, niv_est, per_cargo, 
                         tip_contrato, tercon, ocultaremi, datacredito,   diremp, telemp, contac, clasiven, 
                          guia, codpais,   montorf, porrefte, porrica, porriva, rfuente, rica, riva, estado, nrotarjeta, cmprfuente, cmprica, 
                         cmpriva, nombrefiad2, nombrefiad3, cedulafiad2, cedulafiad3, datacredito1, datacredito2, comporta, dctoter, diascart, cmpcree
	FROM            dbo.glb_terceros
WHERE        (tercob = 1 and Terinactivo=0)

GO

IF OBJECT_ID ('vCtaCajas','V') IS NOT NULL 
Begin 
	Drop View vCtaCajas
End 
Go 
CREATE VIEW vCtaCajas
AS
	SELECT     codcue, nomcue
	FROM         dbo.con_puc
	WHERE     (auxcue = 1) AND (LEFT(LTRIM(RTRIM(codcue)), 4) = '1105') OR
                      (LEFT(LTRIM(RTRIM(codcue)), 4) = '1110')
Group By codcue,nomcue 

GO

IF OBJECT_ID ('vDescuentos','V') IS NOT NULL 
Begin 
	drop view vDescuentos
End 
Go
CREATE VIEW vDescuentos
AS
	SELECT     coddes, nomdes
	FROM       dbo.glb_descuentos

GO

IF OBJECT_ID ('vEmpTouch','V') IS NOT NULL 
Begin 
	Drop View vEmpTouch
End 
Go 
CREATE VIEW vEmpTouch
AS
	SELECT        id, nomemp, nitemp, licTouch
	FROM          dbo.glb_empresa
	WHERE        (touch = 1)

GO

IF OBJECT_ID ('vFormulas','V') IS NOT NULL 
Begin 
	Drop view vFormulas
End 
go
CREATE VIEW vFormulas
AS
	SELECT        dbo.pro_formulas.item, dbo.pro_formulas.codins AS codart, alm_articulos_1.nomart, alm_articulos_1.undart, dbo.pro_formulas.qtyart, 
                         dbo.pro_formulas.qtydesp AS depart, dbo.pro_formulas.codfor AS codigo, alm_articulos_1.undart AS undcon, 
                         dbo.pro_formulas.qtyart + dbo.pro_formulas.qtydesp AS totcan, dbo.alm_inventario.valprom, (dbo.pro_formulas.qtyart + dbo.pro_formulas.qtydesp) 
                         * dbo.alm_inventario.valprom AS totcos,
                             (SELECT        nomart
                               FROM            dbo.alm_articulos
                               WHERE        (codart = dbo.pro_formulas.codfor)) AS nomfor,
                             (SELECT        nomgru
                               FROM            dbo.alm_grupos
                               WHERE        (codgru =
                                                             (SELECT        codgru
                                                               FROM            dbo.alm_articulos AS alm_articulos_3
                                                               WHERE        (codart = dbo.pro_formulas.codfor)))) AS nomgru,
                             (SELECT        nomlin
                               FROM            dbo.alm_lineas
                               WHERE        (codlin =
                                                             (SELECT        codlin
                                                               FROM            dbo.alm_articulos AS alm_articulos_2
                                                               WHERE        (codart = dbo.pro_formulas.codfor)))) AS nomlin
	FROM            dbo.alm_grupos AS alm_grupos_1 INNER JOIN
                         dbo.alm_lineas AS alm_lineas_1 ON alm_grupos_1.codgru = alm_lineas_1.codgru INNER JOIN
                         dbo.alm_articulos AS alm_articulos_1 ON alm_grupos_1.codgru = alm_articulos_1.codgru AND alm_lineas_1.codlin = alm_articulos_1.codlin INNER JOIN
                         dbo.alm_inventario ON alm_articulos_1.codart = dbo.alm_inventario.codart INNER JOIN
                         dbo.pro_formulas ON alm_articulos_1.codart = dbo.pro_formulas.codins
	GROUP BY dbo.pro_formulas.codfor, dbo.pro_formulas.item, dbo.pro_formulas.codins, dbo.pro_formulas.qtyart, dbo.pro_formulas.qtydesp, dbo.alm_inventario.valprom, 
                         alm_articulos_1.nomart, alm_articulos_1.undart, alm_grupos_1.nomgru, alm_lineas_1.nomlin

GO

IF OBJECT_ID ('vGeneral','V') IS NOT NULL 
Begin 
	Drop view vGeneral
End
Go 
CREATE VIEW vGeneral
AS
	SELECT     E.id AS coDigo, 'Razón Social (' + ltrim(rtrim(E.noMemp)) + ' )' AS noMbre, E.id AS paDre, 1 AS imAgen, 000 numero
	FROM         Glb_empresa E
		UNION ALL
		SELECT     A.idemp + A.coDalm AS coDigo, ltrim(rtrim(A.noMalm)) AS noMbre, A.idemp AS paDre, 2 AS imAgen, 000 numero
		FROM         glb_Almacen A
		UNION ALL
		SELECT     C.idemp + C.coDalm + C.coDcen AS coDigo, ltrim(rtrim(C.noMcen)) AS noMbre, C.idemp + C.coDalm AS paDre, 3 AS imAgen, 000 numero
		FROM       glb_cenconsumo C
		UNION ALL
		SELECT    X.idemp + Y.coDalm + X.coDcen + X.coDcto AS coDigo, ltrim(rtrim(X.noMcto)) AS noMbre, X.idemp + Y.coDalm + X.coDcen AS paDre, 4 AS imAgen, 000 numero
		FROM      Con_Cencostos X, glb_cenconsumo Y
		WHERE     X.idemp=Y.idemp and X.coDalm=Y.coDalm and X.coDcen = Y.coDcen

GO

IF OBJECT_ID ('vMenu','V') IS NOT NULL 
Begin 
	Drop View vMenu
End 
Go 
CREATE VIEW vMenu
AS
	SELECT     TOP (100) PERCENT dbo.glb_modulos.codmod, dbo.glb_menu.nomfor, dbo.glb_menu.codigo, dbo.glb_menu.tipopc, dbo.glb_menu.arcdll, dbo.glb_menu.padre, 
                      dbo.glb_menu.desopc, dbo.glb_accesos.codper
	FROM         dbo.glb_modulos INNER JOIN
                      dbo.glb_menu ON dbo.glb_modulos.codmod = dbo.glb_menu.modulo AND dbo.glb_modulos.codmod <> '0' INNER JOIN
                      dbo.glb_accesos ON (dbo.glb_menu.nomfor = dbo.glb_accesos.nomfor OR
                      dbo.glb_menu.nomfor = '') AND dbo.glb_accesos.codper = '002' AND dbo.glb_accesos.accfor = 1
	ORDER BY dbo.glb_modulos.codmod

GO

IF OBJECT_ID ('vMesaOcupada','V') IS NOT NULL 
Begin 
	Drop View vMesaOcupada
End 
Go 
CREATE VIEW vMesaOcupada
AS
	SELECT     idemp, codcto, mesa, ubica, iconfile, meseroid, mesero, prefijo, ubicaimg, descripcion, domicilio, nitcli, vlrdomi, qtyper, codusu, ocupada
	FROM         dbo.ven_mesas
	WHERE     (meseroid <> '')
GO



IF OBJECT_ID ('vNomEmpleado','V') IS NOT NULL 
Begin 
	Drop view vNomEmpleado
End 
Go 
CREATE VIEW vNomEmpleado
AS
	SELECT        dbo.nom_empleado.codi_emple, dbo.nom_empleado.cedula, dbo.nom_empleado.lugexp, dbo.nom_empleado.nombres, dbo.nom_empleado.apellido_1, 
                         dbo.nom_empleado.apellido_2, dbo.nom_empleado.codcen, dbo.nom_empleado.codi_suc, dbo.nom_empleado.codi_sec, dbo.nom_empleado.codi_obra, 
                         dbo.nom_empleado.direccion, dbo.nom_empleado.telefono, dbo.nom_empleado.celular, dbo.nom_empleado.ciudad, dbo.nom_empleado.codi_cargo, 
                         dbo.nom_empleado.codi_ctocosto, dbo.nom_empleado.codi_labor, dbo.nom_empleado.estado_civil, dbo.nom_empleado.num_hijos, 
                         dbo.nom_empleado.codi_estado, dbo.nom_empleado.fecha_nac, dbo.nom_empleado.fecha_ing, dbo.nom_empleado.fecha_vac, 
                         dbo.nom_empleado.fecha_sueldo, dbo.nom_empleado.fecha_ces, dbo.nom_empleado.fecha_int, dbo.nom_empleado.fecha_prima, 
                         dbo.nom_empleado.fecha_retiro, dbo.nom_empleado.codi_eps, dbo.nom_empleado.codi_cesan, dbo.nom_empleado.codi_pension, 
                         dbo.nom_empleado.codi_arp, dbo.nom_empleado.codi_ctopago, dbo.nom_empleado.codi_ctapago, dbo.nom_empleado.codi_nivel, 
                         dbo.nom_empleado.codi_prof, dbo.nom_empleado.codi_entidad, dbo.nom_empleado.fecha_grado, dbo.nom_empleado.codi_carrera, 
                         dbo.nom_empleado.num_grado, dbo.nom_empleado.talla_calza, dbo.nom_empleado.talla_camisa, dbo.nom_empleado.talla_panta, 
                         dbo.nom_empleado.talla_casco, dbo.nom_empleado.talla_guante, dbo.nom_empleado.sueldo, dbo.nom_empleado.sindicato, dbo.nom_empleado.subtrans, 
                         dbo.nom_empleado.salintegral, dbo.nom_empleado.obra, dbo.nom_empleado.dedret, dbo.nom_empleado.nocuoman, dbo.nom_empleado.porret, 
                         dbo.nom_empleado.jefe, dbo.nom_empleado.acuprov, dbo.nom_empleado.acuaporte, dbo.nom_empleado.nombret, dbo.nom_empleado.estado, 
                         dbo.nom_empleado.acueps, dbo.nom_empleado.banco, dbo.nom_empleado.acusoli, dbo.nom_empleado.nombre2, dbo.nom_empleado.tipid, 
                         dbo.nom_empleado.smextras, dbo.nom_empleado.tipcot, dbo.nom_empleado.aplsoi, dbo.nom_empleado.codciu, dbo.nom_empleado.coddpto, 
                         dbo.nom_empleado.arpemp, dbo.nom_empleado.email, dbo.nom_empleado.tallabota, dbo.nom_empleado.tallamalla, dbo.nom_empleado.tallatapab, 
                         dbo.nom_empleado.pproduc, dbo.nom_empleado.acupen, dbo.nom_empleado.sexo, dbo.nom_empleado.aportesdev, dbo.nom_empleado.salario, 
                         dbo.nom_empleado.nomhijo1, dbo.nom_empleado.nomhijo2, dbo.nom_empleado.nomhijo3, dbo.nom_empleado.nomhijo4, dbo.nom_empleado.nomhijo5, 
                         dbo.nom_empleado.fechijo1, dbo.nom_empleado.fechijo2, dbo.nom_empleado.fechijo3, dbo.nom_empleado.fechijo4, dbo.nom_empleado.fechijo5, 
                         dbo.nom_empleado.nomconyuge, dbo.nom_empleado.fecconyuge, dbo.nom_empleado.ocuconyuge, dbo.nom_empleado.fecexpcc, 
                         dbo.nom_empleado.idemp, dbo.nom_empleado.foto, dbo.nom_empleado.HExtEsp, glb_tipid.nombre AS nombreidentificacion, 
                         dbo.nom_labores.nombre AS nombrelabor, dbo.nom_cargos.nomb_cargo AS nombrecargo, dbo.nom_sucursal.nombre AS nombresucursal, 
                         dbo.nom_seccion.nombre AS nombreseccion, dbo.nom_estados.nombre AS nombreestado, dbo.glb_dpto.nomdpto, dbo.glb_ciudad.nomciu, 
                         dbo.glb_profesion.titulo AS tituloprofesion, dbo.glb_niveles.nombre AS nombrenivel, dbo.nom_carreras.titulo AS titulocarrera, 
                         dbo.nom_entidad.nombre AS nomentidad, dbo.nom_tipocotiz.nombre AS nombretipocotiz, glb_terceros_1.nomter AS nombreeps, 
                         dbo.glb_terceros.nomter AS nombrearl, glb_terceros_3.nomter AS nombrepension, glb_terceros_2.nomter AS nombrecesant, 
                         dbo.con_cencostos.nomcto
	FROM            dbo.nom_labores RIGHT OUTER JOIN
                         dbo.glb_tipid AS glb_tipid INNER JOIN
                         dbo.nom_empleado ON glb_tipid.codigo = dbo.nom_empleado.tipid LEFT OUTER JOIN
                         dbo.con_cencostos ON dbo.nom_empleado.codi_ctocosto = dbo.con_cencostos.codcto LEFT OUTER JOIN
                         dbo.glb_profesion ON dbo.nom_empleado.codi_prof = dbo.glb_profesion.codi_prof LEFT OUTER JOIN
                         dbo.glb_niveles ON dbo.nom_empleado.codi_nivel = dbo.glb_niveles.codigo LEFT OUTER JOIN
                         dbo.glb_terceros ON dbo.nom_empleado.codi_arp = dbo.glb_terceros.nitter LEFT OUTER JOIN
                         dbo.glb_terceros AS glb_terceros_3 ON dbo.nom_empleado.codi_pension = glb_terceros_3.nitter LEFT OUTER JOIN
                         dbo.glb_terceros AS glb_terceros_2 ON dbo.nom_empleado.codi_cesan = glb_terceros_2.nitter LEFT OUTER JOIN
                         dbo.glb_terceros AS glb_terceros_1 ON dbo.nom_empleado.codi_eps = glb_terceros_1.nitter LEFT OUTER JOIN
                         dbo.nom_tipocotiz ON dbo.nom_empleado.tipcot = dbo.nom_tipocotiz.codigo LEFT OUTER JOIN
                         dbo.nom_entidad ON dbo.nom_empleado.codi_entidad = dbo.nom_entidad.codi_enti LEFT OUTER JOIN
                         dbo.nom_carreras ON dbo.nom_empleado.codi_carrera = dbo.nom_carreras.codi_curso LEFT OUTER JOIN
                         dbo.glb_ciudad ON dbo.nom_empleado.coddpto = dbo.glb_ciudad.coddpto AND dbo.nom_empleado.codciu = dbo.glb_ciudad.codciu LEFT OUTER JOIN
                         dbo.glb_dpto ON dbo.nom_empleado.coddpto = dbo.glb_dpto.coddpto LEFT OUTER JOIN
                         dbo.nom_estados ON dbo.nom_empleado.codi_estado = dbo.nom_estados.codi_estado LEFT OUTER JOIN
                         dbo.nom_seccion ON dbo.nom_empleado.codi_sec = dbo.nom_seccion.codi_sec LEFT OUTER JOIN
                         dbo.nom_cargos ON dbo.nom_empleado.codi_cargo = dbo.nom_cargos.codi_cargo LEFT OUTER JOIN
                         dbo.nom_sucursal ON dbo.nom_empleado.codi_suc = dbo.nom_sucursal.codi_suc ON dbo.nom_labores.codigo = dbo.nom_empleado.codi_labor

GO

IF OBJECT_ID ('vProveedor','V') IS NOT NULL 
Begin 
	Drop View vProveedor
End 
Go 
CREATE VIEW vProveedor
AS
	SELECT	nitter, nomter, tipter, divter,  terotr, terven, teremp, terpro, tercli, tercob, telter, dirter, dirter2,  fecsys,  contacto, celular, fax, descrip, codpro, 
            codigo, fecnac, mail, sexo, web, lista, arp, cesantia, codest, conduc, eps, pension, barrio, apellido1, apellido2, cupocre, diasvenc, 
            dptoter, nombre1, otros, tipid, vendedor, civil, codtipo,  lugexp,  porcom, terprof, zona, 
            cedulafiad, celfiad1, celfiad2, dirfiad1, dirfiad2, nombrefiad, telfiad1, telfiad2, telter2, ucmvmcl, upgomcl, 
            cupo,  diacobro1, diacobro2, fcobro, finicial, periodo, vrcuota, vrinicial, codcargo, codhobby, codprof, empresa, hijos, sueldo, 
            celfiad3, dirfiad3,  telfiad3, act_eco, ciiu, estrato, fec_exp, inicio_labora, nit_empresa, niv_est, per_cargo, tip_contrato, 
            tercon, ocultaremi,  datacredito,  diremp, telemp, contac, clasiven, guia, 
            codpais, montorf, porrefte, porrica, porriva, rfuente, rica, riva, estado, nrotarjeta, cmprfuente, cmprica, cmpriva, nombrefiad2, 
            nombrefiad3, cedulafiad2, cedulafiad3, datacredito1, datacredito2, cmpcree, ciuter,diascart
	FROM    dbo.glb_terceros
	WHERE   (terpro = 1 and terinactivo=0)

GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregado por Éduar Álvarez Junio 26 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('vSaldosPorCuenta','V') IS NOT NULL	DROP VIEW vSaldosPorCuenta
GO
CREATE VIEW vSaldosPorCuenta
AS
	 SELECT	ctod.idemp, ctod.año, ctod.codcto, ctod.codcue, puc.nomcue, ctod.natcue, puc.nivcue, puc.auxcue, puc.porret, puc.retcue, SUM(ctod.sancue) AS sancue,
			SUM(ctod.d01cue) AS d01cue, SUM(ctod.c01cue) AS c01cue, SUM(ctod.d02cue) AS d02cue, SUM(ctod.c02cue) AS c02cue, SUM(ctod.d03cue) AS d03cue, SUM(ctod.c03cue) AS c03cue,
			SUM(ctod.d04cue) AS d04cue, SUM(ctod.c04cue) AS c04cue, SUM(ctod.d05cue) AS d05cue, SUM(ctod.c05cue) AS c05cue, SUM(ctod.d06cue) AS d06cue, SUM(ctod.c06cue) AS c06cue,
			SUM(ctod.d07cue) AS d07cue, SUM(ctod.c07cue) AS c07cue, SUM(ctod.d08cue) AS d08cue, SUM(ctod.c08cue) AS c08cue, SUM(ctod.d09cue) AS d09cue, SUM(ctod.c09cue) AS c09cue,
			SUM(ctod.d10cue) AS d10cue, SUM(ctod.c10cue) AS c10cue, SUM(ctod.d11cue) AS d11cue, SUM(ctod.c11cue) AS c11cue, SUM(ctod.d12cue) AS d12cue, SUM(ctod.c12cue) AS c12cue
	   FROM	dbo.Con_CtaCenCostos AS ctod LEFT OUTER JOIN dbo.Con_Puc AS puc ON puc.codcue = ctod.codcue
   GROUP BY	ctod.idemp, ctod.año, ctod.codcto, ctod.codcue, puc.nomcue, ctod.natcue, puc.nivcue, puc.auxcue, puc.porret, puc.retcue
GO


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modificado por Éduar Álvarez Junio 19 de 2015. -- Se adiciona "TipoNorma", que almacena: 'P' cuando es PCGA, 'N' para NIIF y 'A' si son Ambas.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID ('vTransaccion','V') IS NOT NULL	DROP VIEW vTransaccion
GO
CREATE VIEW vTransaccion
AS
	SELECT	codtran, nomtran, tiptran, TipoNorma					
	FROM    dbo.Glb_Transaccion
	WHERE   (LEN(LTRIM(RTRIM(codtran))) > 0)
GO


IF OBJECT_ID ('vVendedor','V') IS NOT NULL 
Begin 
	Drop view vVendedor
End 
Go
CREATE VIEW vVendedor 
AS
	SELECT        nitter, nomter, telter, dirter, ciuter
	FROM            dbo.glb_terceros
	WHERE        (terven = 1 and terinactivo=0)

GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregado por Éduar Álvarez Junio 26 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('vSaldosPorCuentaNIIF','V') IS NOT NULL	DROP VIEW vSaldosPorCuentaNIIF
GO
CREATE VIEW vSaldosPorCuentaNIIF
AS
	 SELECT	ctod.idemp, ctod.año, ctod.codcto, ctod.codcue, puc.nomcueniif nomcue, ctod.natcue, puc.nivcue, puc.auxcue, puc.porret, puc.retcue, SUM(ctod.sancue) AS sancue,
			SUM(ctod.d01cue) AS d01cue, SUM(ctod.c01cue) AS c01cue, SUM(ctod.d02cue) AS d02cue, SUM(ctod.c02cue) AS c02cue, SUM(ctod.d03cue) AS d03cue, SUM(ctod.c03cue) AS c03cue,
			SUM(ctod.d04cue) AS d04cue, SUM(ctod.c04cue) AS c04cue, SUM(ctod.d05cue) AS d05cue, SUM(ctod.c05cue) AS c05cue, SUM(ctod.d06cue) AS d06cue, SUM(ctod.c06cue) AS c06cue,
			SUM(ctod.d07cue) AS d07cue, SUM(ctod.c07cue) AS c07cue, SUM(ctod.d08cue) AS d08cue, SUM(ctod.c08cue) AS c08cue, SUM(ctod.d09cue) AS d09cue, SUM(ctod.c09cue) AS c09cue,
			SUM(ctod.d10cue) AS d10cue, SUM(ctod.c10cue) AS c10cue, SUM(ctod.d11cue) AS d11cue, SUM(ctod.c11cue) AS c11cue, SUM(ctod.d12cue) AS d12cue, SUM(ctod.c12cue) AS c12cue
	   FROM	dbo.Con_CtaCtoNIIF AS ctod LEFT OUTER JOIN dbo.Con_PucNiif AS puc ON puc.codcueniif = ctod.codcue
   GROUP BY	ctod.idemp, ctod.año, ctod.codcto, ctod.codcue, puc.nomcueniif, ctod.natcue, puc.nivcue, puc.auxcue, puc.porret, puc.retcue
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregado por Luis DOminguez 2019-02-01.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('vGsPdte','V') IS NOT NULL	DROP VIEW vGsPdte
GO
CREATE VIEW [dbo].[vGsPdte]
AS
SELECT DISTINCT 
                         SUBSTRING(cd_TBL_NAME, 1, LEN(cd_TBL_NAME)) AS Tabla, COUNT(cd_TBL_NAME) AS Cant, CONVERT(date, MIN(dt_LOG_FECHA)) AS FechaI, 
                         CONVERT(date, MAX(dt_LOG_FECHA)) AS fechaf
FROM            dbo.SYN_DATOSTRANSACCION
WHERE        (cd_LOG_STAT = 'P')  AND (cd_BD_ORIG =(SELECT        @@SERVERNAME AS Expr1))
GROUP BY cd_TBL_NAME

GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregado por Luis DOminguez 2019-02-01.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('vEmpresas','V') IS NOT NULL	DROP VIEW vEmpresas
GO
CREATE VIEW [dbo].[vEmpresas] 
AS
	SELECT        nitter, nomter, telter, dirter, ciuter
	FROM            dbo.glb_terceros
	WHERE        (teremp = 1 and terinactivo=0)


GO