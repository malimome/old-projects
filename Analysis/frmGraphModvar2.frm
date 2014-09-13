VERSION 5.00
Begin VB.Form frmGraphModn2var 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Plot graph of functions over a field"
   ClientHeight    =   7770
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10005
   LinkTopic       =   "frmGraphMod"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7770
   ScaleWidth      =   10005
   Begin VB.TextBox txtmod 
      Height          =   315
      Left            =   3525
      TabIndex        =   15
      Text            =   "19"
      Top             =   600
      Width           =   840
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Clear"
      Height          =   390
      Left            =   5925
      TabIndex        =   14
      Top             =   600
      Width           =   1140
   End
   Begin VB.CommandButton Command4 
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
      Left            =   7125
      TabIndex        =   13
      Top             =   600
      Width           =   1350
   End
   Begin VB.PictureBox pic 
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000018&
      FillColor       =   &H80000013&
      Height          =   6600
      Left            =   0
      ScaleHeight     =   6540
      ScaleWidth      =   9855
      TabIndex        =   8
      Top             =   1110
      Width           =   9915
   End
   Begin VB.TextBox tb 
      Height          =   330
      Left            =   5775
      TabIndex        =   7
      Text            =   "20"
      Top             =   75
      Width           =   405
   End
   Begin VB.TextBox ta 
      Height          =   330
      Left            =   5070
      TabIndex        =   6
      Text            =   "-20"
      Top             =   75
      Width           =   420
   End
   Begin VB.TextBox Text1 
      Height          =   345
      Left            =   1575
      TabIndex        =   5
      Text            =   "x^2+y^2-5*y-2"
      Top             =   75
      Width           =   3255
   End
   Begin VB.CommandButton Command2 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   420
      Left            =   8550
      TabIndex        =   4
      Top             =   75
      Width           =   1350
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Plot Serie"
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
      Left            =   8550
      TabIndex        =   3
      Top             =   600
      Width           =   1350
   End
   Begin VB.TextBox ts 
      Height          =   315
      Left            =   6375
      TabIndex        =   2
      Text            =   "0.5"
      Top             =   75
      Width           =   1140
   End
   Begin VB.TextBox txtscx 
      Height          =   315
      Left            =   900
      TabIndex        =   1
      Text            =   "20"
      Top             =   585
      Width           =   615
   End
   Begin VB.TextBox txtscy 
      Height          =   315
      Left            =   1650
      TabIndex        =   0
      Text            =   "20"
      Top             =   585
      Width           =   690
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
      TabIndex        =   12
      Top             =   90
      Width           =   1410
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "b"
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
      Left            =   5625
      TabIndex        =   11
      Top             =   150
      Width           =   120
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "a"
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
      Left            =   4890
      TabIndex        =   10
      Top             =   150
      Width           =   120
   End
   Begin VB.Label Label3 
      Caption         =   "scale                               Module:"
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
      Top             =   585
      Width           =   3315
   End
End
Attribute VB_Name = "frmGraphModn2var"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Dim Parser As MathExp
Dim canc As Boolean
Dim Expr As String
Const PI As Double = 3.14159291

Private Sub Command1_Click()
Command1.Enabled = False
canc = False
pic.Cls
Call First
Dim X As Double, Y As Double, oldx As Double, oldy As Double ', t As Double
Dim n As Long, C As Double, z As Double
Expr = Text1

    oldx = Val(ta): oldy = -FN(oldx, oldx)
    
    pic.DrawWidth = 5
    pic.PSet (oldx, oldy), vbRed
    pic.DrawWidth = 1
    
    If canc = True Then GoTo Ex
    
    For Y = Val(ta) To Val(tb)
    For X = Val(ta) To Val(tb)
        DoEvents
        z = -FN(X, Y)
        pic.Line (oldx, oldy)-(X, z), vbBlack
        pic.DrawWidth = 5
        pic.PSet (X, z), vbRed
        pic.DrawWidth = 1
        oldx = X: oldy = z
    Next X
    Next Y

Ex:
 Command1.Enabled = True
End Sub

Private Sub Command2_Click()
 canc = True
End Sub

Private Sub Command4_Click()
Command4.Enabled = False
canc = False
'Call First
Dim X As Double, Y As Double, oldx As Double, oldy As Double ', t As Double
Dim n As Long
Expr = Text1
'For x = -15 To 16 Step 0.1
    oldx = Val(ta): oldy = -f(oldx)
    If canc = True Then GoTo Ex
    
    For X = Val(ta) + Val(ts) To Val(tb) Step Val(ts)
        DoEvents
        Y = -f(X)
        pic.Line (oldx, oldy)-(X, Y), vbBlack
        oldx = X: oldy = Y
     Next X
Ex:
 Command4.Enabled = True
End Sub

Private Sub Command5_Click()
pic.Cls
End Sub

Private Sub Form_Load()
Set Parser = New MathExp
canc = False
'Parser.AddConstant "x", 0
End Sub
Private Function f(X As Double, Optional Y As Double = 0) As Double
Parser.AddConstant "x", X
Parser.AddConstant "y", Y
f = Parser.ParseExpression(Expr)
Parser.RemoveConstant "x"
Parser.RemoveConstant "y"
End Function
Private Function FN(X As Double, Y As Double) As Double
Parser.AddConstant "x", X
Parser.AddConstant "y", Y
FN = Parser.ParseExpression(Expr) Mod CLng(Val(txtmod))
Parser.RemoveConstant "x"
Parser.RemoveConstant "y"
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

Private Sub txtmod_Change()
Dim modn As Long
modn = Val(txtmod)
If modn Mod 2 <> 0 Then modn = modn - 1
ta = "-" & modn / 2
tb = modn / 2
End Sub

Private Sub txtscx_Change()
ta = "-" & txtscx
tb = txtscx
End Sub


