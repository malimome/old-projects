VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmEqdg2 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Equation Solver Degree 2"
   ClientHeight    =   3165
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7230
   Icon            =   "frmEqdg2.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   3165
   ScaleWidth      =   7230
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command3 
      Cancel          =   -1  'True
      Caption         =   "Show Details >>"
      Height          =   420
      Left            =   4590
      TabIndex        =   22
      Top             =   2655
      Width           =   1680
   End
   Begin VB.TextBox Text2 
      Height          =   330
      Left            =   1530
      TabIndex        =   15
      Text            =   "(x^3-y^3)/6+1/3"
      Top             =   495
      Width           =   3255
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Calculate Root"
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
      Left            =   953
      TabIndex        =   8
      Top             =   2655
      Width           =   1770
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   420
      Left            =   2798
      TabIndex        =   7
      Top             =   2655
      Width           =   1725
   End
   Begin VB.TextBox Text1 
      Height          =   330
      Left            =   1530
      TabIndex        =   6
      Text            =   "(x^3+y^3)/6+0.5"
      Top             =   90
      Width           =   3255
   End
   Begin VB.TextBox ta 
      Height          =   330
      Left            =   405
      TabIndex        =   5
      Text            =   "0.5"
      Top             =   1080
      Width           =   870
   End
   Begin VB.TextBox tb 
      Height          =   330
      Left            =   1710
      TabIndex        =   4
      Text            =   "0.5"
      Top             =   1080
      Width           =   960
   End
   Begin VB.TextBox te 
      Height          =   330
      Left            =   3015
      TabIndex        =   3
      Text            =   "0.0000001"
      Top             =   1080
      Width           =   1140
   End
   Begin VB.Frame Frame1 
      Caption         =   "Solution Methods"
      Height          =   780
      Left            =   135
      TabIndex        =   0
      Top             =   1755
      Width           =   6945
      Begin VB.OptionButton Option4 
         Caption         =   "N.R."
         Height          =   330
         Left            =   1620
         TabIndex        =   2
         Top             =   270
         Width           =   1185
      End
      Begin VB.OptionButton Option3 
         Caption         =   "SimpleRepeat"
         Height          =   330
         Left            =   135
         TabIndex        =   1
         Top             =   270
         Value           =   -1  'True
         Width           =   1410
      End
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid FG 
      Height          =   2670
      Left            =   135
      TabIndex        =   9
      Top             =   3195
      Width           =   6990
      _ExtentX        =   12330
      _ExtentY        =   4710
      _Version        =   393216
      Cols            =   4
      AllowBigSelection=   0   'False
      ScrollBars      =   2
      AllowUserResizing=   1
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _NumberOfBands  =   1
      _Band(0).Cols   =   4
      _Band(0).GridLinesBand=   1
      _Band(0).TextStyleBand=   0
      _Band(0).TextStyleHeader=   0
   End
   Begin VB.Label lblY 
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
      Left            =   4680
      TabIndex        =   21
      Top             =   1350
      Width           =   2415
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "Y is:"
      Height          =   195
      Left            =   4320
      TabIndex        =   20
      Top             =   1350
      Width           =   300
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "X is:"
      Height          =   195
      Left            =   4320
      TabIndex        =   19
      Top             =   990
      Width           =   300
   End
   Begin VB.Label lblX 
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
      Left            =   4680
      TabIndex        =   18
      Top             =   990
      Width           =   2415
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "G ( X , Y )="
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
      Left            =   360
      TabIndex        =   17
      Top             =   585
      Width           =   975
   End
   Begin VB.Label lAns2 
      Caption         =   "= Y"
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
      Left            =   4860
      TabIndex        =   16
      Top             =   540
      Width           =   2265
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "X0"
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
      Left            =   135
      TabIndex        =   14
      Top             =   1170
      Width           =   240
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Y0"
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
      Left            =   1395
      TabIndex        =   13
      Top             =   1125
      Width           =   240
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "E"
      BeginProperty Font 
         Name            =   "Script"
         Size            =   11.25
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2835
      TabIndex        =   12
      Top             =   1125
      Width           =   105
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "F ( X , Y )="
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
      Left            =   360
      TabIndex        =   11
      Top             =   135
      Width           =   945
   End
   Begin VB.Label lAns1 
      Caption         =   "= X"
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
      Left            =   4860
      TabIndex        =   10
      Top             =   135
      Width           =   2265
   End
End
Attribute VB_Name = "frmEqdg2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Canceled As Boolean
Dim Parser As MathExp
Private Const h As Single = 0.01
Private Sub Command1_Click()
FGreset
Canceled = False
Select Case True
    Case Option3
        SimpleRepeat Val(ta), Val(tb), Val(te)
    Case Option4
        NR Val(ta), Val(tb), Val(te)
End Select
End Sub

Private Function F(x As Double, y As Double) As Double
Parser.AddConstant "x", x
Parser.AddConstant "y", y
F = Parser.ParseExpression(LCase$(Text1))
Parser.RemoveConstant "x"
Parser.RemoveConstant "y"
End Function
Private Function G(x As Double, y As Double) As Double
Parser.AddConstant "x", x
Parser.AddConstant "y", y
G = Parser.ParseExpression(LCase$(Text2))
Parser.RemoveConstant "x"
Parser.RemoveConstant "y"
End Function
Private Function Fx(x As Double, y As Double) As Double   'Derivitation of Fx(x)
Fx = (F(x + h, y) - F(x, y)) / h
End Function
Private Function Gx(x As Double, y As Double) As Double   'Derivitation of Gx(x)
Gx = (G(x + h, y) - G(x, y)) / h
End Function
Private Function Fy(x As Double, y As Double) As Double   'Derivitation of Fy(x)
Fy = (F(x, y + h) - F(x, y)) / h
End Function
Private Function Gy(x As Double, y As Double) As Double   'Derivitation of Gy(x)
Gy = (G(x, y + h) - G(x, y)) / h
End Function
Private Sub WriteToFG(i As Integer, a As Double, b As Double, Optional x As Double)
With FG
    If i = 1 Then
        .TextMatrix(1, 0) = i
        Else
        .Rows = .Rows + 1
        .TextMatrix(i, 0) = i
    End If
    .TextMatrix(i, 1) = a: .TextMatrix(i, 2) = b: .TextMatrix(i, 3) = x
End With
DoEvents
End Sub
Private Sub SimpleRepeat(ByVal a As Double, ByVal b As Double, er As Double)
Dim x As Double, y As Double, i As Integer
Dim r As Double, t As Double

i = 1
r = er + 1
t = er + 1

Do Until (((r < er) And (t < er)) Or Canceled)
    x = F(a, b)
    y = G(a, b)
    WriteToFG i, x, y
    r = Abs(a - x)
    t = Abs(b - y)
    a = x
    b = y
    i = i + 1
Loop

lblX = x
lblY = y
End Sub
Private Sub NR(ByVal a As Double, ByVal b As Double, er As Double)    'Newton-Rafson
Dim x As Double, y As Double, i As Integer
Dim h0 As Double, k0 As Double, Dom As Double
i = 1

h0 = er + 1
k0 = er + 1

Do Until (((Abs(h0) < er) And Abs(k0) < er) Or Canceled)
    Dom = Fx(a, b) * Gy(a, b) - Gx(a, b) * Fy(a, b)
    h0 = (-F(a, b) * Gy(a, b) + G(a, b) * Fy(a, b)) / Dom
    k0 = (-G(a, b) * Fx(a, b) + F(a, b) * Gx(a, b)) / Dom

    x = a + h0
    y = b + k0
    WriteToFG i, x, y
    a = x
    b = y
    i = i + 1
Loop
lblX = x
lblY = y
End Sub
Private Sub Command2_Click()
 Canceled = True
End Sub

Private Sub FG_Click()
Dim id As Integer
id = FG.RowSel
Dim x As Double, y As Double
x = Val(FG.TextMatrix(id, 1))
y = Val(FG.TextMatrix(id, 2))
'If Not IsNumeric(FG.Text) Then Exit Sub
If Option3.Value Then
    lAns1.Caption = "- X = " & Format$(F(x, y) - x, "0.0000000000000")
    lAns2.Caption = "- Y = " & Format$(G(x, y) - y, "0.0000000000000")
    Else
    lAns1.Caption = "= " & Format$(F(x, y), "0.00000000000000000")
    lAns2.Caption = "= " & Format$(G(x, y), "0.00000000000000000")
End If
End Sub

Private Sub Form_Load()
FGreset
Canceled = False
Set Parser = New MathExp
End Sub
Private Sub FGreset()
With FG
    FG.Clear
    .Rows = 2
    .TextMatrix(0, 0) = "n"
    .TextMatrix(0, 1) = "X"
    .TextMatrix(0, 2) = "Y"
    .TextMatrix(0, 3) = "c"
    .ColWidth(0) = 300
    .ColWidth(1) = 2000
    .ColWidth(2) = 2000
    .ColWidth(3) = 2000
End With
End Sub
Private Sub Form_Unload(Cancel As Integer)
Set pareser = Nothing
End Sub
Private Sub Option3_Click()
lAns1.Caption = "= X"
lAns2.Caption = "= Y"
End Sub
Private Sub Option4_Click()
lAns1.Caption = "= 0"
lAns2.Caption = "= 0"
End Sub
Private Sub Command3_Click()
If Me.Height <> 6450 Then
    Me.Height = 6450
    Command3.Caption = "Show Details <<"
Else
    Me.Height = 3645
    Command3.Caption = "Show Details >>"
End If
End Sub
