VERSION 5.00
Begin VB.Form frmIntegral 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Numeric Integral"
   ClientHeight    =   2835
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6555
   Icon            =   "frmIntegral.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   2835
   ScaleWidth      =   6555
   Begin VB.TextBox ta 
      Height          =   330
      Left            =   4230
      TabIndex        =   11
      Text            =   "-1"
      Top             =   1710
      Width           =   870
   End
   Begin VB.TextBox tb 
      Height          =   330
      Left            =   5400
      TabIndex        =   10
      Text            =   "1"
      Top             =   1710
      Width           =   960
   End
   Begin VB.TextBox txtVal 
      Height          =   420
      Left            =   1395
      TabIndex        =   4
      Top             =   2295
      Width           =   4875
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Solve in Interval"
      Default         =   -1  'True
      Height          =   375
      Left            =   495
      TabIndex        =   3
      Top             =   1710
      Width           =   2400
   End
   Begin VB.Frame Frame1 
      Caption         =   "Solution Methods"
      Height          =   825
      Left            =   90
      TabIndex        =   2
      Top             =   720
      Width           =   6315
      Begin VB.OptionButton Option4 
         Caption         =   "N.R."
         Height          =   330
         Left            =   3600
         TabIndex        =   9
         Top             =   360
         Width           =   735
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Gussian Vertex"
         Height          =   330
         Left            =   2115
         TabIndex        =   8
         Top             =   360
         Value           =   -1  'True
         Width           =   1410
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Trapeze"
         Height          =   330
         Left            =   1080
         TabIndex        =   7
         Top             =   360
         Width           =   1320
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Simple"
         Height          =   330
         Left            =   135
         TabIndex        =   6
         Top             =   360
         Width           =   1185
      End
   End
   Begin VB.TextBox txtFunc 
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
      Left            =   1395
      TabIndex        =   0
      Top             =   135
      Width           =   4875
   End
   Begin VB.Label Label4 
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
      Left            =   4050
      TabIndex        =   13
      Top             =   1800
      Width           =   120
   End
   Begin VB.Label Label3 
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
      Left            =   5220
      TabIndex        =   12
      Top             =   1755
      Width           =   120
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Answer is :"
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
      Left            =   270
      TabIndex        =   5
      Top             =   2385
      Width           =   945
   End
   Begin VB.Label Label1 
      Caption         =   "Function :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   225
      TabIndex        =   1
      Top             =   225
      Width           =   1095
   End
End
Attribute VB_Name = "frmIntegral"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Parser As MathExp

Private Sub Command1_Click()
Select Case True
    Case Option1
        Simple
    Case Option2
        Simpson
    Case Option3
        Gussian
    Case Option4
        Trapez
'    Case Option5
'        Simpson
End Select
End Sub
Private Function F(u As Double) As Double
    Parser.RemoveConstant "x"
    Parser.AddConstant "x", u
    F = Parser.ParseExpression(txtFunc)
End Function

Private Sub Form_Load()
    Set Parser = New MathExp
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set Parser = Nothing
End Sub
Private Sub Simple()
Dim i As Double
Dim Ret As Double
Const h As Double = 0.01
For i = Val(ta) To Val(tb) Step h
    Ret = Ret + h * F(i + h / 2)
Next i
txtVal = Ret
End Sub
Private Sub Simpson()
Dim i As Double
Dim Ret As Double
Dim h As Double
Dim n As Long
n = 10 * Abs(Val(ta) - Val(tb))
h = 0.1
Ret = F(Val(ta))
Dim k As Byte
k = 4
For i = 1 To n - 1
    Ret = Ret + k * F(Val(ta) + i * h)
    If k = 4 Then k = 2 Else k = 4
Next i

Ret = Ret + F(Val(tb))
Ret = Ret * h / 3
txtVal = Ret
End Sub
Private Sub Trapez()
Dim i As Double
Dim Ret As Double
Dim h As Double
Dim n As Long
n = 10 * Abs(Val(ta) - Val(tb))
h = 0.1

Ret = 0
For i = 1 To n - 1
    Ret = Ret + F(Val(ta) + i * h)
Next i
Ret = Ret * 2
Ret = Ret + F(Val(ta))
Ret = Ret + F(Val(tb))
Ret = Ret * h / 2
txtVal = Ret
End Sub
Private Sub Gussian()
Dim Ret As Double: Ret = 0
Dim Arg1 As Double, Arg2 As Double
Arg1 = (Val(tb) - Val(ta)) / 2
Arg2 = (Val(tb) + Val(ta)) / 2
Dim u As Double
u = Arg1 * (0.33998103) + Arg2
Ret = Ret + (0.347854) * F(u)

u = Arg1 * (-0.33998103) + Arg2
Ret = Ret + (0.6521451) * F(u)

u = Arg1 * (0.86113631) + Arg2
Ret = Ret + (0.6521451) * F(u)

u = Arg1 * (-0.86113631) + Arg2
Ret = Ret + (0.347854) * F(u)

txtVal = Ret
'Dim Ret As Double: Ret = 0
'Dim Arg1 As Double, Arg2 As Double
'Arg1 = (Val(tb) - Val(ta)) / 2
'Arg2 = (Val(tb) + Val(ta)) / 2
'Dim u As Double
'u = Arg2
'Ret = Ret + (5 / 9) * F(u)
'u = Arg1 * (-Sqr(3 / 5)) + Arg2
'Ret = Ret + (8 / 9) * F(u)
'u = Arg1 * (Sqr(3 / 5)) + Arg2
'Ret = Ret + (5 / 9) * F(u)
'txtVal = Ret
End Sub
