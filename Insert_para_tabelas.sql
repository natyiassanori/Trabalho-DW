INSERT INTO DimPoder
SELECT DISTINCT
idPoder,
NomePoder
FROM FatoTrabalhoDW
go
INSERT INTO DimTempo
SELECT DISTINCT
idTempo,
Ano,
Mes,
Dia
FROM FatoTrabalhoDW
go
INSERT INTO DimUnidadeOrcamentaria
SELECT DISTINCT
idUniOrc,
GrpAdminUniOrc,
NomeUniOrc
FROM FatoTrabalhoDW
go
INSERT INTO FatoReceita
SELECT DISTINCT
SUM(CAST(VlrArrecadado AS FLOAT)),
SUM(CAST(VlrDspSrvAtivo AS FLOAT)),
SUM(CAST(VlrDspSrvInativo AS FLOAT)),
SUM(CAST(VlrDspPensionista AS FLOAT)),
SUM(CAST(VlrDspContratado AS FLOAT)),
SUM(CAST(VlrTotalGasto AS FLOAT)),
idTempo,
idPoder,
idUniOrc
FROM FatoTrabalhoDW GROUP BY idPoder,idUniOrc,idTempo
