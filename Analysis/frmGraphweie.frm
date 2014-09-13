VERSION 5.00
Begin VB.Form frmGraphWeie 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Plot Graph of a sequence of functions"
   ClientHeight    =   8535
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10920
   Icon            =   "frmGraphweie.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   8535
   ScaleWidth      =   10920
   Begin VB.TextBox txtscy 
      Height          =   315
      Left            =   5100
      TabIndex        =   15
      Text            =   "5"
      Top             =   675
      Width           =   690
   End
   Begin VB.TextBox txtscx 
      Height          =   315
      Left            =   4350
      TabIndex        =   14
      Text            =   "1"
      Top             =   675
      Width           =   615
   End
   Begin VB.TextBox txtStep 
      Height          =   315
      Left            =   3150
      TabIndex        =   13
      Text            =   "2"
      Top             =   675
      Width           =   390
   End
   Begin VB.TextBox ts 
      Height          =   315
      Left            =   8775
      TabIndex        =   12
      Text            =   "0.1"
      Top             =   150
      Width           =   1140
   End
   Begin VB.TextBox txtn2 
      Height          =   315
      Left            =   1950
      TabIndex        =   11
      Text            =   "20"
      Top             =   675
      Width           =   540
   End
   Begin VB.TextBox txtn1 
      Height          =   315
      Left            =   975
      TabIndex        =   10
      Text            =   "1"
      Top             =   675
      Width           =   390
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Plot Curve"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   6750
      TabIndex        =   5
      Top             =   615
      Width           =   1500
   End
   Begin VB.CommandButton Command2 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   420
      Left            =   8400
      TabIndex        =   4
      Top             =   600
      Width           =   1350
   End
   Begin VB.TextBox Text1 
      Height          =   420
      Left            =   1530
      TabIndex        =   3
      Text            =   "(1-x^2)^N"
      Top             =   90
      Width           =   3255
   End
   Begin VB.TextBox ta 
      Height          =   330
      Left            =   5550
      TabIndex        =   2
      Text            =   "-1"
      Top             =   105
      Width           =   420
   End
   Begin VB.TextBox tb 
      Height          =   330
      Left            =   6525
      TabIndex        =   1
      Text            =   "1"
      Top             =   75
      Width           =   405
   End
   Begin VB.PictureBox pic 
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000018&
      FillColor       =   &H80000013&
      Height          =   7275
      Left            =   0
      ScaleHeight     =   7215
      ScaleWidth      =   10830
      TabIndex        =   0
      Top             =   1200
      Width           =   10890
   End
   Begin VB.Label Label5 
      Caption         =   "Resolution"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   7725
      TabIndex        =   16
      Top             =   150
      Width           =   1140
   End
   Begin VB.Label Label3 
      Caption         =   "N from :             to            step          scale"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   75
      TabIndex        =   9
      Top             =   675
      Width           =   4215
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "from"
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
      Left            =   5100
      TabIndex        =   8
      Top             =   150
      Width           =   375
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "to"
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
      Left            =   6225
      TabIndex        =   7
      Top             =   150
      Width           =   180
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Math Expression"
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
      Left            =   90
      TabIndex        =   6
      Top             =   180
      Width           =   1410
   End
End
Attribute VB_Name = "frmGraphWeie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Parser As MathExp
Dim canc As Boolean
Dim Expr As String

Private Sub Command1_Click()
On Error Resume Next
Command1.Enabled = False
canc = False
pic.Cls
Call First
Dim X As Double, Y As Double, oldx As Double, oldy As Double ', t As Double
Dim n As Long
Expr = "(1-x^2)^N"

For n = Val(txtn1) To Val(txtn2) Step Val(txtStep)
    Expr = LCase$(Replace$(Text1, "N", Str(n)))
    oldx = Val(ta): oldy = -f(oldx) * 1 / Integral
    If canc = True Then GoTo Ex
    For X = Val(ta) + Val(ts) To Val(tb) Step Val(ts)
        DoEvents
        Y = -f(X) * 1 / Integral
        pic.Line (oldx, oldy)-(X, Y), vbBlack
        oldx = X: oldy = Y
     Next X
 Next n
Ex:
 Command1.Enabled = True
End Sub
Private Function Integral() As Double
Dim i As Double
Dim Ret As Double
Dim h As Double, X As Double
Dim n As Long
n = 10 * 2
h = 0.1

Ret = 0
For i = 1 To n - 1
    Ret = Ret + f(-1 + i * h)
Next i
Ret = Ret * 2
Ret = Ret + f(-1)
Ret = Ret + f(1)
Ret = Ret * h / 2
Integral = Ret
End Function

Private Sub Command2_Click()
 canc = True
End Sub

Private Sub Form_Load()
Set Parser = New MathExp
canc = False
'Parser.AddConstant "x", 0
End Sub

Private Function f(X As Double) As Double
Parser.AddConstant "x", X
f = Parser.ParseExpression(Expr)
Parser.RemoveConstant "x"
End Function

Private Sub Form_Paint()
Call First
End Sub

Private Sub Form_Unload(Cancel As Integer)
Set Parser = Nothing
End Sub
Private Sub First()
Dim i As Integer
pic.Scale (-Val(txtscx), -Val(txtscy))-(Val(txtscx), Val(txtscy))

'pic.Line (-16, -3)-(16, 3), RGB(150, 160, 255), BF
For i = -Val(txtscy) To Val(txtscy)
   pic.Line (i, -Val(txtscx))-(i, Val(txtscx)), &H80000013
   pic.Line (i, -0.01)-(i, 0.01), vbYellow
Next i
For i = -10 To -100 Step -10
    pic.Line (-Val(txtscy), -i / 10)-(Val(txtscy) + 1, -i / 10), &H80000013
'    pic.Line (-0.1, -i / 10)-(0.1, -i / 10), vbYellow
Next i
For i = 10 To 100 Step 10
    pic.Line (-4, -i / 10)-(5, -i / 10), &H80000013
'    pic.Line (-0.1, -i / 10)-(0.1, -i / 10), vbYellow
Next i
pic.Line (-20, 0)-(20, 0), vbBlue
pic.Line (0, -20)-(0, 20), vbBlue
End Sub

Private Sub txtscx_Change()
ta = "-" & txtscx
tb = txtscx
End Sub
