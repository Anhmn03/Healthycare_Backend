USE [master]
GO

CREATE DATABASE [HealthcareSystem]
use [HealthcareSystem]
CREATE TABLE [dbo].[Appointment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NOT NULL,
	[doctor_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
	[date_time] [datetime] NOT NULL,
	[status] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/24/2025 2:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[content] [text] NOT NULL,
	[rating] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Health]    Script Date: 3/24/2025 2:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Health](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[disease_name] [nvarchar](210) NULL,
	[disease_desc] [nvarchar](210) NULL,
 CONSTRAINT [PK_Health] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 3/24/2025 2:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[provider] [varchar](255) NOT NULL,
	[coverage_details] [text] NOT NULL,
	[expiration_date] [date] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRecord]    Script Date: 3/24/2025 2:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NOT NULL,
	[doctor_id] [int] NOT NULL,
	[diagnosis] [text] NOT NULL,
	[prescription_id] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 3/24/2025 2:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[price] [decimal](10, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 3/24/2025 2:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[content] [text] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/24/2025 2:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[method] [varchar](50) NOT NULL,
	[status] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[service_id] [int] NOT NULL,
 CONSTRAINT [PK__Payment__3213E83F492CDD75] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 3/24/2025 2:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[doctor_id] [int] NOT NULL,
	[patient_id] [int] NOT NULL,
	[instructions] [text] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrescriptionDetail]    Script Date: 3/24/2025 2:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prescription_id] [int] NOT NULL,
	[medicine_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 3/24/2025 2:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[price] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symptoms]    Script Date: 3/24/2025 2:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symptoms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[health_id] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Symptoms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/24/2025 2:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[phone] [varchar](20) NULL,
	[role] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Health] ON 

INSERT [dbo].[Health] ([id], [disease_name], [disease_desc]) VALUES (1, N'Heache', N'desc for headche')
INSERT [dbo].[Health] ([id], [disease_name], [disease_desc]) VALUES (2, N'Flu', N'desc for flu')
SET IDENTITY_INSERT [dbo].[Health] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicine] ON 

INSERT [dbo].[Medicine] ([id], [name], [description], [price], [stock], [created_at], [updated_at]) VALUES (1, N'Panadol', N'Good for headche', CAST(100.00 AS Decimal(10, 2)), 100, CAST(N'2025-03-23T03:34:56.970' AS DateTime), CAST(N'2025-03-23T03:34:56.970' AS DateTime))
INSERT [dbo].[Medicine] ([id], [name], [description], [price], [stock], [created_at], [updated_at]) VALUES (2, N'Otosan', N'Good for kid', CAST(200.00 AS Decimal(10, 2)), 100, CAST(N'2025-03-24T13:57:39.220' AS DateTime), CAST(N'2025-03-24T13:57:39.220' AS DateTime))
SET IDENTITY_INSERT [dbo].[Medicine] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (7, 3, CAST(100.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T05:17:46.627' AS DateTime), CAST(N'2025-03-23T05:17:46.627' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (8, 3, CAST(100.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T05:18:26.460' AS DateTime), CAST(N'2025-03-23T05:18:26.460' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (9, 9, CAST(1.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T05:47:25.130' AS DateTime), CAST(N'2025-03-23T05:47:25.130' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (10, 9, CAST(1.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T05:47:28.653' AS DateTime), CAST(N'2025-03-23T05:47:28.653' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (11, 3, CAST(100.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T05:49:45.303' AS DateTime), CAST(N'2025-03-23T05:49:45.303' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (12, 3, CAST(700.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T05:54:13.520' AS DateTime), CAST(N'2025-03-23T05:54:13.520' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (13, 9, CAST(2.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T05:59:05.240' AS DateTime), CAST(N'2025-03-23T05:59:05.240' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (14, 9, CAST(2.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T05:59:05.247' AS DateTime), CAST(N'2025-03-23T05:59:05.247' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (15, 9, CAST(200.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T06:02:53.130' AS DateTime), CAST(N'2025-03-23T06:02:53.130' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (16, 9, CAST(200.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T06:02:53.133' AS DateTime), CAST(N'2025-03-23T06:02:53.133' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (17, 9, CAST(200.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T06:04:40.960' AS DateTime), CAST(N'2025-03-23T06:04:40.960' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (18, 9, CAST(200.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T06:04:40.963' AS DateTime), CAST(N'2025-03-23T06:04:40.963' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (19, 9, CAST(400.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T06:07:29.667' AS DateTime), CAST(N'2025-03-23T06:07:29.667' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (23, 3, CAST(700.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T11:39:14.470' AS DateTime), CAST(N'2025-03-23T11:39:14.470' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (24, 3, CAST(700.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T11:52:02.653' AS DateTime), CAST(N'2025-03-23T11:52:02.653' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (25, 9, CAST(400.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-23T12:21:03.810' AS DateTime), CAST(N'2025-03-23T12:21:03.810' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (26, 3, CAST(600.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-24T14:44:36.867' AS DateTime), CAST(N'2025-03-24T14:44:36.867' AS DateTime), 1)
INSERT [dbo].[Payment] ([id], [user_id], [amount], [method], [status], [created_at], [updated_at], [service_id]) VALUES (27, 3, CAST(600.00 AS Decimal(10, 2)), N'credit_card', N'Pending', CAST(N'2025-03-24T14:48:43.487' AS DateTime), CAST(N'2025-03-24T14:48:43.487' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Prescription] ON 

INSERT [dbo].[Prescription] ([id], [doctor_id], [patient_id], [instructions], [created_at], [updated_at]) VALUES (26, 2, 3, N'Need slepp', CAST(N'2025-03-24T00:00:00.000' AS DateTime), CAST(N'2025-03-24T14:04:07.630' AS DateTime))
SET IDENTITY_INSERT [dbo].[Prescription] OFF
GO
SET IDENTITY_INSERT [dbo].[PrescriptionDetail] ON 

INSERT [dbo].[PrescriptionDetail] ([id], [prescription_id], [medicine_id], [quantity]) VALUES (30, 26, 1, 2)
INSERT [dbo].[PrescriptionDetail] ([id], [prescription_id], [medicine_id], [quantity]) VALUES (1030, 26, 2, 2)
SET IDENTITY_INSERT [dbo].[PrescriptionDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([id], [name], [description], [price], [created_at], [updated_at]) VALUES (1, N'Booking drug', N'Booking drug onl', CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-03-23T03:58:42.083' AS DateTime), CAST(N'2025-03-23T03:58:42.083' AS DateTime))
INSERT [dbo].[Service] ([id], [name], [description], [price], [created_at], [updated_at]) VALUES (2, N'Health A-Z', N'View Health infor', CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-03-23T03:59:08.093' AS DateTime), CAST(N'2025-03-23T03:59:08.093' AS DateTime))
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Symptoms] ON 

INSERT [dbo].[Symptoms] ([id], [health_id], [user_id]) VALUES (1, 1, 3)
INSERT [dbo].[Symptoms] ([id], [health_id], [user_id]) VALUES (2, 2, 4)
SET IDENTITY_INSERT [dbo].[Symptoms] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [email], [password], [phone], [role], [created_at], [updated_at]) VALUES (2, N'doctor', N'doctor@gmail.com', N'123', N'123', N'doctor', CAST(N'2025-03-23T02:52:58.973' AS DateTime), CAST(N'2025-03-23T02:52:58.973' AS DateTime))
INSERT [dbo].[User] ([id], [name], [email], [password], [phone], [role], [created_at], [updated_at]) VALUES (3, N'Patient', N'user@gmail.com', N'123', N'123', N'patient', CAST(N'2025-03-23T02:53:33.540' AS DateTime), CAST(N'2025-03-23T02:53:33.540' AS DateTime))
INSERT [dbo].[User] ([id], [name], [email], [password], [phone], [role], [created_at], [updated_at]) VALUES (4, N'panti', N'pansti@gmail.com', N'123', N'123', N'patient', CAST(N'2025-03-23T05:33:14.447' AS DateTime), CAST(N'2025-03-23T05:33:14.447' AS DateTime))
INSERT [dbo].[User] ([id], [name], [email], [password], [phone], [role], [created_at], [updated_at]) VALUES (9, N'paxnti', N'paxnti@gmail.com', N'123', N'123', N'patient', CAST(N'2025-03-23T05:35:11.757' AS DateTime), CAST(N'2025-03-23T05:35:11.757' AS DateTime))
INSERT [dbo].[User] ([id], [name], [email], [password], [phone], [role], [created_at], [updated_at]) VALUES (11, N'paxnti', N'paxinti@gmail.com', N'123', N'123', N'patient', CAST(N'2025-03-23T12:18:18.843' AS DateTime), CAST(N'2025-03-23T12:18:18.843' AS DateTime))
INSERT [dbo].[User] ([id], [name], [email], [password], [phone], [role], [created_at], [updated_at]) VALUES (12, N'John Doe', N'johndoe@example.com', N'password123', N'1234567890', N'patient', CAST(N'2025-03-24T13:38:26.357' AS DateTime), CAST(N'2025-03-24T13:38:26.357' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__AB6E6164660430EC]    Script Date: 3/24/2025 2:53:47 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment] ADD  DEFAULT ('pending') FOR [status]
GO
ALTER TABLE [dbo].[Appointment] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Appointment] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Insurance] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Insurance] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[MedicalRecord] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[MedicalRecord] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Medicine] ADD  DEFAULT ((0)) FOR [stock]
GO
ALTER TABLE [dbo].[Medicine] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Medicine] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF__Payment__status__778AC167]  DEFAULT ('pending') FOR [status]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF__Payment__created__787EE5A0]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF__Payment__updated__797309D9]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Prescription] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Prescription] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Service] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Service] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([doctor_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Insurance]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD FOREIGN KEY([doctor_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD FOREIGN KEY([prescription_id])
REFERENCES [dbo].[Prescription] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK__Payment__user_id__7A672E12] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK__Payment__user_id__7A672E12]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Service] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Service]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD FOREIGN KEY([doctor_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[PrescriptionDetail]  WITH CHECK ADD FOREIGN KEY([medicine_id])
REFERENCES [dbo].[Medicine] ([id])
GO
ALTER TABLE [dbo].[PrescriptionDetail]  WITH CHECK ADD FOREIGN KEY([prescription_id])
REFERENCES [dbo].[Prescription] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Symptoms]  WITH CHECK ADD  CONSTRAINT [FK_Symptoms_Health] FOREIGN KEY([health_id])
REFERENCES [dbo].[Health] ([id])
GO
ALTER TABLE [dbo].[Symptoms] CHECK CONSTRAINT [FK_Symptoms_Health]
GO
ALTER TABLE [dbo].[Symptoms]  WITH CHECK ADD  CONSTRAINT [FK_Symptoms_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Symptoms] CHECK CONSTRAINT [FK_Symptoms_User]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD CHECK  (([status]='canceled' OR [status]='completed' OR [status]='confirmed' OR [status]='pending'))
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD CHECK  (([stock]>=(0)))
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [CK__Payment__amount__74AE54BC] CHECK  (([amount]>(0)))
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [CK__Payment__amount__74AE54BC]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [CK__Payment__method__75A278F5] CHECK  (([method]='cash' OR [method]='credit_card' OR [method]='insurance'))
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [CK__Payment__method__75A278F5]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [CK__Payment__status__76969D2E] CHECK  (([status]='failed' OR [status]='completed' OR [status]='pending'))
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [CK__Payment__status__76969D2E]
GO
ALTER TABLE [dbo].[PrescriptionDetail]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD CHECK  (([role]='admin' OR [role]='doctor' OR [role]='patient'))
GO
USE [master]
GO
ALTER DATABASE [HealthcareSystem] SET  READ_WRITE 
GO
