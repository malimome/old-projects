Attribute VB_Name = "mHook"
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
'* mHook.bas : Defines Hook functions to get some global windows messages.
'* This file is part of the PDTPicker - Persian Date Picker.
'******************************************************************************

Option Explicit
Type POINTAPI
        x As Long
        y As Long
End Type

Type TMSG
    hwnd As Long
    message As Long
    wParam As Long
    lParam As Long
    time As Long
    pt As POINTAPI
End Type

Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpDest As Any, lpSource As Any, ByVal cBytes As Long)
Private Declare Function CallNextHookEx Lib "user32" (ByVal hHook As Long, ByVal nCode As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public hJournalHook As Long, hAppHook As Long
Public SHptr As Long
Public Const WM_CANCELJOURNAL = &H4B

Public Function JournalRecordProc(ByVal nCode As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
  If nCode < 0 Then
     JournalRecordProc = CallNextHookEx(hJournalHook, nCode, wParam, lParam)
     Exit Function
  End If
  ResolvePointer(SHptr).FireEvent wParam
  Call CallNextHookEx(hJournalHook, nCode, wParam, lParam)
End Function

Public Function AppHookProc(ByVal nCode As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   If nCode < 0 Then
      AppHookProc = CallNextHookEx(hAppHook, nCode, wParam, lParam)
      Exit Function
   End If
   Dim msg As TMSG
   CopyMemory msg, ByVal lParam, Len(msg)
   Select Case msg.message
       Case WM_CANCELJOURNAL
            If wParam = 1 Then ResolvePointer(SHptr).FireEvent WM_CANCELJOURNAL
   End Select
   Call CallNextHookEx(hAppHook, nCode, wParam, ByVal lParam)
End Function

Private Function ResolvePointer(ByVal lpObj&) As cSystemHook
  Dim oSH As cSystemHook
  CopyMemory oSH, lpObj, 4&
  Set ResolvePointer = oSH
  CopyMemory oSH, 0&, 4&
End Function
