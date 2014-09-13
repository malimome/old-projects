VERSION 5.00
Begin VB.Form frmMat 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Matrix"
   ClientHeight    =   3180
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6390
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   3180
   ScaleWidth      =   6390
   Begin VB.CommandButton Command4 
      Caption         =   "Det ( A )"
      Height          =   375
      Left            =   3285
      TabIndex        =   8
      Top             =   1395
      Width           =   1410
   End
   Begin VB.CommandButton Command3 
      Caption         =   "AX=B"
      Height          =   375
      Left            =   4800
      TabIndex        =   7
      Top             =   1395
      Width           =   1410
   End
   Begin VB.CommandButton Command2 
      Caption         =   "A + B"
      Height          =   375
      Left            =   1718
      TabIndex        =   6
      Top             =   1395
      Width           =   1410
   End
   Begin VB.CommandButton Command1 
      Caption         =   "A x B"
      Height          =   375
      Left            =   150
      TabIndex        =   5
      Top             =   1395
      Width           =   1410
   End
   Begin VB.TextBox txtAns 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   780
      Left            =   180
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   4
      Top             =   1935
      Width           =   6000
   End
   Begin VB.TextBox txtB 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   803
      TabIndex        =   2
      Text            =   "[1,1,1/0,-4,-3/0,4,-7]"
      Top             =   765
      Width           =   5145
   End
   Begin VB.TextBox txtA 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   803
      TabIndex        =   0
      Text            =   "[1,1,1/0,-4,-3/0,4,-7]"
      Top             =   270
      Width           =   5145
   End
   Begin VB.Label Label3 
      Caption         =   "Matrix operations still have a lot of problems which i haven't handle. So be carefull with your entries.SORRY"
      Height          =   390
      Left            =   225
      TabIndex        =   9
      Top             =   2775
      Width           =   6015
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "B"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   443
      TabIndex        =   3
      Top             =   855
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "A"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   443
      TabIndex        =   1
      Top             =   360
      Width           =   135
   End
End
Attribute VB_Name = "frmMat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Base 1
Dim ma As New clsMatrix
Private Sub Command1_Click()
Dim Mat1() As Single, Mat2() As Single, RetMat() As Single

ma.StrToMatrix txtA, Mat1
ma.StrToMatrix txtB, Mat2

ma.MatMultip Mat1, Mat2, RetMat

txtAns = ma.ToString(RetMat)

Erase Mat1
Erase Mat2
Erase RetMat
End Sub

Private Sub Command2_Click()
Dim Mat1() As Single, Mat2() As Single, RetMat() As Single

ma.StrToMatrix txtA, Mat1
ma.StrToMatrix txtB, Mat2

ma.MatAddition Mat1, Mat2, RetMat

txtAns = ma.ToString(RetMat)

Erase Mat1
Erase Mat2
Erase RetMat
End Sub

Private Sub Command3_Click()
Dim Mat() As Single, B() As Single, X() As Single
If txtB Like "*/*" Then
   txtAns = "error"
   Exit Sub
End If
ma.StrToMatrix txtA, Mat
ma.StrToVector txtB, B

ma.NxN_Equation Mat, B, X

txtAns = ma.ToString(X)

Erase Mat
Erase B
Erase X
End Sub

Private Sub Command4_Click()
Dim Mat1() As Single

ma.StrToMatrix txtA, Mat1

txtAns = ma.Deteminent(Mat1)

Erase Mat1
End Sub
