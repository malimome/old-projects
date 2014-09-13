VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmInterpol 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Interpolation"
   ClientHeight    =   2910
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7725
   Icon            =   "frmInterpol.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   2910
   ScaleWidth      =   7725
   Begin VB.TextBox txtStep 
      Height          =   285
      Left            =   2160
      TabIndex        =   15
      Text            =   "1"
      Top             =   810
      Width           =   375
   End
   Begin VB.TextBox txtFrom 
      Height          =   285
      Left            =   495
      TabIndex        =   12
      Text            =   "1"
      Top             =   810
      Width           =   375
   End
   Begin VB.TextBox txtTo 
      Height          =   285
      Left            =   1260
      TabIndex        =   11
      Text            =   "5"
      Top             =   810
      Width           =   375
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Generate X s"
      Height          =   375
      Left            =   2970
      TabIndex        =   10
      Top             =   810
      Width           =   1275
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Show Details >>"
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
      Left            =   3922
      TabIndex        =   9
      Top             =   1890
      Width           =   2400
   End
   Begin VB.TextBox txtInter 
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
      Left            =   45
      TabIndex        =   8
      Top             =   2385
      Width           =   7575
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Interpolation"
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
      Left            =   1402
      TabIndex        =   7
      Top             =   1890
      Width           =   2400
   End
   Begin VB.TextBox txtY 
      Height          =   420
      Left            =   4815
      TabIndex        =   6
      Text            =   "-2,0,7,26"
      Top             =   990
      Width           =   2760
   End
   Begin VB.TextBox txtX 
      Height          =   420
      Left            =   4815
      TabIndex        =   4
      Text            =   "-1,1,2,3"
      Top             =   585
      Width           =   2760
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
      Height          =   330
      Left            =   900
      TabIndex        =   1
      Top             =   135
      Width           =   3345
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid FG 
      Height          =   3840
      Left            =   90
      TabIndex        =   0
      Top             =   2970
      Width           =   7530
      _ExtentX        =   13282
      _ExtentY        =   6773
      _Version        =   393216
      Cols            =   3
      FixedCols       =   2
      AllowUserResizing=   1
      _NumberOfBands  =   1
      _Band(0).Cols   =   3
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000003&
      BorderWidth     =   2
      X1              =   0
      X2              =   7740
      Y1              =   1665
      Y2              =   1665
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Step"
      Height          =   195
      Left            =   1800
      TabIndex        =   16
      Top             =   855
      Width           =   330
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "To"
      Height          =   195
      Left            =   990
      TabIndex        =   14
      Top             =   855
      Width           =   195
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "From"
      Height          =   195
      Left            =   90
      TabIndex        =   13
      Top             =   855
      Width           =   345
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Y"
      Height          =   195
      Left            =   4635
      TabIndex        =   5
      Top             =   1080
      Width           =   105
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "X"
      Height          =   195
      Left            =   4635
      TabIndex        =   3
      Top             =   675
      Width           =   105
   End
   Begin VB.Label Label1 
      Caption         =   "Function:"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   180
      Width           =   660
   End
End
Attribute VB_Name = "frmInterpol"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Base 1
Option Explicit
Dim x() As Single
Dim y() As Single
Dim El As Integer     'number of vertices
Dim first As Boolean
Dim Parser As MathExp
Private Function List() As Boolean
Dim i As Integer
Dim t As Variant, s As Variant
t = Split(txtX, ",")
s = Split(txtY, ",")

If UBound(t) = UBound(s) Then
    El = UBound(s)
    Else
    MsgBox "Number of Ys should equal Xs"
    List = False
    Exit Function
End If
If El = 0 Then MsgBox "Needs more than 2 vertices": List = False: Exit Function

El = El + 1
ReDim Preserve x(1 To El)
ReDim Preserve y(1 To El)

For i = 1 To El
    x(i) = t(i - 1)
    y(i) = s(i - 1)
Next i
List = True
'El = El + 1
'
'
'If first Then
'    El = 1
'    first = False
'End If
'
'ReDim Preserve x(1 To El)
'ReDim Preserve y(1 To El)
'
'x(El) = Val(txtX)
'y(El) = Val(txtY)
End Function

Private Sub Command3_Click()
If Not List Then Exit Sub
'need more than two vertices
Dim i As Integer, j As Integer
Dim q As Single
With FG
    .Rows = El * 2
    .Cols = El + 1
    For i = 2 To El
        .TextMatrix(0, i) = "F" & (i - 1)
        .ColWidth(i) = 700
        .TextMatrix(2 * i - 3, 0) = x(i - 1)
        .TextMatrix(2 * i - 3, 1) = y(i - 1)
    Next i
    .TextMatrix(2 * El - 1, 0) = x(El)
    .TextMatrix(2 * El - 1, 1) = y(El)
    
    Dim F() As Double, Coef() As Double, Temp() As Double
    Dim Xi1 As Double, Xi2 As Double, Yi1 As Double, Yi2 As Double, position As Integer
    ReDim F(1 To El - 1)
    ReDim Coef(0 To El - 1)
    
    Dim All() As Double
    Dim N As Integer
    N = El * (El - 1) / 2
    ReDim All(1 To N)
    
    For j = 1 To El - 1   'j : number of elements in each level
        All(j) = Val(Format((y(j) - y(j + 1)) / (x(j) - x(j + 1)), "0.000"))
        WriteToFG 2 + 2 * (j - 1), 2, All(j)
    Next j
    F(1) = All(1)
    Coef(0) = Val(Format(-x(1) * F(1) + y(1), "0.000"))
    Coef(1) = F(1)
    
    Yi1 = y(1): Xi1 = x(1)
    Yi2 = y(2): Xi2 = x(2)
    
    For i = 2 To El - 1        'i : number of leveles
        For j = 1 To El - i   'j : number of elements in each level
            Xi1 = x(j): Xi2 = x(j + i)
            position = Pos(i - 1, j)
            Yi1 = All(position)
            Yi2 = All(position + 1)
            position = Pos(i, j)
            All(position) = Val(Format((Yi1 - Yi2) / (Xi1 - Xi2), "0.000"))
            If j = 1 Then F(i) = All(position)
            WriteToFG i + 2 * (j - 1) + 1, i + 1, All(position)
        Next j
        
        ReDim Temp(1 To i)
        For j = 1 To i
            Temp(j) = -x(j)
        Next j
        
        For j = 0 To i
            q = Val(Format(CoefficientKfN(Temp, i - j), "0.000"))
            Coef(j) = Coef(j) + F(i) * q
        Next j
        
    Next i
    
    txtInter = ""
    Dim Ret As String
    For i = El - 1 To 2 Step -1
        If Coef(i) = 0 Then
            DoEvents
        ElseIf Abs(Coef(i)) = 1 Then
            Ret = Ret & "X^" & i & IIf(Coef(i - 1) > 0, "+", "-")
        Else
            Ret = Ret & Coef(i) & "*X^" & i & IIf(Coef(i - 1) > 0, "+", "-")
        End If
    Next i
    If Coef(1) <> 0 Then Ret = Ret & IIf(Abs(Coef(1)) = 1, "", Abs(Coef(1)) & "*") & IIf(Coef(0) = 0, "X", "X+")
    If Coef(0) <> 0 Then Ret = Ret & Abs(Coef(0))
End With
If (Right$(Ret, 1) = "-" Or Right$(Ret, 1) = "+") Then Ret = Left$(Ret, Len(Ret) - 1)
txtInter = Replace$(Ret, "--", "-")
End Sub
Private Function Pos(i As Integer, j As Integer) As Integer
Pos = El * (El - 1) / 2 - ((El - i) * (El - i + 1) / 2) + j
End Function

Private Sub Command4_Click()
If Me.Height <> 7440 Then
    Me.Height = 7440
    Command4.Caption = "Show Details <<"
Else
    Me.Height = 3420
    Command4.Caption = "Show Details >>"
End If
End Sub

Private Sub Command5_Click()
txtX = "": txtY = ""
Dim i As Double
For i = Val(txtFrom) To Val(txtTo) - Val(txtStep) Step Val(txtStep)
    txtX = txtX & i & ","
    Parser.RemoveConstant "x"
    Parser.AddConstant "x", i
    txtY = txtY & Replace$(Format$(Parser.ParseExpression(Trim$(txtFunc)), "0.000"), ".000", "") & ","
Next i
txtX = txtX & Val(txtTo)
Parser.RemoveConstant "x"
Parser.AddConstant "x", Val(txtTo)
txtY = txtY & Replace$(Format$(Parser.ParseExpression(Trim$(txtFunc)), "0.000"), ".000", "")
End Sub

Private Sub Form_Load()
    FGreset
    El = 1
    'ReDim x(1 To 1)
    'ReDim y(1 To 1)
    first = True
    Set Parser = New MathExp
    'Parser.AddConstant "x", 0
End Sub
Private Sub FGreset()
With FG
    FG.Clear
    .Rows = 2
    .Cols = 3
    .FixedCols = 2
    .TextMatrix(0, 0) = "X"
    .TextMatrix(0, 1) = "F"
    .ColWidth(0) = 700
    .ColWidth(1) = 700
    .CellAlignment = 0
End With
End Sub
Private Sub WriteToFG(Row As Integer, Col As Integer, Val As Double)
With FG
    .TextMatrix(Row, Col) = Val
End With
DoEvents
End Sub
