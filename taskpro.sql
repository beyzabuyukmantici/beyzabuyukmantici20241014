USE [master]
GO
/****** Object:  Database [taskpro]    Script Date: 29.10.2024 19:26:04 ******/
CREATE DATABASE [taskpro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'taskpro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\taskpro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'taskpro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\taskpro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [taskpro] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [taskpro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [taskpro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [taskpro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [taskpro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [taskpro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [taskpro] SET ARITHABORT OFF 
GO
ALTER DATABASE [taskpro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [taskpro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [taskpro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [taskpro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [taskpro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [taskpro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [taskpro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [taskpro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [taskpro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [taskpro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [taskpro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [taskpro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [taskpro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [taskpro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [taskpro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [taskpro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [taskpro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [taskpro] SET RECOVERY FULL 
GO
ALTER DATABASE [taskpro] SET  MULTI_USER 
GO
ALTER DATABASE [taskpro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [taskpro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [taskpro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [taskpro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [taskpro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [taskpro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'taskpro', N'ON'
GO
ALTER DATABASE [taskpro] SET QUERY_STORE = ON
GO
ALTER DATABASE [taskpro] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [taskpro]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 29.10.2024 19:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AccountNumber] [nvarchar](20) NOT NULL,
	[AccountTypeID] [int] NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__Accounts__349DA58633D359F6] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Accounts__BE2ACD6F0020A25B] UNIQUE NONCLUSTERED 
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountTypes]    Script Date: 29.10.2024 19:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTypes](
	[AccountTypeID] [int] IDENTITY(1,1) NOT NULL,
	[AccountTypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AccountTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 29.10.2024 19:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[TCKN] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Fullname] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Role] [nchar](10) NULL,
 CONSTRAINT [PK_AdminUser] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransferHistory]    Script Date: 29.10.2024 19:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferHistory](
	[TransferID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserID] [int] NULL,
	[ToUserID] [int] NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransferDate] [datetime] NOT NULL,
	[Description] [nvarchar](255) NULL,
	[FromAccountID] [int] NOT NULL,
	[ToAccountID] [int] NOT NULL,
	[RemainingBalance] [decimal](18, 2) NOT NULL,
	[RecipientRemainingBalance] [decimal](18, 2) NOT NULL,
	[IsCanceled] [bit] NOT NULL,
 CONSTRAINT [PK__Transfer__95490171CD49B176] PRIMARY KEY CLUSTERED 
(
	[TransferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29.10.2024 19:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TCKN] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Role] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TCKN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF__Accounts__Create__4316F928]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AdminUser] ADD  CONSTRAINT [DF_AdminUser_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[AdminUser] ADD  CONSTRAINT [DF_AdminUser_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AdminUser] ADD  CONSTRAINT [DF_AdminUser_Role]  DEFAULT (N'Admin') FOR [Role]
GO
ALTER TABLE [dbo].[TransferHistory] ADD  CONSTRAINT [DF__TransferH__Trans__4D94879B]  DEFAULT (getdate()) FOR [TransferDate]
GO
ALTER TABLE [dbo].[TransferHistory] ADD  CONSTRAINT [DF_TransferHistory_IsCanceled]  DEFAULT ((0)) FOR [IsCanceled]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK__Accounts__Accoun__44FF419A] FOREIGN KEY([AccountTypeID])
REFERENCES [dbo].[AccountTypes] ([AccountTypeID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK__Accounts__Accoun__44FF419A]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK__Accounts__UserID__440B1D61] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK__Accounts__UserID__440B1D61]
GO
ALTER TABLE [dbo].[TransferHistory]  WITH CHECK ADD  CONSTRAINT [FK__TransferH__ToUse__4F7CD00D] FOREIGN KEY([ToUserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[TransferHistory] CHECK CONSTRAINT [FK__TransferH__ToUse__4F7CD00D]
GO
ALTER TABLE [dbo].[TransferHistory]  WITH CHECK ADD  CONSTRAINT [FK_TransferHistory_Accounts] FOREIGN KEY([FromAccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[TransferHistory] CHECK CONSTRAINT [FK_TransferHistory_Accounts]
GO
ALTER TABLE [dbo].[TransferHistory]  WITH CHECK ADD  CONSTRAINT [FK_TransferHistory_Accounts1] FOREIGN KEY([ToAccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[TransferHistory] CHECK CONSTRAINT [FK_TransferHistory_Accounts1]
GO
/****** Object:  StoredProcedure [dbo].[MakeTransfer]    Script Date: 29.10.2024 19:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MakeTransfer]
    @FromAccountID INT,
    @ToAccountID INT,
    @Amount DECIMAL(18, 2),
    @Description NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- Bakiyeyi kontrol et (örneğin hesapların bakiye bilgisi `Accounts` tablosunda)
    DECLARE @FromAccountBalance DECIMAL(18, 2);

    SELECT @FromAccountBalance = Balance FROM Accounts WHERE AccountID = @FromAccountID;

    IF @FromAccountBalance IS NULL OR @FromAccountBalance < @Amount
    BEGIN
        RAISERROR ('Yetersiz bakiye.', 16, 1);
        RETURN;
    END

    -- Transfer işlemi
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Gönderen hesaptan düş
        UPDATE Accounts SET Balance = Balance - @Amount WHERE AccountID = @FromAccountID;

        -- Alıcı hesaba ekle
        UPDATE Accounts SET Balance = Balance + @Amount WHERE AccountID = @ToAccountID;

        -- Transfer geçmişine kaydet
        INSERT INTO TransferHistory (FromAccountID, ToAccountID, Amount, TransferDate, Description)
        VALUES (@FromAccountID, @ToAccountID, @Amount, GETDATE(), @Description);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
USE [master]
GO
ALTER DATABASE [taskpro] SET  READ_WRITE 
GO
