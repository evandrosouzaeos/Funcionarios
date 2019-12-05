
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/04/2019 23:06:06
-- Generated from EDMX file: C:\Users\evand\source\repos\Funcionarios\Funcionarios\Banco.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [P2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Atividadefuncionario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[funcionario] DROP CONSTRAINT [FK_Atividadefuncionario];
GO
IF OBJECT_ID(N'[dbo].[FK_Empresafuncionario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[funcionario] DROP CONSTRAINT [FK_Empresafuncionario];
GO
IF OBJECT_ID(N'[dbo].[FK_Setorfuncionario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[funcionario] DROP CONSTRAINT [FK_Setorfuncionario];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Atividade]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Atividade];
GO
IF OBJECT_ID(N'[dbo].[Empresa]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empresa];
GO
IF OBJECT_ID(N'[dbo].[funcionario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[funcionario];
GO
IF OBJECT_ID(N'[dbo].[Setor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Setor];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Atividade'
CREATE TABLE [dbo].[Atividade] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nome] varchar(50)  NOT NULL,
    [descricao] varchar(100)  NOT NULL
);
GO

-- Creating table 'Empresa'
CREATE TABLE [dbo].[Empresa] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nome] varchar(50)  NOT NULL,
    [endereco] varchar(100)  NOT NULL
);
GO

-- Creating table 'funcionario'
CREATE TABLE [dbo].[funcionario] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nome] varchar(50)  NOT NULL,
    [endereco] varchar(100)  NOT NULL,
    [idade] int  NOT NULL,
    [Empresa_id] int  NOT NULL,
    [AtividadeId] int  NOT NULL,
    [Setor_id] int  NOT NULL
);
GO

-- Creating table 'Setor'
CREATE TABLE [dbo].[Setor] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nome] varchar(50)  NOT NULL,
    [descricao] varchar(100)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Atividade'
ALTER TABLE [dbo].[Atividade]
ADD CONSTRAINT [PK_Atividade]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [id] in table 'Empresa'
ALTER TABLE [dbo].[Empresa]
ADD CONSTRAINT [PK_Empresa]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'funcionario'
ALTER TABLE [dbo].[funcionario]
ADD CONSTRAINT [PK_funcionario]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Setor'
ALTER TABLE [dbo].[Setor]
ADD CONSTRAINT [PK_Setor]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AtividadeId] in table 'funcionario'
ALTER TABLE [dbo].[funcionario]
ADD CONSTRAINT [FK_Atividadefuncionario]
    FOREIGN KEY ([AtividadeId])
    REFERENCES [dbo].[Atividade]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Atividadefuncionario'
CREATE INDEX [IX_FK_Atividadefuncionario]
ON [dbo].[funcionario]
    ([AtividadeId]);
GO

-- Creating foreign key on [Empresa_id] in table 'funcionario'
ALTER TABLE [dbo].[funcionario]
ADD CONSTRAINT [FK_Empresafuncionario]
    FOREIGN KEY ([Empresa_id])
    REFERENCES [dbo].[Empresa]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Empresafuncionario'
CREATE INDEX [IX_FK_Empresafuncionario]
ON [dbo].[funcionario]
    ([Empresa_id]);
GO

-- Creating foreign key on [Setor_id] in table 'funcionario'
ALTER TABLE [dbo].[funcionario]
ADD CONSTRAINT [FK_Setorfuncionario]
    FOREIGN KEY ([Setor_id])
    REFERENCES [dbo].[Setor]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Setorfuncionario'
CREATE INDEX [IX_FK_Setorfuncionario]
ON [dbo].[funcionario]
    ([Setor_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------