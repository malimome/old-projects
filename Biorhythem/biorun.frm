VERSION 5.00
Begin VB.Form biorun 
   Appearance      =   0  'Flat
   BackColor       =   &H80000006&
   BorderStyle     =   0  'None
   Caption         =   "Biorun"
   ClientHeight    =   7770
   ClientLeft      =   -45
   ClientTop       =   -420
   ClientWidth     =   10680
   FillColor       =   &H00400000&
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   13.5
      Charset         =   178
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H0000FFFF&
   Icon            =   "biorun.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   7770
   ScaleWidth      =   10680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   WhatsThisHelp   =   -1  'True
   WindowState     =   2  'Maximized
   Begin VB.Image imglist 
      Height          =   690
      Index           =   11
      Left            =   6375
      Picture         =   "biorun.frx":000C
      Stretch         =   -1  'True
      Top             =   8700
      Visible         =   0   'False
      Width           =   690
   End
   Begin VB.Image imglist 
      Height          =   540
      Index           =   10
      Left            =   5175
      Picture         =   "biorun.frx":0606
      Stretch         =   -1  'True
      Top             =   8700
      Visible         =   0   'False
      Width           =   690
   End
   Begin VB.Image imglist 
      Height          =   690
      Index           =   9
      Left            =   4500
      Picture         =   "biorun.frx":0C00
      Stretch         =   -1  'True
      Top             =   8475
      Visible         =   0   'False
      Width           =   390
   End
   Begin VB.Image imglist 
      Height          =   615
      Index           =   8
      Left            =   3000
      Picture         =   "biorun.frx":11FA
      Stretch         =   -1  'True
      Top             =   8625
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Image imglist 
      Height          =   690
      Index           =   7
      Left            =   1500
      Picture         =   "biorun.frx":17F4
      Stretch         =   -1  'True
      Top             =   8625
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Image imglist 
      Height          =   690
      Index           =   6
      Left            =   375
      Picture         =   "biorun.frx":1DEE
      Stretch         =   -1  'True
      Top             =   8475
      Visible         =   0   'False
      Width           =   840
   End
   Begin VB.Image imglist 
      Height          =   690
      Index           =   5
      Left            =   6300
      Picture         =   "biorun.frx":23E8
      Stretch         =   -1  'True
      Top             =   7650
      Visible         =   0   'False
      Width           =   840
   End
   Begin VB.Image imglist 
      Height          =   690
      Index           =   4
      Left            =   4875
      Picture         =   "biorun.frx":29E2
      Stretch         =   -1  'True
      Top             =   7650
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Image imglist 
      Height          =   615
      Index           =   3
      Left            =   3975
      Picture         =   "biorun.frx":2FDC
      Stretch         =   -1  'True
      Top             =   7575
      Visible         =   0   'False
      Width           =   390
   End
   Begin VB.Image imglist 
      Height          =   690
      Index           =   2
      Left            =   2700
      Picture         =   "biorun.frx":35D6
      Stretch         =   -1  'True
      Top             =   7575
      Visible         =   0   'False
      Width           =   990
   End
   Begin VB.Image imglist 
      Height          =   690
      Index           =   1
      Left            =   1500
      Picture         =   "biorun.frx":3BD0
      Stretch         =   -1  'True
      Top             =   7575
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Image imglist 
      Height          =   540
      Index           =   0
      Left            =   450
      Picture         =   "biorun.frx":41CA
      Stretch         =   -1  'True
      Top             =   7650
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Image Imag 
      Height          =   750
      Index           =   0
      Left            =   14400
      MouseIcon       =   "biorun.frx":47C4
      MousePointer    =   99  'Custom
      Picture         =   "biorun.frx":4916
      ToolTipText     =   "Esc Œ—ÊÃ"
      Top             =   10650
      Width           =   750
   End
   Begin VB.Image Imag 
      Height          =   750
      Index           =   1
      Left            =   13650
      MouseIcon       =   "biorun.frx":4F10
      MousePointer    =   99  'Custom
      Picture         =   "biorun.frx":5062
      ToolTipText     =   "Backspace ›—„ ﬁ»·Ì"
      Top             =   10650
      Width           =   750
   End
   Begin VB.Image Imag 
      Height          =   750
      Index           =   2
      Left            =   12900
      MouseIcon       =   "biorun.frx":565C
      MousePointer    =   99  'Custom
      Picture         =   "biorun.frx":57AE
      ToolTipText     =   "R  —”„ „Ãœœ"
      Top             =   10650
      Width           =   750
   End
   Begin VB.Image Imag 
      Height          =   750
      Index           =   4
      Left            =   11400
      MouseIcon       =   "biorun.frx":5DA8
      MousePointer    =   99  'Custom
      Picture         =   "biorun.frx":5EFA
      ToolTipText     =   "F,Numlock ON +6      «Ì‰œÂ"
      Top             =   10650
      Width           =   750
   End
   Begin VB.Image Imag 
      Height          =   750
      Index           =   5
      Left            =   10650
      MouseIcon       =   "biorun.frx":64F4
      MousePointer    =   99  'Custom
      Picture         =   "biorun.frx":6646
      ToolTipText     =   "B,Numlock ON+4  ê–‘ Â"
      Top             =   10650
      Width           =   750
   End
   Begin VB.Image Imag 
      Height          =   750
      Index           =   3
      Left            =   12150
      MouseIcon       =   "biorun.frx":6C40
      MousePointer    =   99  'Custom
      Picture         =   "biorun.frx":6D92
      ToolTipText     =   "ç«Å"
      Top             =   10650
      Width           =   750
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Total"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000013&
      Height          =   285
      Left            =   375
      TabIndex        =   5
      ToolTipText     =   "Ê÷⁄Ì  ò·Ì"
      Top             =   615
      Width           =   495
   End
   Begin VB.Shape Shape4 
      BorderColor     =   &H80000009&
      FillColor       =   &H00404040&
      FillStyle       =   0  'Solid
      Height          =   285
      Left            =   75
      Top             =   570
      Width           =   285
   End
   Begin VB.Label test 
      AutoSize        =   -1  'True
      BackColor       =   &H00FE3F6A&
      BackStyle       =   0  'Transparent
      Caption         =   "ererwerwerwerwerwrererwewerwrwr"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H008080FF&
      Height          =   255
      Left            =   75
      TabIndex        =   4
      Top             =   10575
      Width           =   3630
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Physical"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   195
      Left            =   1095
      TabIndex        =   3
      ToolTipText     =   "Ã”„Ì"
      Top             =   615
      Width           =   585
   End
   Begin VB.Shape Shape3 
      BackColor       =   &H80000006&
      FillColor       =   &H00FF0000&
      FillStyle       =   0  'Solid
      Height          =   285
      Left            =   2805
      Top             =   570
      Width           =   285
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Emotinal"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   3120
      TabIndex        =   2
      ToolTipText     =   "«Õ”«”Ì"
      Top             =   615
      Width           =   600
   End
   Begin VB.Shape Shape2 
      BackColor       =   &H80000006&
      FillColor       =   &H00038D14&
      FillStyle       =   0  'Solid
      Height          =   285
      Left            =   780
      Top             =   570
      Width           =   285
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Intelectual"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H008080FF&
      Height          =   195
      Left            =   2040
      TabIndex        =   1
      ToolTipText     =   "›ò—Ì Ê —ÊÕÌ"
      Top             =   615
      Width           =   735
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H80000006&
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   285
      Left            =   1725
      Top             =   570
      Width           =   285
   End
   Begin VB.Label lblname 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "w"
      BeginProperty Font 
         Name            =   "Traditional Arabic"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080FF80&
      Height          =   555
      Left            =   14760
      TabIndex        =   0
      Top             =   480
      Visible         =   0   'False
      Width           =   285
   End
End
Attribute VB_Name = "biorun"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit: Dim numofday As Double
Dim pertst As Boolean: Dim nownum, negpos, gridnownum As Integer

Private Sub Form_DblClick()
  With biorun
    If .BorderStyle = 2 Then
      .WindowState = 2
      .BorderStyle = 0
     Else
      .WindowState = 0
      .BorderStyle = 2
    End If
  End With
End Sub

'Private Declare Function SetPixel Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal crColor As Long) As Long
Private Sub Form_Load()
 Dim k As Single: Dim i As Byte
  nownum = 0: gridnownum = 0: pertst = False
  For i = 0 To 5
      If Screen.Height < 8000 Then
     k = Screen.Height + 170
     Else
     k = Screen.Height
    End If
   Imag(i).Top = k - Imag(i).Height - 100
    If i = 0 Then
     k = Screen.Width - 100
     Else
     k = Imag(i - 1).Left
     End If
   Imag(i).Left = k - Imag(i).Width
  Next i
  test.Top = Screen.Height - test.Height - 300
  test.Left = 200
End Sub
Private Sub Form_Paint()
 If pertst = True Then Exit Sub
 pertst = True
'putting lines and calculating number of your longevity's days''''''''
 Call first
 Call calculatenumofday
''''''''''''''''''Drawing the graph(ploting)'''''''''''''''''''''''''''
 Dim pi, X, Y1, Y2, Y3, Yt As Double
 Dim mod23, mod28, mod33 As Byte
 mod23 = numofday Mod 23
 mod28 = numofday Mod 28
 mod33 = numofday Mod 33
 pi = 4 * Atn(1)
 DrawWidth = 2
 For X = -15 To 16 Step 0.025
   DoEvents
   Y1 = Sin((2 * pi) * (X + mod23) / 23)
     PSet (X, -Y1), 232724
     'SetPixel Me.hdc, X, -Y1, 232724
   Y2 = Sin(pi * (X + mod28) / 14)
     PSet (X, -Y2), vbBlue
     'SetPixel Me.hdc, X, -Y2, vbBlue
   Y3 = Sin((2 * pi) * (X + mod33) / 33)
     PSet (X, -Y3), vbRed
     'SetPixel Me.hdc, X, -Y3, vbRed
   Yt = (Y1 + Y2 + Y3) / 3
     PSet (X, -Yt), vbBlack
     'SetPixel Me.hdc, X, -Yt, vbBlack
 Next X
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 test = "Enjoy " & numofday & "th day of your life."
 test.ToolTipText = "«“ " & numofday & " «„Ì‰ —Ê“ ⁄„— «‰ ·–  »»—Ìœ"
End Sub
Private Sub first()
Dim i As Integer
 biorun.Visible = True
 biorun.Scale (-15, -1.3)-(15, 1.3): biorun.ForeColor = vbYellow: biorun.FontSize = 15
 CurrentX = -3: CurrentY = -1.25: Print "*** Biorhythm Gragh ***"
 biorun.FontSize = 12
 Line (-1.5, -1.15)-(2.5, -1.06), vbBlack, BF
 
 biorun.ForeColor = vbGreen: CurrentX = -1.5: CurrentY = -1.15
 If frminfo.optad.Value Then
   Print (Date + gridnownum)
  Else
   Print mi2sh(Date + gridnownum)
 End If
 biorun.CurrentX = 10.5: biorun.CurrentY = -1.13: biorun.ForeColor = vbWhite 'RGB(170, 180, 255)
 biorun.FontSize = 10: Print frminfo.txtname
 DrawWidth = 1: biorun.FontSize = 6: biorun.ForeColor = vbBlack
  
 Line (-16, -1.05)-(16, 1.05), RGB(150, 160, 255), BF
 For i = -15 To 15
    Line (i, -1.05)-(i, 1.05), RGB(160, 170, 255)
   Line (i, -0.01)-(i, 0.01), vbYellow
   Print i + gridnownum
 Next i
 For i = -10 To -100 Step -10
    Line (-15, -i / 100)-(16, -i / 100), RGB(170, 180, 255)
    Line (-0.1, -i / 100)-(0.1, -i / 100), vbYellow
    Print i
 Next i
 For i = 10 To 100 Step 10
    Line (-15, -i / 100)-(16, -i / 100), RGB(170, 180, 255)
    Line (-0.1, -i / 100)-(0.1, -i / 100), vbYellow
    Print i
 Next i
  Line (-20, 0)-(20, 0), vbYellow
 Line (0, -1.05)-(0, 1.05), vbYellow
End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
 Select Case KeyCode
  Case 102: negpos = 1: gridnownum = gridnownum + 1: Call movement
  Case 100: negpos = -1: gridnownum = gridnownum - 1: Call movement
   Case vbKeyB: negpos = -1: gridnownum = gridnownum - 1: Call movement
  Case vbKeyF: negpos = 1: gridnownum = gridnownum + 1: Call movement
  Case 37: negpos = -1: gridnownum = gridnownum - 1: Call movement
  Case 39: negpos = 1: gridnownum = gridnownum + 1: Call movement
  Case 8: Call mnuBack
  Case 36: Call mnuBack
  Case vbKeyR: Call mnurefresh
  Case 27: End
 End Select
End Sub
Private Sub movement()
  nownum = nownum + negpos
   Dim pi, X, Y1, Y2, Y3, Yt As Double
   Dim mod23, mod28, mod33 As Byte
   mod23 = numofday Mod 23
   mod28 = numofday Mod 28
   mod33 = numofday Mod 33
   pi = 4 * Atn(1)
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 DrawWidth = 1
 Call first: DrawWidth = 3
 For X = -15 To 16 Step 0.1
   Y1 = Sin((2 * pi) * (X + mod23 + nownum) / 23)
    PSet (X, -Y1), 232724
   Y2 = Sin((2 * pi) * (X + mod28 + nownum) / 28)
    PSet (X, -Y2), vbBlue
   Y3 = Sin((2 * pi) * (X + mod33 + nownum) / 33)
    PSet (X, -Y3), vbRed
   Yt = (Y1 + Y2 + Y3) / 3
    PSet (X, -Yt), vbBlack
 Next X
End Sub
Private Sub calculatenumofday()
 Dim tst As Byte: Dim i, ndfybrth, avrgyr As Long
 If frminfo.optsolar.Value = True Then
   numofday = DateDiff("d", sh2mi(TrueDate(frminfo.txtbirth)), Date, vbSunday, vbFirstJan1)
  Else
   numofday = DateDiff("d", TrueDate(frminfo.txtbirth), Date, vbSunday, vbFirstJan1)
 End If
 ''''''''''''''calculting the number of days''''''''''''''''
   ' ndfybrth = cndfy(mnthbrth, dybrth)
   ' ndfytdy = cndfy(mnthtdy, dytdy)
  ' If yrbrth <> 1380 Then
  '    avrgyr = 1380 - yrbrth - 1
  '    For i = yrbrth To 1379
  '      If i Mod 4 = 3 Then numofday = numofday + 1
  '    Next i
  '    numofday = numofday + ((avrgyr * 365) + (365 - ndfybrth) + 287)
  '    Else
  '     numofday = 287 - ndfybrth
  ' End If
  ' numofday = numofday + DateDiff("d", "2002/1/1", Date, vbSunday, vbFirstJan1)
  ' Else
  '  numofday = DateDiff("d", frminfo.txtbirth, Date, vbSunday, vbFirstJan1)
 If numofday < 0 Then
    tst = MsgBox("You haven't been born yet.Wait " & -numofday & " days and then you will be born.", vbOKOnly + vbCritical, "Not yet born")
    If tst = 1 Then
      frminfo.txtbirth = "": Call mnuBack
    End If
 End If
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
End Sub
'''calculating number of days from the beginning of year'''
'Private Function cndfy(m, d)
'  If m - 1 >= 6 Then
'   cndfy = (m - 7) * 30 + 186 + d
'   Else
'   cndfy = (m - 1) * 31 + d
'  End If
'End Function
Private Sub mnuBack()
   negpos = 0: numofday = 0: gridnownum = 0: nownum = 0
  pertst = False: biorun.Visible = False: frminfo.Visible = True: frminfo.MousePointer = 0
End Sub
Private Sub mnuexit()
 Unload biorun: Endprog
End Sub
Private Sub mnurefresh()
 biorun.Cls
 nownum = 0: gridnownum = 0: pertst = False: negpos = 0: numofday = 0
 Form_Paint
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Call caller
End Sub

Private Sub Form_Resize()
 mnurefresh
End Sub

Private Sub Form_Unload(Cancel As Integer)
frminfo.Visible = True
frminfo.MousePointer = 0
End Sub

Private Sub Imag_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
  Select Case Index
   Case 0: Call caller: Imag(0).Picture = imglist(11).Picture
   Case 1: Call caller: Imag(1).Picture = imglist(10).Picture
   Case 2: Call caller: Imag(2).Picture = imglist(9).Picture
   Case 3: Call caller: Imag(3).Picture = imglist(8).Picture
   Case 4: Call caller: Imag(4).Picture = imglist(7).Picture
   Case 5: Call caller: Imag(5).Picture = imglist(6).Picture
  End Select
End Sub
Private Sub caller()
  Call offexiter: Call offbacker: Call offrefresher: Call offprinter: Call offforwarder: Call offbackwarder
End Sub
Private Sub offexiter()
  Imag(0).Picture = imglist(5).Picture
End Sub
Private Sub offbacker()
 Imag(1).Picture = imglist(4).Picture
End Sub
Private Sub offrefresher()
 Imag(2).Picture = imglist(3).Picture
End Sub
Private Sub offprinter()
  Imag(3).Picture = imglist(2).Picture
End Sub
Private Sub offforwarder()
  Imag(4).Picture = imglist(1).Picture
End Sub
Private Sub offbackwarder()
  Imag(5).Picture = imglist(0).Picture
End Sub
Private Sub Imag_Click(Index As Integer)
  Select Case Index
   Case 0: Call mnuexit
   Case 1: Call mnuBack
   Case 2: Call mnurefresh
   Case 3
     Dim bytIsReady As Byte
     bytIsReady = MsgBox("Make sure the printer is ready", vbCritical + vbOKCancel, "Printer Check")
     If (bytIsReady = vbCancel) Then
         Call mnurefresh: Exit Sub
       Else
         Call printbiorun
     End If
   Case 4: negpos = 1: gridnownum = gridnownum + 1: Call movement
   Case 5: negpos = -1: gridnownum = gridnownum - 1: Call movement
  End Select
End Sub
Private Sub printbiorun()
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   Dim pi, X, Y1, Y2, Y3, Yt As Double
   Dim mod23, mod28, mod33 As Byte
   mod23 = numofday Mod 23
   mod28 = numofday Mod 28
   mod33 = numofday Mod 33
   pi = 4 * Atn(1)
   On Error GoTo erhan
   Printer.DrawWidth = 1
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Dim i As Integer
 Printer.Scale (-15, -1.1)-(15, 1.1): Printer.ForeColor = vbYellow: Printer.FontSize = 16
 Printer.CurrentX = -4: Printer.CurrentY = -1.2: Printer.Print "*** BIORHTHEM GRAPH ***"
   biorun.CurrentX = 10.5: biorun.CurrentY = -1.15: biorun.ForeColor = vbGreen
 biorun.FontSize = 10: Print frminfo.txtname
  Printer.DrawWidth = 1: Printer.FontSize = 6: Printer.ForeColor = vbBlack
 Printer.Line (-16, -1.05)-(16, -1.05), vbBlack
 Printer.Line (-16, 1.05)-(-16, 1.05), vbBlack
 For i = -15 To 15
   Printer.Line (i, -1.05)-(i, 1.05), RGB(160, 170, 255)
  Printer.Line (i, -0.01)-(i, 0.01), vbYellow
   Printer.Print i + gridnownum
 Next i
 For i = -10 To -100 Step -10
    Printer.Line (-15, -i / 100)-(16, -i / 100), RGB(170, 180, 255)
    Printer.Line (-0.1, -i / 100)-(0.1, -i / 100), vbYellow
    Printer.Print i
 Next i
 For i = 10 To 100 Step 10
    Printer.Line (-15, -i / 100)-(16, -i / 100), RGB(170, 180, 255)
    Printer.Line (-0.1, -i / 100)-(0.1, -i / 100), vbYellow
    Printer.Print i
 Next i
  Printer.Line (-20, 0)-(20, 0), vbYellow
 Printer.Line (0, -1.05)-(0, 1.05), vbYellow
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 Printer.DrawWidth = 4
 For X = -15 To 16 Step 0.1
   Y1 = Sin((2 * pi) * (X + mod23 + nownum) / 23)
    Printer.PSet (X, -Y1), 232724
   Y2 = Sin((2 * pi) * (X + mod28 + nownum) / 28)
    Printer.PSet (X, -Y2), vbBlue
   Y3 = Sin((2 * pi) * (X + mod33 + nownum) / 33)
    Printer.PSet (X, -Y3), vbRed
    Printer.DrawWidth = 3
       Yt = (Y1 + Y2 + Y3) / 3
   Printer.PSet (X, -Yt), vbBlack
   Printer.DrawWidth = 4
 Next X
 Printer.EndDoc
 Exit Sub
erhan:
  MsgBox ("No Printer"): Call mnurefresh
End Sub

