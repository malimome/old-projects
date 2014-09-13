VERSION 5.00
Begin VB.Form frmGraph 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Plot Graph"
   ClientHeight    =   8880
   ClientLeft      =   1815
   ClientTop       =   1215
   ClientWidth     =   10980
   Icon            =   "frmGraph.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   8880
   ScaleWidth      =   10980
   Begin VB.CommandButton Command3 
      Caption         =   "Clear"
      Height          =   375
      Left            =   240
      TabIndex        =   11
      Top             =   720
      Width           =   1335
   End
   Begin VB.TextBox txtres 
      Height          =   315
      Left            =   9075
      TabIndex        =   10
      Text            =   "15"
      Top             =   150
      Width           =   615
   End
   Begin VB.TextBox tb 
      Height          =   330
      Left            =   6525
      TabIndex        =   6
      Text            =   "16"
      Top             =   150
      Width           =   960
   End
   Begin VB.TextBox ta 
      Height          =   330
      Left            =   5400
      TabIndex        =   5
      Text            =   "-15"
      Top             =   150
      Width           =   870
   End
   Begin VB.TextBox Text1 
      Height          =   345
      Left            =   1650
      TabIndex        =   4
      Text            =   "3^cos(x/2)-1"
      Top             =   150
      Width           =   3255
   End
   Begin VB.CommandButton Command2 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   420
      Left            =   5550
      TabIndex        =   2
      Top             =   675
      Width           =   1350
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
      Left            =   3900
      TabIndex        =   1
      Top             =   675
      Width           =   1500
   End
   Begin VB.PictureBox pic 
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000018&
      FillColor       =   &H80000013&
      Height          =   7425
      Left            =   225
      ScaleHeight     =   7365
      ScaleWidth      =   10530
      TabIndex        =   0
      Top             =   1275
      Width           =   10590
   End
   Begin VB.Label Label3 
      Caption         =   "Resolution:"
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
      Left            =   7950
      TabIndex        =   9
      Top             =   225
      Width           =   915
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
      Left            =   6300
      TabIndex        =   8
      Top             =   225
      Width           =   180
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
      Left            =   4950
      TabIndex        =   7
      Top             =   225
      Width           =   375
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
      Left            =   150
      TabIndex        =   3
      Top             =   225
      Width           =   1410
   End
End
Attribute VB_Name = "frmGraph"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Parser As MathExp

Private Sub Command1_Click()
Command1.Enabled = False
Dim X As Double, Y As Double, oldx As Double, oldy As Double ', t As Double

oldx = Val(ta): oldy = -f(oldx)
'For x = -15 To 16 Step 0.1
For X = Val(ta) + 0.1 To Val(tb) Step 1 / Val(txtres)
    DoEvents
    Y = -f(X)
    'If x = -15 Then
        'pic.PSet (x, y), vbBlack
       'Else
    'Debug.Assert (y <> 0)
    't = Abs(1000 * (oldy - y))
    'If t < 10000 Then
    pic.Line (oldx, oldy)-(X, Y), vbBlack
    'End If
    oldx = X: oldy = Y
 Next X
 Command1.Enabled = True
End Sub

Private Sub Command3_Click()
pic.Cls
Call First
End Sub

Private Sub Form_Load()
Set Parser = New MathExp
'Parser.AddConstant "x", 0
End Sub

Private Function f(X As Double) As Double
Parser.AddConstant "x", X
f = Parser.ParseExpression(LCase$(Text1))
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
pic.Scale (-15, -12)-(15, 12)

'pic.Line (-16, -3)-(16, 3), RGB(150, 160, 255), BF
For i = -15 To 15
   pic.Line (i, -12)-(i, 12), &H80000013
   pic.Line (i, -0.01)-(i, 0.01), vbYellow
Next i
For i = -10 To -100 Step -10
    pic.Line (-15, -i / 10)-(16, -i / 10), &H80000013
'    pic.Line (-0.1, -i / 10)-(0.1, -i / 10), vbYellow
Next i
For i = 10 To 100 Step 10
    pic.Line (-15, -i / 10)-(16, -i / 10), &H80000013
'    pic.Line (-0.1, -i / 10)-(0.1, -i / 10), vbYellow
Next i
pic.Line (-20, 0)-(20, 0), vbBlue
pic.Line (0, -20)-(0, 20), vbBlue
End Sub

Private Sub TabStrip1_Click()

End Sub

Private Sub SSTab1_DblClick()

End Sub
