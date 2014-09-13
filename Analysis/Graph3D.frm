VERSION 5.00
Object = "{FE0065C0-1B7B-11CF-9D53-00AA003C9CB6}#1.1#0"; "COMCT232.OCX"
Begin VB.Form frmGraph3D 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Plotting f(x,y) Functions"
   ClientHeight    =   5640
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   9555
   ForeColor       =   &H00000000&
   Icon            =   "Graph3D.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   5640
   ScaleWidth      =   9555
   Begin VB.CommandButton CmdMenu 
      Caption         =   ".."
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   161
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   900
      TabIndex        =   21
      Top             =   3240
      Width           =   255
   End
   Begin VB.TextBox Data 
      Height          =   285
      Index           =   1
      Left            =   780
      MaxLength       =   10
      TabIndex        =   14
      Top             =   1020
      Width           =   1215
   End
   Begin VB.TextBox Data 
      Height          =   285
      Index           =   2
      Left            =   2700
      MaxLength       =   10
      TabIndex        =   13
      Top             =   1020
      Width           =   1215
   End
   Begin VB.TextBox Data 
      Height          =   285
      Index           =   3
      Left            =   780
      MaxLength       =   10
      TabIndex        =   12
      Top             =   1380
      Width           =   1215
   End
   Begin VB.TextBox Data 
      Height          =   285
      Index           =   4
      Left            =   2700
      MaxLength       =   10
      TabIndex        =   11
      Top             =   1380
      Width           =   1215
   End
   Begin VB.TextBox Data 
      Height          =   285
      Index           =   5
      Left            =   3060
      TabIndex        =   10
      Top             =   1740
      Width           =   855
   End
   Begin VB.TextBox Data 
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   7
      Left            =   2655
      Locked          =   -1  'True
      MaxLength       =   10
      MousePointer    =   1  'Arrow
      TabIndex        =   9
      Top             =   2580
      Width           =   975
   End
   Begin VB.TextBox Data 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   6
      Left            =   975
      Locked          =   -1  'True
      MaxLength       =   10
      MousePointer    =   1  'Arrow
      TabIndex        =   8
      Top             =   2625
      Width           =   975
   End
   Begin VB.TextBox Code 
      Height          =   285
      Left            =   1020
      TabIndex        =   3
      Text            =   "(Cos(X) ^ 2 + Sin(Y) ^ 2)"
      Top             =   180
      Width           =   3135
   End
   Begin VB.CommandButton CommandDraw 
      Caption         =   "Draw Function"
      Height          =   375
      Left            =   1575
      MaskColor       =   &H00FFFFFF&
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   3975
      Width           =   1455
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000018&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9.75
         Charset         =   161
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   4950
      Left            =   4425
      MousePointer    =   2  'Cross
      ScaleHeight     =   326
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   326
      TabIndex        =   0
      Top             =   150
      Width           =   4950
   End
   Begin ComCtl2.UpDown GraphScale 
      Height          =   285
      Left            =   2820
      TabIndex        =   19
      Top             =   3180
      Width           =   240
      _ExtentX        =   450
      _ExtentY        =   503
      _Version        =   327681
      Value           =   100
      Increment       =   5
      Max             =   50000
      Min             =   -50000
      Enabled         =   -1  'True
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      Caption         =   "Color Mode"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   161
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   1260
      TabIndex        =   22
      Top             =   3180
      Width           =   1170
   End
   Begin VB.Label Label13 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Scale"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   161
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   3120
      TabIndex        =   20
      Top             =   3180
      Width           =   540
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "< X <"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   161
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   2040
      TabIndex        =   18
      Top             =   1020
      Width           =   585
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "< Y <"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   161
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   2040
      TabIndex        =   17
      Top             =   1380
      Width           =   555
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      Caption         =   "Resolution:"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   161
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   1740
      TabIndex        =   16
      Top             =   1740
      Width           =   1170
   End
   Begin VB.Label Label11 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "< Z <"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   161
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   1980
      TabIndex        =   15
      Top             =   2580
      Width           =   555
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H8000000F&
      BorderColor     =   &H00E0E0E0&
      Height          =   420
      Left            =   840
      Top             =   2520
      Width           =   2865
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   8160
      TabIndex        =   7
      Top             =   5235
      Width           =   60
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Ö: "
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   161
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   7800
      TabIndex        =   6
      Top             =   5220
      Width           =   330
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   5880
      TabIndex        =   5
      Top             =   5235
      Width           =   60
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "È: "
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   161
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   5520
      TabIndex        =   4
      Top             =   5220
      Width           =   315
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   " Z(X,Y)="
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   120
      TabIndex        =   2
      Top             =   180
      Width           =   855
   End
   Begin VB.Menu MenuColorMode 
      Caption         =   "Colors"
      Index           =   0
      Visible         =   0   'False
      Begin VB.Menu MenuColorModeItem 
         Caption         =   "Grid"
         Checked         =   -1  'True
         Index           =   1
      End
      Begin VB.Menu MenuColorModeItem 
         Caption         =   "Lines"
         Index           =   2
      End
      Begin VB.Menu MenuColorModeItem 
         Caption         =   "Colors"
         Index           =   3
      End
      Begin VB.Menu MenuColorModeItem 
         Caption         =   "Rnd Colors"
         Index           =   4
      End
   End
End
Attribute VB_Name = "frmGraph3D"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type POINTAPI
    X As Long
    Y As Long
End Type
Private Declare Function Polygon Lib "gdi32" (ByVal hdc As Long, lpPoint As POINTAPI, ByVal nCount As Long) As Long

Dim qx, qy, qz, nx, ny, nz
Dim phi, thi
Dim Ln(5, 6)
Dim Surface() As Single
Dim Value(1 To 7) As Single                   'Xmin,Xmax,Ymin,Ymax,Resolution,Zmin,Zmax
Dim ValueError As Boolean

Private Sub Form_Load()

  Value(1) = -1                    'Xmin
  Value(2) = 1                     'Xmax
  Value(3) = -1                    'Ymin
  Value(4) = 1                     'Ymax
  Value(5) = 12                      'Resolution

  For m = 1 To 5
    Data(m).Text = Value(m)
  Next

  Picture1.Enabled = False
  FixWindowAndAxiesCoordinates

  thi = -25
  phi = 105
    
  DrawAxies

End Sub
Private Sub FixWindowAndAxiesCoordinates()

  Picture1.Width = 4950
  Picture1.Height = 4950
  Picture1.ScaleMode = 3

  
  kx = 0
  ky = 0
  kz = 0
  xmin = -153
  xmax = 153
  ymin = -153
  ymax = 153
  zmin = -153
  zmax = 153

  '          xa             ya             za             xt               yt             zt
  Ln(0, 1) = kx: Ln(0, 2) = ky: Ln(0, 3) = kz: Ln(0, 4) = xmin: Ln(0, 5) = ky: Ln(0, 6) = kx
  Ln(1, 1) = kx: Ln(1, 2) = ky: Ln(1, 3) = kz: Ln(1, 4) = xmax: Ln(1, 5) = ky: Ln(1, 6) = kx
  Ln(2, 1) = kx: Ln(2, 2) = ky: Ln(2, 3) = kz: Ln(2, 4) = kx: Ln(2, 5) = ymin: Ln(2, 6) = ky
  Ln(3, 1) = kx: Ln(3, 2) = ky: Ln(3, 3) = kz: Ln(3, 4) = kx: Ln(3, 5) = ymax: Ln(3, 6) = ky
  Ln(4, 1) = kx: Ln(4, 2) = ky: Ln(4, 3) = kz: Ln(4, 4) = kx: Ln(4, 5) = ky: Ln(4, 6) = zmin
  Ln(5, 1) = kx: Ln(5, 2) = ky: Ln(5, 3) = kz: Ln(5, 4) = kx: Ln(5, 5) = ky: Ln(5, 6) = zmax

End Sub

Sub CenteringFunctionCoefficients()
                                             'Centering function's spots coeficients (declared public)
  On Error Resume Next
  qx = (150 / (Value(2) - Value(1)))
  qy = (150 / (Value(4) - Value(3)))
  qz = (150 / (Value(7) - Value(6)))
  nx = (Value(2) - (-Value(1))) / 8
  ny = (Value(4) - (-Value(3))) / 8
  nz = (Value(7) - (-Value(6))) / 8
End Sub

Sub GetCoordinates()

  On Error Resume Next
  
  Xstp = (Value(2) - Value(1)) / Value(5)
  Ystp = (Value(4) - Value(3)) / Value(5)

  For Y = Value(3) To Value(4) Step Ystp
    For X = Value(1) To Value(2) Step Xstp
     If zmin! > Z(X, Y) Then zmin = Z(X, Y)
     If zmax! < Z(X, Y) Then zmax = Z(X, Y)
    Next
  Next
  
  Value(6) = zmin
  Data(6).Text = Format(zmin, "0.###")
  Value(7) = zmax
  Data(7).Text = Format(zmax, "0.###")
End Sub
Sub GetFunctionSpots()

  On Error Resume Next
  
  Xstp = (Value(2) - Value(1)) / Value(5)
  Ystp = (Value(4) - Value(3)) / Value(5)
  
  ReDim Surface((Value(5) ^ 2 - 1), 16)

  Me.MousePointer = 11
  Picture1.MousePointer = 11
  
  For Y = Value(3) To (Value(4) - Ystp) Step Ystp
    For X = Value(1) To (Value(2) - Xstp) Step Xstp

    Surface(k, 0) = (X - nx) * qx
    Surface(k, 1) = (Y - ny) * qy
    Surface(k, 2) = (Z(X, Y) - nz) * qz
    
    Surface(k, 3) = Surface(k, 0)
    Surface(k, 4) = (Y + Ystp - ny) * qy
    Surface(k, 5) = (Z(X, Y + Ystp) - nz) * qz
    
    Surface(k, 6) = (X + Xstp - nx) * qx
    Surface(k, 7) = Surface(k, 4)
    Surface(k, 8) = (Z(X + Xstp, Y + Ystp) - nz) * qz
   
    Surface(k, 9) = Surface(k, 6)
    Surface(k, 10) = Surface(k, 1)
    Surface(k, 11) = (Z(X + Xstp, Y) - nz) * qz

    
    Surface(k, 12) = (X + (Xstp / 2) - nx) * qx
    Surface(k, 13) = (Y + (Ystp / 2) - ny) * qy
    Surface(k, 14) = (Z(X + (Xstp / 2), Y + (Ystp / 2)) - nz) * qz

        
    If MenuColorModeItem(2).Checked = True Then
       If X = Value(1) Then Surface(k, 16) = 1
       If X > Value(2) - 2 * Xstp Then Surface(k, 16) = 2
    End If

    If MenuColorModeItem(4).Checked = True Then
       Surface(k, 16) = RGB(Abs(Surface(k, 14)) * 3 Mod 255, Abs(Surface(k, 14)) * 2 Mod 255, Abs(Surface(k, 14)) * 5 Mod 255)
    End If
        
    If MenuColorModeItem(3).Checked = True Then
       Select Case Surface(k, 14)
         Case Is < -90: Surface(k, 16) = &HE26370
         Case -90 To -60: Surface(k, 16) = &H8AE785
         Case -60 To -30: Surface(k, 16) = &HBAD573
         Case -30 To 0: Surface(k, 16) = &HE1D188
         Case 0 To 30: Surface(k, 16) = &HECE3BB
         Case 30 To 60: Surface(k, 16) = &HE06BB1
         Case 60 To 90: Surface(k, 16) = &H77DCEA
         Case Is > 90: Surface(k, 16) = &H1ABBEA
       End Select
    End If
    
    k = k + 1
    
    Next
  Next

  Me.MousePointer = 0
  Picture1.MousePointer = 0

End Sub

Sub DrawAxies()

   Picture1.ForeColor = 0

   For al = 0 To 5
  
    xwa = Ln(al, 1)
    ywa = Ln(al, 2)
    zwa = Ln(al, 3)

    xwt = Ln(al, 4)
    ywt = Ln(al, 5)
    zwt = Ln(al, 6)

    TransPlot xwa, ywa, zwa, thi, phi, xsa, ysa
    TransPlot xwt, ywt, zwt, thi, phi, xst, yst

    Picture1.DrawStyle = 2
    Picture1.Line (xsa, ysa)-(xst, yst), vbBlue
    Picture1.DrawStyle = 0

    Picture1.CurrentX = xst
    Picture1.CurrentY = yst
  
    Select Case al
      Case Is = 0: Picture1.Print "X"
      Case Is = 3: Picture1.Print "Y"
      Case Is = 5: Picture1.Print "Z"
    End Select
  
  Next
End Sub

Sub DrawFunction()
  
  Dim Fl(1 To 8) As POINTAPI
  
  Me.MousePointer = 11
  Picture1.MousePointer = 11
                                
  For k = 0 To UBound(Surface, 1)
     xk = Surface(k, 12)
     yk = Surface(k, 13)
     zk = Surface(k, 14)

     th = (thi * 3.14) / 180: ph = (phi * 3.14) / 180
     Surface(k, 15) = -Sin(ph) * Cos(th) * xk - Sin(ph) * Sin(th) * yk - Cos(ph) * zk
  Next
                                     
t1:
  a = 0: p = 1
t2:
  If Surface(a, 15) > Surface(p, 15) Then
    For k = 0 To (UBound(Surface, 2))
      r = Surface(a, k)
      Surface(a, k) = Surface(p, k)
      Surface(p, k) = r
    Next: Flag = 1
  End If
  p = p + 1
  a = a + 1
  If p <= (UBound(Surface, 1)) Then GoTo t2
  If Flag = 1 Then Flag = 0: GoTo t1
   
    
    
                                  
  Picture1.Cls
  DrawAxies

  
  For k = 0 To UBound(Surface, 1)
    
    xw1 = Surface(k, 0)
    yw1 = Surface(k, 1)
    zw1 = Surface(k, 2)
    
    xw2 = Surface(k, 3)
    yw2 = Surface(k, 4)
    zw2 = Surface(k, 5)
    
    xw3 = Surface(k, 6)
    yw3 = Surface(k, 7)
    zw3 = Surface(k, 8)
   
    xw4 = Surface(k, 9)
    yw4 = Surface(k, 10)
    zw4 = Surface(k, 11)
    
        
    TransPlot xw1, yw1, zw1, thi, phi, Xs1, Ys1
    TransPlot xw2, yw2, zw2, thi, phi, Xs2, Ys2
    TransPlot xw3, yw3, zw3, thi, phi, Xs3, Ys3
    TransPlot xw4, yw4, zw4, thi, phi, Xs4, Ys4
  
  
   If MenuColorModeItem(3).Checked = True Or MenuColorModeItem(4).Checked = True Then Picture1.ForeColor = &HC0C0C0
   If MenuColorModeItem(1).Checked = True Then Picture1.ForeColor = 0
   If MenuColorModeItem(2).Checked = True Then Picture1.ForeColor = &HECE3BB
  
    Fl(1).X = Xs1
    Fl(1).Y = Ys1
    Fl(2).X = Xs2
    Fl(2).Y = Ys2
 
    Fl(3).X = Xs2
    Fl(3).Y = Ys2
    Fl(4).X = Xs3
    Fl(4).Y = Ys3
 
    Fl(5).X = Xs3
    Fl(5).Y = Ys3
    Fl(6).X = Xs4
    Fl(6).Y = Ys4
 
    Fl(7).X = Xs4
    Fl(7).Y = Ys4
    Fl(8).X = Xs1
    Fl(8).Y = Ys1
 
                                                 
    Picture1.FillStyle = vbFSSolid
    
    If MenuColorModeItem(1).Checked = True Then Picture1.FillColor = &HE0E0E0
    If MenuColorModeItem(3).Checked = True Or MenuColorModeItem(4).Checked = True Then Picture1.FillColor = Surface(k, 16)
    If MenuColorModeItem(2).Checked = True Then Picture1.FillColor = &HECE3BB   '&HFDE6E7
       
    Polygon Picture1.hdc, Fl(1), 8
    
    If MenuColorModeItem(2).Checked = True Then
      If Surface(k, 16) = 1 Then Picture1.Line (Xs1, Ys1)-(Xs2, Ys2), QBColor(8)
      If Surface(k, 16) = 2 Then Picture1.Line (Xs3, Ys3)-(Xs4, Ys4), QBColor(8)
      Picture1.Line (Xs2, Ys2)-(Xs3, Ys3), QBColor(8)
      Picture1.Line (Xs4, Ys4)-(Xs1, Ys1), QBColor(8)
    End If
        
  Next
  
  Me.MousePointer = 0
  Picture1.MousePointer = 0

End Sub

Private Sub CommandDraw_Click()
  If CheckValues = 1 Then Exit Sub
  GetCoordinates
  If ErrorInfo = -1 Then MsgBox "Parse Error": Exit Sub
  CenteringFunctionCoefficients
  GetFunctionSpots
  Picture1.Enabled = True
  DrawFunction
End Sub

Private Sub picture1_Mousemove(Button As Integer, Shift As Integer, X As Single, Y As Single)

  If Button = 1 Then
    
    thi = CInt(X - Picture1.ScaleWidth + 360)
    phi = CInt(Picture1.ScaleWidth - Y - 360)
  
    Label1.Caption = thi
    Label2.Caption = phi
 
    DrawFunction
  
  End If

End Sub

Private Sub Command1_Click()
  Unload Me
End Sub

Private Sub GraphScale_Change()
  DrawFunction
End Sub

Private Sub TransPlot(xw, yw, zw, thi, phi, xs, ys)
  th = (thi * 3.14) / 180: ph = (phi * 3.14) / 180
  xs = (-Sin(th) * xw + Cos(th) * yw)
  ys = (-Cos(ph) * Cos(th) * xw - Cos(ph) * Sin(th) * yw + Sin(ph) * zw)
                                        
xs = GraphScale.Value / 100 * xs + 163
ys = GraphScale.Value / 100 * ys + 163

End Sub

Function CheckValues()
  On Error Resume Next
  For Index = 1 To 5
     Value(Index) = GetValue(Data(Index).Text)
     If ValueError Then MsgBox "Wrong value", 16: CheckValues = 1: Exit Function
  Next
  If Value(1) = Value(2) Or Value(1) > Value(2) Then MsgBox " Maximum 'X' Must be Greater than Minimum 'X'", 16: CheckValues = 1
  If Value(3) = Value(4) Or Value(3) > Value(4) Then MsgBox " Maximum 'Y' Must be Greater than Minimum 'Y'", 16: CheckValues = 1
  If Value(5) < 1 Then MsgBox "Resolution Must be Greater than '1'", 16: CheckValues = 1
End Function

Function GetValue(StringValue)
  Dim Index, Counter
  ValueError = False
  For Index = 1 To Len(StringValue)
    If Mid(StringValue, Index, 1) Like "[!0-9,.-]" Then ValueError = True: Exit Function
    If Mid(StringValue, Index, 1) = "-" And Index <> 1 Then ValueError = True: Exit Function
    If Mid(StringValue, Index, 1) Like "[,.]" Then Counter = Counter + 1
    If Counter > 1 Then ValueError = True: Exit Function
  Next
  position = InStr(1, StringValue, ",")
  If position <> 0 Then
      GetValue = Val(Left(StringValue, position - 1) + "." + Right(StringValue, Len(StringValue) - position))
  Else
      GetValue = Val(StringValue)
  End If
End Function

Private Sub CmdMenu_Click()
  PopupMenu MenuColorMode(0)
End Sub

Private Sub MenuColorModeItem_Click(Index As Integer)
  For i = 1 To 4
    MenuColorModeItem(i).Checked = False
  Next
  MenuColorModeItem(Index).Checked = True
End Sub

Function Z(X, Y)
  Z = Parser(Code.Text, X, Y)
End Function

  'Z = (Cos(X) ^ 2 + Sin(Y) ^ 2)
  ' Z = Sqr(1 - X ^ 2 - Y ^ 2)
  'Z = (X ^ 2 - Y ^ 2)
  'Z = Sin(2 * X ^ 2 + 3 * Y ^ 2) / (X ^ 2 + Y ^ 2)
  'Z = Cos(X * Y)


