VERSION 5.00
Object = "{3CA40DFE-4DED-4BD9-98FD-6BEEE7B69F2A}#24.0#0"; "PDTPicker.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "FDTPicker Test"
   ClientHeight    =   6210
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5745
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6210
   ScaleWidth      =   5745
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox List1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3300
      ItemData        =   "Form1.frx":0442
      Left            =   525
      List            =   "Form1.frx":04A9
      TabIndex        =   10
      Top             =   2325
      Width           =   2190
   End
   Begin VB.ListBox List2 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3300
      ItemData        =   "Form1.frx":060F
      Left            =   2850
      List            =   "Form1.frx":0676
      TabIndex        =   9
      Top             =   2325
      Width           =   2190
   End
   Begin VB.TextBox Text0 
      Height          =   315
      Left            =   2850
      TabIndex        =   7
      Top             =   1125
      Width           =   2190
   End
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   525
      TabIndex        =   6
      Top             =   5775
      Width           =   2190
   End
   Begin VB.TextBox Text2 
      Height          =   315
      Left            =   2850
      TabIndex        =   5
      Top             =   5775
      Width           =   2190
   End
   Begin PDTPicker.FDTPicker FDTPicker1 
      Height          =   315
      Left            =   1125
      TabIndex        =   4
      Top             =   600
      Width           =   3540
      _ExtentX        =   6244
      _ExtentY        =   556
      Text            =   "1383/12/01"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ShowFarsiMonth  =   0   'False
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   1170
      TabIndex        =   1
      Text            =   "Text1"
      Top             =   225
      Width           =   2220
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Close"
      Height          =   420
      Left            =   3555
      TabIndex        =   0
      Top             =   135
      Width           =   1140
   End
   Begin PDTPicker.FDTPicker FDTPicker2 
      Height          =   315
      Left            =   525
      TabIndex        =   8
      Top             =   1125
      Width           =   2190
      _ExtentX        =   3863
      _ExtentY        =   556
      Text            =   "1383/12/01"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ShowFarsiMonth  =   0   'False
   End
   Begin VB.Line Line1 
      BorderWidth     =   10
      X1              =   675
      X2              =   4875
      Y1              =   1875
      Y2              =   1875
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Shamsi Dt:"
      Enabled         =   0   'False
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
      TabIndex        =   3
      Top             =   675
      Width           =   930
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Current MD :"
      Enabled         =   0   'False
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
      Left            =   0
      TabIndex        =   2
      Top             =   270
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'******************************************************************************
'* Copyright (C) 2002-2005 Mohsen Ali Momeni - All Rights Reserved.
'*
'* This program is free software; you can redistribute it and/or modify
'* it under the terms of the GNU General Public License as published by
'* the Free Software Foundation; either version 2 of the License, or
'* (at your option) any later version.
'*
'* This program is distributed in the hope that it will be useful,
'* but WITHOUT ANY WARRANTY; without even the implied warranty of
'* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'* GNU General Public License for more details.
'*
'* You should have received a copy of the GNU General Public License
'* along with this program; if not, write to the Free Software
'* Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
'*
'* To get more information, you can mail me at: m.alimomeni@gmail.com
'* or goto my webpage at: www.momeni.us.tc
'*
'* Form1.frm: Test form for PDTPicker.
'* This file is part of the PDTPicker - Persian Date Picker.
'******************************************************************************

Private Sub Command1_Click()
Unload Me
End Sub

Private Sub Command2_Click()
FDTPicker1.About
FDTPicker1.Enabled = False
Text4.Enabled = False
End Sub

Private Sub FDTPicker1_Change()
    Text4 = FDTPicker1.MiladiDate
End Sub
Private Sub FDTPicker2_Change()
Text0.Text = FDTPicker2.Sh2Mi(FDTPicker1.Text)
End Sub

Private Sub Form_Load()
Text0 = FDTPicker2.Sh2Mi(FDTPicker1.Text)
End Sub

Private Sub List1_Click()
Text1 = FDTPicker2.Sh2Mi(List1.Text)
List2.ListIndex = List1.ListIndex
End Sub

Private Sub List2_Click()
Text2 = FDTPicker2.Mi2Sh(List2.Text)
List1.ListIndex = List2.ListIndex
End Sub
