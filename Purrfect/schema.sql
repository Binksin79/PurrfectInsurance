DROP TABLE [dbo].[forum]
DROP TABLE [dbo].[AspNetUserClaims]
DROP TABLE [dbo].[AspNetUserLogins]
DROP TABLE [dbo].[AspNetUserRoles]
DROP TABLE [dbo].[AspNetRoles]
DROP TABLE [dbo].[AspNetUsers]


CREATE DATABASE Project;

GO

USE Project;

GO

-- Security Table Scripts
CREATE TABLE [dbo].[AspNetUsers] (
    [Id]                   NVARCHAR (128) NOT NULL,
    [Email]                NVARCHAR (256) NULL,
    [EmailConfirmed]       BIT            NOT NULL,
    [PasswordHash]         NVARCHAR (MAX) NULL,
    [SecurityStamp]        NVARCHAR (MAX) NULL,
    [PhoneNumber]          NVARCHAR (MAX) NULL,
    [PhoneNumberConfirmed] BIT            NOT NULL,
    [TwoFactorEnabled]     BIT            NOT NULL,
    [LockoutEndDateUtc]    DATETIME       NULL,
    [LockoutEnabled]       BIT            NOT NULL,
    [AccessFailedCount]    INT            NOT NULL,
    [UserName]             NVARCHAR (256) NOT NULL,
	[Rate_Multiplier]	   FLOAT 		  NOT NULL,
	[ADDRESS]			   NVARCHAR (256) NOT NULL,
	[DISTRICT]			   NVARCHAR (256) NOT NULL,
	[NUMBER_INSURED]	   INT			  NOT NULL,
	[NUMBER_CLAIMS]		   INT			  NOT NULL,

    CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[AspNetRoles] (
    [Id]   NVARCHAR (128) NOT NULL,
    [Name] NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[AspNetUserRoles] (
    [UserId] NVARCHAR (128) NOT NULL,
    [RoleId] NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC),
    CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] NVARCHAR (128) NOT NULL,
    [ProviderKey]   NVARCHAR (128) NOT NULL,
    [UserId]        NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED ([LoginProvider] ASC, [ProviderKey] ASC, [UserId] ASC),
    CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [UserId]     NVARCHAR (128) NOT NULL,
    [ClaimType]  NVARCHAR (MAX) NULL,
    [ClaimValue] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex]
    ON [dbo].[AspNetRoles]([Name] ASC);

CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex]
    ON [dbo].[AspNetUsers]([UserName] ASC);

CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[AspNetUserClaims]([UserId] ASC);

CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[AspNetUserRoles]([UserId] ASC);

CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[AspNetUserLogins]([UserId] ASC);

CREATE NONCLUSTERED INDEX [IX_RoleId]
    ON [dbo].[AspNetUserRoles]([RoleId] ASC);

CREATE TABLE [dbo].[Car_Info] (
    [Car_Id]   NVARCHAR (128) NOT NULL,
    [UserId]  NVARCHAR (256) NOT NULL,
	[Claim]    NVARCHAR  (256) NULL,
	[Make]	   NVARCHAR  (256) NOT NULL,
	[Model]    NVARCHAR  (256) NOT NULL,
	[Mileage]  INT			   NOT NULL,
	[Year]     INT             NOT NULL,
    CONSTRAINT [PK_dbo.Car_Info] PRIMARY KEY CLUSTERED ([Car_Id] ASC),
	CONSTRAINT [FK_dbo.Car_Info_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
	);

	CREATE TABLE [dbo].[forum] (
    [Id]   int identity(1,1),
    [Username]  NVARCHAR (256) NOT NULL,
	[Rating]    int				 NULL,
	[Title]	   NVARCHAR  (256) NOT NULL,
	[Message]  NVARCHAR  (256) NOT NULL,
	[ReviewDate] datetime	  default getdate(),
	
    CONSTRAINT [PK_dbo.forum] PRIMARY KEY CLUSTERED ([Id] ASC),
);

insert into forum values('hpotter', 5, 'I love the cats on this site!', 'I was worried at first but this site drew me in and now I am a happy customer!', getdate());
insert into forum values('shaneo', 3, 'Why did it have to be cats?!', 'Great company but I hate cats! How about a cute goldfish?',getdate());
insert into forum values('kathys', 4, 'Scary cat!', 'When I saw the purple cat, I jumped!', getdate());
