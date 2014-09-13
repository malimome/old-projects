VERSION 5.00
Begin VB.Form winbiorun 
   BackColor       =   &H00FCDAD8&
   Caption         =   "Form1"
   ClientHeight    =   8055
   ClientLeft      =   60
   ClientTop       =   435
   ClientWidth     =   10875
   LinkTopic       =   "Form1"
   ScaleHeight     =   8055
   ScaleWidth      =   10875
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picgrph 
      BackColor       =   &H00000000&
      ForeColor       =   &H00004040&
      Height          =   6390
      Left            =   900
      ScaleHeight     =   6330
      ScaleWidth      =   9105
      TabIndex        =   0
      Top             =   900
      Width           =   9165
   End
End
Attribute VB_Name = "winbiorun"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim numofday As Double
Dim pertst As Boolean

Private Sub Form_DblClick()
 Unload Me
 biorun.Visible = True
End Sub

Private Sub Form_Load()
 pertst = False
End Sub

Private Sub picgrph_DblClick()
 Unload Me
 biorun.Visible = True
End Sub

Private Sub picgrph_Paint()
 If pertst = True Then Exit Sub
   pertst = True
  Call first
  Call calculatenumofday
 Dim pi, X, Y1, y2, y3, yt As Double
 Dim mod23, mod28, mod33 As Byte
 mod23 = numofday Mod 23
 mod28 = numofday Mod 28
 mod33 = numofday Mod 33
 pi = 4 * Atn(1)
 picgrph.DrawWidth = 1
 For X = -15 To 16 Step 0.03
   Y1 = Sin((2 * pi) * (X + mod23) / 23)
    picgrph.PSet (X, -Y1), 232724
   y2 = Sin(pi * (X + mod28) / 14)
    picgrph.PSet (X, -y2), vbBlue
   y3 = Sin((2 * pi) * (X + mod33) / 33)
    picgrph.PSet (X, -y3), vbRed
   yt = (Y1 + y2 + y3) / 3
    picgrph.PSet (X, -yt), vbYellow
 Next X
End Sub
Private Sub first()
Dim i As Integer
 picgrph.Scale (-15, -1.2)-(15, 1.2)
 picgrph.DrawWidth = 1
 For i = -15 To 15
    picgrph.Line (i, -1.1)-(i, 1.1), RGB(40, 50, 70)
   picgrph.Line (i, -0.01)-(i, 0.01), RGB(50, 70, 20)
   picgrph.Print i '+ gridnownum
 Next i
 For i = -10 To -100 Step -10
    picgrph.Line (-15, -i / 100)-(16, -i / 100), RGB(40, 50, 70)
    picgrph.Line (-0.1, -i / 100)-(0.1, -i / 100), RGB(50, 70, 20)
    picgrph.Print i
 Next i
 For i = 10 To 100 Step 10
    picgrph.Line (-15, -i / 100)-(16, -i / 100), RGB(40, 50, 70)
    picgrph.Line (-0.1, -i / 100)-(0.1, -i / 100), RGB(50, 70, 20)
    picgrph.Print i
 Next i
  picgrph.Line (-20, 0)-(20, 0), RGB(40, 70, 20)
 picgrph.Line (0, -1.1)-(0, 1.1), RGB(50, 70, 20)
End Sub
Private Sub calculatenumofday()
 Dim tst As Byte: Dim ndfybrth, avrgyr As Long: Dim i As Integer
 If frminfo.optsolar.Value = True Then
''''''''''''''calculting the number of days''''''''''''''''
   ndfybrth = cndfy(mnthbrth, dybrth)
  If yrbrth <> 1380 Then
    avrgyr = 1380 - yrbrth - 1
    For i = yrbrth To 1379
      If i Mod 4 = 3 Then numofday = numofday + 1
    Next i
    numofday = numofday + ((avrgyr * 365) + (365 - ndfybrth) + 287)
    Else
    numofday = 287 - ndfybrth
   End If
   numofday = numofday + DateDiff("d", "2002/1/1", Date, vbSunday, vbFirstJan1)
  Else
  numofday = DateDiff("d", frminfo.txtbirth, Date, vbSunday, vbFirstJan1)
  End If
  If numofday < 0 Then
   tst = MsgBox("You must have entered a not-allowed DATE.", vbOKOnly + vbCritical, "Error")
    If tst = 1 Then
     frminfo.txtbirth = "": Call mnuBack
    End If
  End If
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
End Sub
Private Sub mnuBack()
  numofday = 0 ' negpos = 0: : gridnownum = 0: nownum = 0
  pertst = False:
  biorun.Visible = False: frminfo.Visible = True
End Sub
Private Function cndfy(m, d)
  If m - 1 >= 6 Then
   cndfy = (m - 7) * 30 + 186 + d
   Else
   cndfy = (m - 1) * 31 + d
  End If
End Function
