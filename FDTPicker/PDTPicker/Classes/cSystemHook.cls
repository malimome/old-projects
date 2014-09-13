VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cSystemHook"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
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
'* cSystemHook.cls : Defines SystemHook Functions.
'* This file is part of the PDTPicker - Persian Date Picker.
'******************************************************************************

Option Explicit
Public Event MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

Private Declare Function SetWindowsHookEx Lib "user32" Alias "SetWindowsHookExA" (ByVal idHook As Long, ByVal lpfn As Long, ByVal hmod As Long, ByVal dwThreadId As Long) As Long
Private Declare Function UnhookWindowsHookEx Lib "user32" (ByVal hHook As Long) As Long

Private Const WM_LBUTTONDOWN = &H201
Private Const WM_RBUTTONDOWN = &H204
Private Const WM_MBUTTONDOWN = &H207

Private Const WH_JOURNALRECORD = 0
Private Const WH_GETMESSAGE = 3

Private Type EVENTMSG
     wMsg As Long
     lParamLow As Long
     lParamHigh As Long
     msgTime As Long
     hWndMsg As Long
End Type

Dim EMSG As EVENTMSG

Public Function SetHook() As Boolean
   If hJournalHook = 0 Then hJournalHook = SetWindowsHookEx(WH_JOURNALRECORD, AddressOf JournalRecordProc, App.hInstance, 0)
   If hAppHook = 0 Then hAppHook = SetWindowsHookEx(WH_GETMESSAGE, AddressOf AppHookProc, App.hInstance, App.ThreadID)
   SetHook = True
End Function

Public Sub RemoveHook()
   UnhookWindowsHookEx hAppHook
   UnhookWindowsHookEx hJournalHook
   hJournalHook = 0
   hAppHook = 0
End Sub

Private Sub Class_Initialize()
  SHptr = ObjPtr(Me)
End Sub

Private Sub Class_Terminate()
  If hJournalHook Or hAppHook Then RemoveHook
End Sub

Friend Function FireEvent(ByVal lParam As Long)
  Dim i As Integer
  Dim s As String
  If lParam = WM_CANCELJOURNAL Then
     hJournalHook = 0
     SetHook
     Exit Function
  End If
  
  CopyMemory EMSG, ByVal lParam, Len(EMSG)
  Select Case EMSG.wMsg
    Case WM_LBUTTONDOWN, WM_RBUTTONDOWN, WM_MBUTTONDOWN
         i = 0
         RaiseEvent MouseDown(2 ^ ((EMSG.wMsg - 513) / 3), i, CSng(EMSG.lParamLow), CSng(EMSG.lParamHigh))
    Case Else
  End Select
End Function
