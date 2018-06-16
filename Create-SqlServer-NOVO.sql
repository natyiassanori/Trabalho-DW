DROP TABLE IF EXISTS [mydb].[DimTempo];

CREATE TABLE [DimTempo] (
  [idTempo] INT NOT NULL,
  [Ano] VARCHAR(4) NULL,
  [Mes] VARCHAR(2) NULL,
  [Dia] VARCHAR(2) NULL,
  PRIMARY KEY ([idTempo]),
  INDEX [Dia_UNIQUE] ([Dia] ASC),
  INDEX [Mes_UNIQUE] ([Mes] ASC),
  INDEX [Ano_UNIQUE] ([Ano] ASC));


-- -----------------------------------------------------
-- Table [mydb].[DimPoder[
-- -----------------------------------------------------
DROP TABLE IF EXISTS [mydb].[DimPoder] ;

CREATE TABLE [DimPoder] (
  [idPoder] INT NOT NULL,
  [NomePoder] VARCHAR(45) NULL,
  PRIMARY KEY ([idPoder]));


-- -----------------------------------------------------
-- Table [mydb].[DimUnidadeOrcamentaria]
-- -----------------------------------------------------
DROP TABLE IF EXISTS [mydb].[DimUnidadeOrcamentaria] ;

CREATE TABLE [DimUnidadeOrcamentaria] (
  [idUniOrc] INT NOT NULL,
  [GrpAdminUniOrc] VARCHAR(100) NULL,
  [NomeUniOrc] VARCHAR(255) NULL,
  PRIMARY KEY ([idUniOrc]));


-- -----------------------------------------------------
-- Table [mydb].[DimFonte]
-- -----------------------------------------------------
DROP TABLE IF EXISTS [mydb].[DimFonte] ;

CREATE TABLE [DimFonte] (
  [idFonte] INT NOT NULL,
  [NomeFonte] VARCHAR(45) NULL,
  PRIMARY KEY ([idFonte]));


-- -----------------------------------------------------
-- Table [mydb].[FatoReceita]
-- -----------------------------------------------------
DROP TABLE IF EXISTS [mydb].[FatoReceita] ;

CREATE TABLE [FatoReceita] (
  [VlrArrecadado] FLOAT NULL,
  [VlrDspSrvAtivo] FLOAT NULL,
  [VlrDspSrvInativo] FLOAT NULL,
  [VlrDspPensionista] FLOAT NULL,
  [VlrDspContratado] FLOAT NULL,
  [VlrDespesasTotal] FLOAT NULL,
  [idTempo] INT NOT NULL,
  [idPoder] INT NOT NULL,
  [idUniOrc] INT NOT NULL,
  PRIMARY KEY ([idTempo], [idPoder], [idUniOrc]),
  INDEX [fk_FatoReceita_DimTempo1_idx] ([idTempo] ASC),
  INDEX [fk_FatoReceita_DimPoder1_idx] ([idPoder] ASC),
  INDEX [fk_FatoReceita_DimUnidadeOrcamentaria1_idx] ([idUniOrc] ASC),
  CONSTRAINT [fk_FatoReceita_DimTempo1]
    FOREIGN KEY ([idTempo])
    REFERENCES [DimTempo] ([idTempo])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_FatoReceita_DimPoder1]
    FOREIGN KEY ([idPoder])
    REFERENCES [DimPoder] ([idPoder])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_FatoReceita_DimUnidadeOrcamentaria1]
    FOREIGN KEY ([idUniOrc])
    REFERENCES [DimUnidadeOrcamentaria] ([idUniOrc])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


