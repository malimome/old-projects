VERSION 5.00
Begin VB.Form frmGraph3D 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Graph3D"
   ClientHeight    =   6900
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9915
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6900
   ScaleWidth      =   9915
   Begin VB.TextBox Text2 
      Height          =   315
      Left            =   75
      TabIndex        =   9
      Text            =   "Text2"
      Top             =   300
      Width           =   1290
   End
   Begin VB.PictureBox pic 
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000018&
      FillColor       =   &H80000013&
      Height          =   6225
      Left            =   0
      ScaleHeight     =   6165
      ScaleWidth      =   9780
      TabIndex        =   5
      Top             =   600
      Width           =   9840
   End
   Begin VB.TextBox tb 
      Height          =   330
      Left            =   6345
      TabIndex        =   4
      Text            =   "16"
      Top             =   90
      Width           =   960
   End
   Begin VB.TextBox ta 
      Height          =   330
      Left            =   5175
      TabIndex        =   3
      Text            =   "-15"
      Top             =   90
      Width           =   870
   End
   Begin VB.TextBox Text1 
      Height          =   420
      Left            =   1485
      TabIndex        =   2
      Text            =   "3^cos(x/2)-1"
      Top             =   0
      Width           =   3255
   End
   Begin VB.CommandButton Command2 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   420
      Left            =   8850
      TabIndex        =   1
      Top             =   75
      Width           =   975
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
      Left            =   7425
      TabIndex        =   0
      Top             =   75
      Width           =   1275
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
      Left            =   45
      TabIndex        =   8
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
      Left            =   6165
      TabIndex        =   7
      Top             =   135
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
      Left            =   4995
      TabIndex        =   6
      Top             =   180
      Width           =   120
   End
End
Attribute VB_Name = "frmGraph3D"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim mx As Single, my As Single
Dim Parser As MathExp
Private Sub Form_Load()
mx = -100000
Set Parser = New MathExp
'Parser.AddConstant "x", 0
End Sub

Private Sub pic_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    mx = x
    my = y
End Sub

Private Sub pic_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    If mx <> -100000 Then
        Text2 = x & "---" & y
    End If
End Sub

Private Sub pic_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    mx = -100000
    my = -100000
End Sub

'
'Private Sub Command1_Click()
'Command1.Enabled = False
'pic.Cls
'Call First
'Dim x As Double, y As Double, oldx As Double, oldy As Double ', t As Double
'
'oldx = Val(ta): oldy = -f(oldx)
''For x = -15 To 16 Step 0.1
'For x = Val(ta) + 0.1 To Val(tb) Step 0.1
'    DoEvents
'    y = -f(x)
'    'If x = -15 Then
'        'pic.PSet (x, y), vbBlack
'       'Else
'    'Debug.Assert (y <> 0)
'    't = Abs(1000 * (oldy - y))
'    'If t < 10000 Then
'    pic.Line (oldx, oldy)-(x, y), vbBlack
'    'End If
'    oldx = x: oldy = y
' Next x
' Command1.Enabled = True
'End Sub

Private Function f(x As Double) As Double
Parser.AddConstant "x", x
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
pic.Scale (-15, 12)-(15, -12)

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
pic.Line (-10, 0)-(10, 0), vbBlue
pic.Line (0, -10)-(0, 10), vbBlue
pic.Line (6, 8)-(-6, -8), vbBlue
End Sub

