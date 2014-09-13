VERSION 5.00
Begin VB.Form frmhelp 
   BackColor       =   &H00F9E8EC&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Help"
   ClientHeight    =   7500
   ClientLeft      =   45
   ClientTop       =   420
   ClientWidth     =   7950
   Icon            =   "frmhelp.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   7500
   ScaleWidth      =   7950
   StartUpPosition =   2  'CenterScreen
   Begin VB.OptionButton opteng 
      BackColor       =   &H00F9E8EC&
      Caption         =   "English"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Left            =   1275
      MouseIcon       =   "frmhelp.frx":0442
      MousePointer    =   99  'Custom
      TabIndex        =   4
      Top             =   225
      Width           =   1140
   End
   Begin VB.OptionButton optfar 
      BackColor       =   &H00F9E8EC&
      Caption         =   "Farsi"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Left            =   300
      MouseIcon       =   "frmhelp.frx":0594
      MousePointer    =   99  'Custom
      TabIndex        =   3
      Top             =   225
      Value           =   -1  'True
      Width           =   915
   End
   Begin VB.CommandButton cmdok 
      BackColor       =   &H00FFC0C0&
      Caption         =   "OK"
      Height          =   390
      Left            =   6225
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   225
      Width           =   1215
   End
   Begin VB.PictureBox perpic 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      Height          =   13305
      Left            =   0
      ScaleHeight     =   13245
      ScaleWidth      =   7665
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   825
      Width           =   7725
   End
   Begin VB.VScrollBar scr 
      Height          =   7515
      LargeChange     =   110
      Left            =   7725
      Max             =   60
      TabIndex        =   1
      Top             =   0
      Width           =   240
   End
   Begin VB.Image Image2 
      Height          =   465
      Left            =   4725
      Picture         =   "frmhelp.frx":06E6
      Stretch         =   -1  'True
      Top             =   150
      Visible         =   0   'False
      Width           =   690
   End
   Begin VB.Image Image1 
      Height          =   390
      Left            =   3525
      Picture         =   "frmhelp.frx":1BFD6
      Stretch         =   -1  'True
      Top             =   225
      Visible         =   0   'False
      Width           =   615
   End
End
Attribute VB_Name = "frmhelp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
 Dim diffofvl, i As Integer
Private Sub cmdok_Click()
  Unload frmhelp
End Sub
Private Sub Form_Load()
  perpic.Picture = Image1.Picture
End Sub
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  i = 0: cmdok_Click
End Sub


Private Sub opteng_Click()
  optfar.Value = False: perpic.Picture = Image2.Picture
End Sub
Private Sub optfar_Click()
opteng.Value = False: perpic.Picture = Image1.Picture
End Sub
Private Sub scr_Change()
  diffofvl = scr.Value - i
  perpic.Top = perpic.Top - scr.LargeChange * diffofvl
  cmdOK.Top = cmdOK.Top - scr.LargeChange * diffofvl
  opteng.Top = opteng.Top - scr.LargeChange * diffofvl
  optfar.Top = optfar.Top - scr.LargeChange * diffofvl
  i = scr.Value
End Sub
Private Sub optfar_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Call offer
   optfar.FontUnderline = True: optfar.ForeColor = vbBlue
End Sub
Private Sub opteng_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Call offer
   opteng.FontUnderline = True: opteng.ForeColor = vbBlue
End Sub
Private Sub offer()
  optfar.FontUnderline = False: optfar.ForeColor = vbBlack
  opteng.FontUnderline = False: opteng.ForeColor = vbBlack
End Sub
Private Sub perpic_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Call offer
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
 Call offer
End Sub
