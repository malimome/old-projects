VERSION 5.00
Begin VB.Form FrmCalender 
   BackColor       =   &H80000009&
   BorderStyle     =   0  'None
   Caption         =   " ﬁÊÌ„"
   ClientHeight    =   2490
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2640
   Icon            =   "Frmcale.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2490
   ScaleWidth      =   2640
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1950
      Left            =   90
      ScaleHeight     =   1950
      ScaleWidth      =   2505
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   495
      Width           =   2505
      Begin VB.Label Label2 
         BackColor       =   &H80000009&
         Caption         =   "www.momeni.us.tc"
         ForeColor       =   &H8000000D&
         Height          =   240
         Left            =   1125
         TabIndex        =   53
         Top             =   1715
         Width           =   1365
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   7
         Left            =   0
         TabIndex        =   52
         Top             =   585
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   8
         Left            =   360
         TabIndex        =   51
         Top             =   585
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   9
         Left            =   720
         TabIndex        =   50
         Top             =   585
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   10
         Left            =   1080
         TabIndex        =   49
         Top             =   585
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   11
         Left            =   1440
         TabIndex        =   48
         Top             =   585
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   12
         Left            =   1800
         TabIndex        =   47
         Top             =   582
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   255
         Index           =   13
         Left            =   2160
         TabIndex        =   46
         Top             =   594
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   255
         Index           =   6
         Left            =   2160
         TabIndex        =   45
         Top             =   315
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   5
         Left            =   1800
         TabIndex        =   44
         Top             =   315
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   1440
         TabIndex        =   43
         Top             =   315
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   1080
         TabIndex        =   42
         Top             =   315
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   720
         TabIndex        =   41
         Top             =   315
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   40
         Top             =   315
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00F8EFEF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   0
         TabIndex        =   39
         Top             =   315
         Width           =   330
      End
      Begin VB.Line Line5 
         BorderColor     =   &H80000001&
         X1              =   3225
         X2              =   0
         Y1              =   270
         Y2              =   270
      End
      Begin VB.Label DayLabel 
         Alignment       =   2  'Center
         BackColor       =   &H00FFC0C0&
         Caption         =   "‘"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   0
         RightToLeft     =   -1  'True
         TabIndex        =   38
         Top             =   0
         Width           =   330
      End
      Begin VB.Label DayLabel 
         Alignment       =   2  'Center
         BackColor       =   &H00FFC0C0&
         Caption         =   "Ì"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   362
         RightToLeft     =   -1  'True
         TabIndex        =   37
         Top             =   0
         Width           =   330
      End
      Begin VB.Label DayLabel 
         Alignment       =   2  'Center
         BackColor       =   &H00FFC0C0&
         Caption         =   "œ"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   724
         RightToLeft     =   -1  'True
         TabIndex        =   36
         Top             =   0
         Width           =   330
      End
      Begin VB.Label DayLabel 
         Alignment       =   2  'Center
         BackColor       =   &H00FFC0C0&
         Caption         =   "”"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   1086
         RightToLeft     =   -1  'True
         TabIndex        =   35
         Top             =   0
         Width           =   330
      End
      Begin VB.Label DayLabel 
         Alignment       =   2  'Center
         BackColor       =   &H00FFC0C0&
         Caption         =   "ç"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   1448
         RightToLeft     =   -1  'True
         TabIndex        =   34
         Top             =   0
         Width           =   330
      End
      Begin VB.Label DayLabel 
         Alignment       =   2  'Center
         BackColor       =   &H00FFC0C0&
         Caption         =   "Å"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   5
         Left            =   1810
         RightToLeft     =   -1  'True
         TabIndex        =   33
         Top             =   0
         Width           =   330
      End
      Begin VB.Label DayLabel 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0FF&
         Caption         =   "Ã"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   6
         Left            =   2175
         TabIndex        =   32
         Top             =   0
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   255
         Index           =   20
         Left            =   2160
         TabIndex        =   31
         Top             =   873
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   19
         Left            =   1800
         TabIndex        =   30
         Top             =   855
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   18
         Left            =   1440
         TabIndex        =   29
         Top             =   873
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   17
         Left            =   1080
         TabIndex        =   28
         Top             =   873
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   16
         Left            =   720
         TabIndex        =   27
         Top             =   873
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   15
         Left            =   360
         TabIndex        =   26
         Top             =   873
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   14
         Left            =   0
         TabIndex        =   25
         Top             =   873
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   255
         Index           =   27
         Left            =   2160
         TabIndex        =   24
         Top             =   1152
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   26
         Left            =   1800
         TabIndex        =   23
         Top             =   1146
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   25
         Left            =   1440
         TabIndex        =   22
         Top             =   1152
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   24
         Left            =   1080
         TabIndex        =   21
         Top             =   1152
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   23
         Left            =   720
         TabIndex        =   20
         Top             =   1152
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   22
         Left            =   360
         TabIndex        =   19
         Top             =   1152
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   21
         Left            =   0
         TabIndex        =   18
         Top             =   1152
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   255
         Index           =   34
         Left            =   2160
         TabIndex        =   17
         Top             =   1431
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   33
         Left            =   1800
         TabIndex        =   16
         Top             =   1428
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   32
         Left            =   1440
         TabIndex        =   15
         Top             =   1431
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   31
         Left            =   1080
         TabIndex        =   14
         Top             =   1431
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   30
         Left            =   720
         TabIndex        =   13
         Top             =   1431
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   29
         Left            =   360
         TabIndex        =   12
         Top             =   1431
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   28
         Left            =   0
         TabIndex        =   11
         Top             =   1431
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   37
         Left            =   720
         TabIndex        =   6
         Top             =   1710
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   36
         Left            =   360
         TabIndex        =   5
         Top             =   1710
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   35
         Left            =   0
         TabIndex        =   4
         Top             =   1710
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   40
         Left            =   1800
         TabIndex        =   9
         Top             =   1710
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   39
         Left            =   1440
         TabIndex        =   8
         Top             =   1710
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   38
         Left            =   1080
         TabIndex        =   7
         Top             =   1710
         Width           =   330
      End
      Begin VB.Label dateLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   255
         Index           =   41
         Left            =   2160
         TabIndex        =   10
         Top             =   1710
         Width           =   330
      End
   End
   Begin VB.ComboBox YearList 
      Appearance      =   0  'Flat
      BackColor       =   &H8000000E&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   315
      Left            =   1215
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   75
      Width           =   810
   End
   Begin VB.ComboBox MonthList 
      Appearance      =   0  'Flat
      BackColor       =   &H8000000E&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   315
      Left            =   90
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   78
      Width           =   1095
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000003&
      X1              =   2625
      X2              =   2625
      Y1              =   0
      Y2              =   3000
   End
   Begin VB.Line Line3 
      BorderColor     =   &H80000003&
      X1              =   0
      X2              =   3225
      Y1              =   2475
      Y2              =   2475
   End
   Begin VB.Line Line6 
      BorderColor     =   &H80000001&
      X1              =   3225
      X2              =   0
      Y1              =   450
      Y2              =   450
   End
   Begin VB.Line Line4 
      BorderColor     =   &H80000003&
      X1              =   3225
      X2              =   0
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000003&
      X1              =   0
      X2              =   0
      Y1              =   0
      Y2              =   3000
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00C0E0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«„—Ê“"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   2115
      TabIndex        =   2
      Top             =   75
      Width           =   450
   End
End
Attribute VB_Name = "FrmCalender"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'******************************************************************************
'* Copyright (C) 2002-2005 Mohsen Ali Momeni - All Rights Reserved.
'*
'* This program is free software; you can redistribute it and/or modify
'* it under the terms of the GNU General Public License as published by
'* the Free Software Foundation; either version 2 of the License, or
'* (at your option) any later version.
'*
'* This program is distributed in the hope that it will be useful,
'* but WITHOUT ANY WARRANTY; without even the implied warranty of
'* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'* GNU General Public License for more details.
'*
'* You should have received a copy of the GNU General Public License
'* along with this program; if not, write to the Free Software
'* Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
'*
'* To get more information, you can mail me at: m.alimomeni@gmail.com
'* or goto my webpage at: www.momeni.us.tc
'*
'* FrmCalender.frm : Form to display calender.
'* This file is part of the PDTPicker - Persian Date Picker.
'******************************************************************************

Option Explicit
Private Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Private Type RECT
        Left As Long
        Top As Long
        Right As Long
        Bottom As Long
End Type

Dim WithEvents sh As cSystemHook
Attribute sh.VB_VarHelpID = -1

Private Const DisCol As Long = &HF8EFEF
Dim calDate As Date ', fcalDate As String
Dim SuspendFlag As Boolean
Dim FocusedDay As String
Dim StartLabelPos As Integer
Dim FT As Boolean
Dim CDt As New ClsDate
Dim b As Boolean
Private Sub Form_Load()
b = False
FT = False
If ErrorResume Then On Error Resume Next
Set sh = New cSystemHook
sh.SetHook

Me.BackColor = FormBKC
Dim j, k As Integer
For j = 0 To 6
  For k = j To 40 Step 7
    DayLabel(j).Left = DayLabel(0).Left + j * (360)
    dateLabel(k).Left = DayLabel(0).Left + j * (360)
    dateLabel(k).FontBold = m_FontB
    dateLabel(k).Caption = ""
    DayLabel(j).Top = DayLabel(0).Top
  Next k
Next j
For j = 0 To 5
  For k = 7 * j To 7 * j + 6
    dateLabel(k).Top = DayLabel(0).Top + (j + 1) * 280
  Next k
Next j

Dim MaxYear As Integer
Dim MinYear As Integer
MinYear = Year(Date) - 621 - YR
MaxYear = MinYear + 2 * YR
SuspendFlag = True

YearList.FontBold = m_FontB
MonthList.FontBold = m_FontB
Dim i As Integer
For i = 0 To (MaxYear - MinYear)
    YearList.List(i) = (i + MinYear)
    YearList.ItemData(i) = (i + MinYear)
Next
For i = 0 To (11)
    If m_SFM Then
        MonthList.List(i) = (i + 1) & " " & CDt.FMonthName(i + 1)
    Else
        MonthList.List(i) = (i + 1)
    End If
    MonthList.ItemData(i) = (i + 1)
Next

If CDt.FYear(InitDate) <= MinYear Then
    InitDate = MinYear & "/" & Format$(CDt.FMonth(InitDate), "00") & "/" & Format$(CDt.FDay(InitDate), "00")
ElseIf CDt.FYear(InitDate) >= MaxYear Then
    InitDate = MaxYear & "/" & Format$(CDt.FMonth(InitDate), "00") & "/" & Format$(CDt.FDay(InitDate), "00")
End If

If InitDate = vbNullString Then InitDate = Ftoday
ShowDate (InitDate)
End Sub
Private Sub ShowDate(ID As String)
    SuspendFlag = True
    MonthList.ListIndex = CDt.FMonth(ID) - 1 'CDt.TMonth(calDate)
    YearList.Text = CDt.FYear(ID) 'CDt.TYear(calDate)
    SuspendFlag = False
    
    DisplayCalendar (ID)
    HighlightToday
    FocusedDay = CDt.FDay(ID)
    ShowFocusedDate (FocusedDay)
End Sub
Private Sub DisplayCalendar(InDt As String)
      ' Draw the selected month on calendar
      Dim nMonth As Integer, nYear As Integer
      Dim nLastDay As Integer
      Dim nmodRemainder As Integer
      Dim n As Integer, nDay As Integer, nWeekday As Integer
      Dim CDay As String
      Dim firstMonthYear As Date, ffirstMonthYear As String
      If ErrorResume Then On Error Resume Next
      'nMonth = Val(Mid$(fcalDate, 6, 2)) ' CDt.TMonth(calDate)
      'nYear = Val(Mid$(fcalDate, 1, 4))
      nMonth = CDt.FMonth(InDt)
      nYear = CDt.FYear(InDt)
      
      
      
      nLastDay = CDt.TDaysInMonth(nMonth, nYear)
      
      ' Hide away empty days
      ' Counted from 1st of the Month
      ffirstMonthYear = nYear & "/" & Format(nMonth, "00") & "/01"
      firstMonthYear = CDt.Sh2Mi(ffirstMonthYear)
      
        ' If 1st of the month is Sunday, the value of
        ' Weekday(firstMonthYear) will be 1.
      
      StartLabelPos = CDt.TWeekDay(firstMonthYear)
      nWeekday = StartLabelPos
      If StartLabelPos > 1 Then
          For n = 1 To (nWeekday - 1)
              'dateLabel(n - 1).Visible = False
              dateLabel(n - 1).BackColor = DisCol
              dateLabel(n - 1).Caption = ""
          Next
      End If
      
      nDay = 1
      For n = nWeekday To 45
          If nDay <= nLastDay Then
              CDay = Str(nDay)
              If Len(CDay) < 2 Then
                  CDay = " " & CDay
              End If
              dateLabel(n - 1).BackColor = &H80000013 ' &H80000016
              If Val(CDay) < 10 Then
                   CDay = " " & CDay
              End If
              dateLabel(n - 1).Caption = CDay
              dateLabel(n - 1).Visible = True
          Else
              'dateLabel(n - 1).Visible = False
              dateLabel(n - 1).BackColor = DisCol
              dateLabel(n - 1).Caption = ""
              
          End If
          If nLastDay < 36 Then
            Label2.Visible = True
            'Label2.ZOrder (1)
            Else
            Label2.Visible = False
          End If
          nDay = nDay + 1
          If n > 41 Then    ' DateLabel array upto 41
              Exit For
          End If
       Next
       ' If selected date falls on this calendar page, change color and redisplay
End Sub

Private Sub Form_Paint()
If b Then Exit Sub
b = True
If Not Non_Modal Then EnableWindow CntHwnd, 1
End Sub
Private Sub Label1_Click()
FT = True
ShowDate (Ftoday)
End Sub
Public Sub MyWebLink(LinkTo As String)
' routine to act as a hyperlink
  On Error Resume Next
  Const SW_SHOWNORMAL = 1
  ShellExecute GetDesktopWindow, "Open", LinkTo, "", "", SW_SHOWNORMAL
  On Error GoTo 0
End Sub 'MyWebLink(LinkTo As String)
Private Sub Label2_Click()
MyWebLink "http://www.momeni.us.tc"
End Sub

Private Sub MonthList_Click()
    If SuspendFlag = True Then
        Exit Sub
    End If
    Dim cNewMonth As String
    Dim cNewYear As String
    Dim CDay As String
    Dim cNewCalDate As String, fNewCalDate As String
    Dim nLastDay As Integer
    If ErrorResume Then On Error Resume Next
     ' NB In Vbasic, items in a list array are in string form
   ' cNewMonth = MonthList.Text
    cNewMonth = MonthList.ItemData(MonthList.ListIndex)
'    If cNewMonth = 12 Then
'     DoEvents
'     End If
    If Len(cNewMonth) < 2 Then
       cNewMonth = "0" & cNewMonth
    End If
    
    cNewYear = YearList.Text
    nLastDay = CDt.TDaysInMonth(Val(cNewMonth), Val(cNewYear))
    fNewCalDate = cNewYear & "/" & cNewMonth & "/" & CStr(nLastDay)
    cNewCalDate = CDt.Sh2Mi(fNewCalDate)
    calDate = CDate(cNewCalDate)
    'fcalDate = CDt.mi2sh(calDate)
    'fcalDate = fNewCalDate
    If FocusedDay > nLastDay Then FocusedDay = " " & nLastDay
    'Text1 = CDt.TSeq(Val(FocusedDate)) & " " & CDt.FMonthName(CDt.TMonth(calDate)) & " " & Str(CDt.TYear(calDate))
    DisplayCalendar (fNewCalDate)
    
    ShowFocusedDate (FocusedDay)
End Sub
       
Private Sub HighlightToday()
Dim n As Integer
If ErrorResume Then On Error Resume Next
If (CDt.FMonth(InitDate) = CDt.FMonth(Ftoday) And _
                                    CDt.FYear(InitDate) = CDt.FYear(Ftoday)) Or FT Then
    n = CDt.FDay(Ftoday)
    dateLabel(n + StartLabelPos - 2).BackColor = &HC0E0FF
End If
FT = False
End Sub
Private Sub ShowFocusedDate(FDay As Integer)
     Dim i As Integer
     If ErrorResume Then On Error Resume Next
     For i = 0 To 41
        ' If dateLabel(i).Visible = True Then
        'If dateLabel(i).BackColor <> DisCol Then
              If Val(dateLabel(i).Caption) = FDay Then
                   dateLabel(i).BorderStyle = 1
              Else
                   dateLabel(i).BorderStyle = 0
              End If
         'End If
     Next
End Sub
Private Sub dateLabel_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
On Error Resume Next
FocusedDay = dateLabel(Index).Caption
ShowFocusedDate (FocusedDay)
End Sub
Private Sub Datelabel_Click(Index As Integer)
If dateLabel(Index).BackColor <> DisCol Then ChooseDate
'Text1.Text = CDt.TSeq(Val(FocusedDate)) & " " & CDt.FMonthName(CDt.TMonth(calDate)) & " " & Str(CDt.TYear(calDate))
End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 Then
    ChooseDate
ElseIf KeyCode = 9 Then
    Chosen = True
    Unload Me
End If
End Sub
Private Sub ChooseDate()
Dim Ret As String, Temp As String
If ErrorResume Then On Error Resume Next
Temp = MonthList.ItemData(MonthList.ListIndex)
Temp = IIf(Len(Temp) = 1, "0" & Temp, Temp)

Ret = Trim$(Str$(YearList.Text))
Ret = Ret & "/" & Temp 'CDt.TMonth(calDate)

Temp = Trim$(Str$(FocusedDay))
Temp = IIf(Len(Temp) = 1, "0" & Temp, Temp)

Ret = Ret & "/" & Temp  'CDt.TYear(calDate)
ResultDate = Ret
InitDate = Ret
Chosen = True
Unload Me
End Sub
Private Sub Form_Click()
About
Chosen = True
Unload Me
End Sub
Private Sub About()
    MsgBox vbTab & "~~~~~~~~~~~~~~~~~~~~~~ FDTPicker v1.5 ~~~~~~~~~~~~~~~~~~~~~~" & vbCrLf & _
        vbTab & "Written by Mohsen A. Momeni" & vbTab & vbTab & vbTab & "Website : www.momeni.us.tc" & vbCrLf & vbCrLf & _
        "Persian clone for Microsoft DTPicker ActiveX control, for simple implementation of Shamsi Date in your programs"
End Sub
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
 Set CDt = Nothing
 'If Non_Modal Then
sh.RemoveHook
Set sh = Nothing
b = False
'End If
End Sub
Private Sub Picture1_Click()
Chosen = True
Unload Me
End Sub

Private Sub sh_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
'If Non_Modal Then
    If Not IsHover(x, y) Then
        Chosen = True
        Unload Me
    End If
'End If
End Sub
Private Function IsHover(x As Single, y As Single) As Boolean
IsHover = False
Dim mR As RECT
GetWindowRect Me.hwnd, mR
If (x > mR.Left And x < mR.Right) And _
        (y > mR.Top And y < mR.Bottom) Then IsHover = True
End Function
Private Sub YearList_Click()
    MonthList_Click
End Sub
