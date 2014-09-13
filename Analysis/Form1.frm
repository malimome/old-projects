VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmEqSolv 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Equation Solver"
   ClientHeight    =   2655
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7155
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   2655
   ScaleWidth      =   7155
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command3 
      Cancel          =   -1  'True
      Caption         =   "Show Details >>"
      Height          =   420
      Left            =   4365
      TabIndex        =   20
      Top             =   2160
      Width           =   1680
   End
   Begin VB.Frame Frame1 
      Caption         =   "Solution Methods"
      Height          =   780
      Left            =   90
      TabIndex        =   12
      Top             =   1260
      Width           =   6945
      Begin VB.OptionButton Option1 
         Caption         =   "Bisection"
         Height          =   330
         Left            =   90
         TabIndex        =   17
         Top             =   270
         Width           =   1185
      End
      Begin VB.OptionButton Option2 
         Caption         =   "False Postion"
         Height          =   330
         Left            =   1350
         TabIndex        =   16
         Top             =   270
         Width           =   1320
      End
      Begin VB.OptionButton Option3 
         Caption         =   "SimpleRepeat"
         Height          =   330
         Left            =   2745
         TabIndex        =   15
         Top             =   270
         Width           =   1410
      End
      Begin VB.OptionButton Option4 
         Caption         =   "N.R."
         Height          =   330
         Left            =   4230
         TabIndex        =   14
         Top             =   270
         Value           =   -1  'True
         Width           =   1185
      End
      Begin VB.OptionButton Option5 
         Caption         =   "Diametric"
         Height          =   330
         Left            =   5490
         TabIndex        =   13
         Top             =   270
         Width           =   1410
      End
   End
   Begin VB.TextBox te 
      Height          =   330
      Left            =   2925
      TabIndex        =   6
      Text            =   "0.0000001"
      Top             =   675
      Width           =   1140
   End
   Begin VB.TextBox tb 
      Height          =   330
      Left            =   1485
      TabIndex        =   5
      Text            =   "3.5"
      Top             =   675
      Width           =   960
   End
   Begin VB.TextBox ta 
      Height          =   330
      Left            =   315
      TabIndex        =   4
      Text            =   "3"
      Top             =   675
      Width           =   870
   End
   Begin VB.TextBox Text1 
      Height          =   420
      Left            =   1485
      TabIndex        =   3
      Text            =   "3^cos(x/2)-1"
      Top             =   135
      Width           =   3255
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   420
      Left            =   2610
      TabIndex        =   2
      Top             =   2160
      Width           =   1680
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
      Left            =   855
      TabIndex        =   1
      Top             =   2160
      Width           =   1680
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid FG 
      Height          =   2670
      Left            =   90
      TabIndex        =   0
      Top             =   2745
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
   Begin VB.Label lblAns 
      Caption         =   "1"
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
      Left            =   4905
      TabIndex        =   19
      Top             =   765
      Width           =   2190
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Root is:"
      Height          =   195
      Left            =   4320
      TabIndex        =   18
      Top             =   765
      Width           =   540
   End
   Begin VB.Label lans 
      Caption         =   "= 0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4815
      TabIndex        =   11
      Top             =   180
      Width           =   2265
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
      TabIndex        =   10
      Top             =   225
      Width           =   1410
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
      Left            =   2700
      TabIndex        =   9
      Top             =   720
      Width           =   105
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
      Left            =   1305
      TabIndex        =   8
      Top             =   720
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
      Left            =   135
      TabIndex        =   7
      Top             =   765
      Width           =   120
   End
End
Attribute VB_Name = "frmEqSolv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Canceled As Boolean
Dim Parser As MathExp
Private Sub Command1_Click()
FGreset
Canceled = False
Select Case True
    Case Option1
        Bisection Val(ta), Val(tb), Val(te)
    Case Option2
        FalsePosition Val(ta), Val(tb), Val(te)
    Case Option3
        SimpleRepeat Val(ta), Val(tb), Val(te)
    Case Option4
        NR Val(ta), Val(tb), Val(te)
    Case Option5
        Diametric Val(ta), Val(tb), Val(te)
End Select
End Sub

Private Function F(x As Double) As Double
Parser.AddConstant "x", x
F = Parser.ParseExpression(LCase$(Text1))
Parser.RemoveConstant "x"
End Function
Private Function dF(x As Double) As Double   'Derivitation of F(x)
dF = (F(x + 0.001) - F(x)) / 0.001
End Function
Private Sub Bisection(ByVal a As Double, ByVal b As Double, er As Double)
Dim x As Double, ans As Double, i As Integer, t As Double
i = 1
t = er + 1

Do Until ((t < er) Or Canceled)
    x = (a + b) / 2
    WriteToFG i, a, b, x
    ans = F(a) * F(x)
    If ans < 0 Then
        b = x
      Else
        a = x
    End If
    t = Abs(F(x))
    i = i + 1
Loop
lblAns = x
End Sub
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
Private Sub FalsePosition(ByVal a As Double, ByVal b As Double, er As Double)
Dim x As Double, ans As Double, i As Integer, t As Double
Dim r As Byte, p As Byte: p = 1: r = 1
i = 1
t = er + 1

Do Until ((t < er) Or Canceled)
    x = (a * F(b) / p - b * F(a) / r) / (F(b) / p - F(a) / r)
    WriteToFG i, a, b, x
    ans = F(a) * F(x)
    If ans < 0 Then
        b = x
        If r = 1 Then r = r + 1
        p = 1
      Else
        a = x
        If p = 1 Then p = p + 1
        r = 1
    End If
    t = Abs(F(x))
    i = i + 1
Loop
lblAns = x
End Sub
Private Sub SimpleRepeat(ByVal a As Double, ByVal b As Double, er As Double)
Dim x As Double, i As Integer, st As Double, t As Double
i = 1: st = (a + b) / 2
t = er + 1

Do Until ((t < er) Or Canceled)
    x = F(st)
    WriteToFG i, st, x
    t = Abs(st - x)
    st = x
    i = i + 1
Loop
lblAns = x
End Sub
Private Sub NR(ByVal a As Double, ByVal b As Double, er As Double)    'Newton-Rafson
Dim x As Double, i As Integer, st As Double, t As Double
i = 1: st = (a + b) / 2
t = er + 1

Do Until ((t < er) Or Canceled)
    x = st - (F(st) / dF(st))
    WriteToFG i, st, x
    st = x
    i = i + 1
    t = Abs(F(x))
Loop
lblAns = x
End Sub
Private Sub Diametric(ByVal a As Double, ByVal b As Double, er As Double)
Dim x As Double, i As Integer, st1 As Double, st2 As Double, t As Double
i = 1: st1 = a: st2 = b
t = er + 1

Do Until ((t < er) Or Canceled)
    x = (st2 * F(st1) - st1 * F(st2)) / (F(st1) - F(st2))
    WriteToFG i, st1, st2, x
    st1 = st2
    st2 = x
    i = i + 1
    t = Abs(F(x))
Loop
lblAns = x
End Sub
Private Sub Command2_Click()
 Canceled = True
End Sub

Private Sub Command3_Click()
If Me.Height <> 6000 Then
    Me.Height = 6000
    Command3.Caption = "Show Details <<"
Else
    Me.Height = 3135
    Command3.Caption = "Show Details >>"
End If
End Sub

Private Sub FG_Click()
lans.Caption = "= " & Format$(F(Val(FG.Text)), "0.00000000000000000")
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
    .TextMatrix(0, 1) = "a"
    .TextMatrix(0, 2) = "b"
    .TextMatrix(0, 3) = "c"
    .ColWidth(0) = 300
    .ColWidth(1) = 2000
    .ColWidth(2) = 2000
    .ColWidth(3) = 2000
End With
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
Canceled = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
Set pareser = Nothing
End Sub

Private Sub Option3_Click()
lans.Caption = "= X"
End Sub
Private Sub Option4_Click()
lans.Caption = "= 0"
End Sub
Private Sub Option5_Click()
lans.Caption = "= 0"
End Sub
Private Sub Option1_Click()
lans.Caption = "= 0"
End Sub
Private Sub Option2_Click()
lans.Caption = "= 0"
End Sub
