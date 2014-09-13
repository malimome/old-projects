VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsDate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
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
'* ClsDate.cls : Defines all Date conversion routines.
'* This file is part of the PDTPicker - Persian Date Picker.
'******************************************************************************

'TODO: Some Date calculations are still wrong every 28 years (the next is 1407)
'You can use these algortihm for now till a standard will come - or you won't need
'any Persian Date calculation in the case our calender changes to Gregorian -.

Public Enum sMode
    Mode_Year = 2
    Mode_Month = 1
    Mode_Day = 0
End Enum
Dim g_days_in_month()
Dim j_days_in_month()

Private Sub Class_Initialize()
 g_days_in_month = Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
 j_days_in_month = Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29)
End Sub
Public Function Mi2Sh(Dt As Date) As String
    Dim jy As Long, jm As Long, jd As Long
    gregorian_to_jalali jy, jm, jd, Year(Dt), Month(Dt), Day(Dt)
    
    Mi2Sh = jy & "/" & jm & "/" & jd
End Function
Public Function Sh2Mi(Dt As String) As Date
    Dim gy As Long, gm As Long, gd As Long
    Dim posd1 As Byte, posd2 As Byte
    Dim yy As Long, mm As Long, dd As Long
    
    If ErrorResume Then On Error Resume Next
    
    If Dt = "  /  /  " Then
        J2G = "1/1/2000"
    End If
    posd1 = InStr(1, Dt, "/")
    posd2 = InStr(posd1 + 1, Dt, "/")

    yy = Val(Left$(Dt, posd1 - 1))
    mm = Val(Mid$(Dt, posd1 + 1, posd2 - posd1))
    dd = Val(Right$(Dt, Len(Dt) - posd2))
    
    jalali_to_gregorian gy, gm, gd, yy, mm, dd
    
    Sh2Mi = DateSerial(gy, gm, gd)
End Function

'I have got these algorithms from farsiweb.org
' Copyright (C) 2001 Roozbeh Pournader
' Copyright (C) 2001 Mohammad Toossi
' Copyright (C) 2001 Mehrdad Sabetzadeh

' For licensing issues, contact The FarsiWeb Project Group,
' Computing Center, Sharif University of Technology,
' Tehran, Iran, or <mailto:FWPG@sharif.ac.ir>

'The main program (PDTPicker) has become free since these algorithms were used in it.
Public Sub gregorian_to_jalali(ByRef j_y As Long, ByRef j_m As Long, ByRef j_d As Long, _
                             g_y As Long, g_m As Long, g_d As Long)

    Dim gy As Long, gm As Long, gd As Long
    Dim jy As Long, jm As Long, jd As Long
    Dim g_day_no  As Long, j_day_no As Long
    Dim j_np As Long
    
    If ErrorResume Then On Error Resume Next
    
    Dim i As Long
    gy = g_y - 1600
    gm = g_m - 1
    gd = g_d - 1
    
    Dim Temp As Long
    
    Temp = 365 * 4
    Temp = Temp * 100
    Temp = Temp + 365 * 4
    
    g_day_no = 365 * gy + (gy + 3) \ 4 - (gy + 99) \ 100 + (gy + 399) \ 400
    'g_day_no = CLng(365 * gy + (gy + 3) \ 4 - (gy + 99) \ 100 + (gy + 399) \ 400)
    For i = 0 To gm - 1
        g_day_no = g_day_no + g_days_in_month(i)
    Next i
    
    If (gm > 1 And ((gy Mod 4 = 0 And gy Mod 100 <> 0) Or (gy Mod 400 = 0))) Then
       ' leap and after Feb *\
        g_day_no = g_day_no + 1
    End If
    
    g_day_no = g_day_no + gd
    
    j_day_no = g_day_no - 79
    
    j_np = j_day_no \ 12053
    j_day_no = j_day_no Mod 12053
    
    jy = 979 + 33 * j_np + 4 * (j_day_no \ 1461)
    j_day_no = j_day_no Mod 1461
    
    If (j_day_no >= 366) Then
        jy = jy + (j_day_no - 1) \ 365
        j_day_no = (j_day_no - 1) Mod 365
    End If
     
    i = 0
    While (j_day_no >= j_days_in_month(i))
        j_day_no = j_day_no - j_days_in_month(i)
        i = i + 1
        If i = 12 Then  'This part has been added by myself becouse of the wrong calculation it had.
            i = i - 1
            j_day_no = 29
            GoTo ex
        End If
    Wend
ex:
    '   for i = 0  j_day_no >= j_days_in_month(i) ++i)
    '      j_day_no = j_day_no - j_days_in_month(i)
    '   Next i
    
    jm = i + 1
    jd = j_day_no + 1
    
    j_y = jy     'byref
    j_m = jm     'byref
    j_d = jd     'byref
End Sub

Public Sub jalali_to_gregorian(ByRef g_y As Long, ByRef g_m As Long, ByRef g_d As Long, _
                             j_y As Long, j_m As Long, j_d As Long)
    Dim gy As Long, gm As Long, gd As Long
    Dim jy As Long, jm As Long, jd As Long
    Dim g_day_no As Long, j_day_no As Long
    Dim leap As Boolean
    
    Dim i As Long
    If ErrorResume Then On Error Resume Next
    
    jy = j_y - 979
    jm = j_m - 1
    jd = j_d - 1
    
    j_day_no = 365 * jy + (jy \ 33) * 8 + (jy Mod 33 + 3) \ 4
    
    For i = 0 To jm - 1
        j_day_no = j_day_no + j_days_in_month(i)
     Next i
     
    j_day_no = j_day_no + jd
    
    g_day_no = j_day_no + 79
    
    gy = 1600 + 400 * (g_day_no \ 146097) ' 146097 = 365*400 + 400\4 - 400\100 + 400\400 *\
    g_day_no = g_day_no Mod 146097
    
    leap = True
    
    If (g_day_no >= 36525) Then ' 36525 = 365*100 + 100\4 *\
        g_day_no = g_day_no - 1
        gy = gy + 100 * (g_day_no \ 36524) ' 36524 = 365*100 + 100\4 - 100\100 *\
        g_day_no = g_day_no Mod 36524
        If (g_day_no >= 365) Then
            g_day_no = g_day_no + 1
        Else
            leap = False
        End If
    End If
    
    gy = gy + 4 * (g_day_no \ 1461) ' 1461 = 365*4 + 4\4 *\
    g_day_no = g_day_no Mod 1461
    
    If (g_day_no >= 366) Then
        leap = False
        g_day_no = g_day_no - 1
        gy = gy + (g_day_no \ 365)
        g_day_no = g_day_no Mod 365
    End If
    
    i = 0
    Dim Temp As Byte
    While ((g_day_no >= g_days_in_month(i) + Temp))
    '   for (i = 0; g_day_no >= g_days_in_month(i) + (i = 1 & leap) i++)
        If (i = 1 And leap) Then Temp = 1 Else Temp = 0
        g_day_no = g_day_no - g_days_in_month(i) - Temp
        i = i + 1
        If i = 12 Then GoTo ex
    Wend
ex:
    
    gm = i + 1
    gd = g_day_no + 1
    
    g_y = gy
    g_m = gm
    g_d = gd
End Sub
'TODO:
'Public Function ValidShamsiDate(Sd As String) As Boolean
'
'End Function
'Public Function ShamsiDateDiff(Sd1 As String, Sd2 As String, Optional nMode As sMode = 0) As Long
' Calculating DateDiff for shamsi Date.
' All Date calculations are easy to calculate if we have a function to check whether a
' specified year is leap or not.
'End Function
'Public Function WeekString(TheDay As Integer)
'Select Case TheDay
'    Case vbSaturday
'        WeekString = "Saturday"
'    Case vbSunday
'        WeekString = "Sunday"
'    Case vbMonday
'        WeekString = "Monday"
'    Case vbTuesday
'        WeekString = "Tuesday"
'    Case vbWednesday
'        WeekString = "Wednesday"
'    Case vbThursday
'        WeekString = "Thursday"
'    Case vbFriday
'        WeekString = "Friday"
'End Select
'
'End Function

Public Function TWeekDay(TheDay As Date) As Integer
Select Case Weekday(TheDay)
    Case vbSaturday
        TWeekDay = 1
    Case vbSunday
        TWeekDay = 2
    Case vbMonday
        TWeekDay = 3
    Case vbTuesday
        TWeekDay = 4
    Case vbWednesday
        TWeekDay = 5
    Case vbThursday
        TWeekDay = 6
    Case vbFriday
        TWeekDay = 7
End Select
End Function

Public Function FWeekString(TheDay As Integer)
Select Case TheDay
    Case vbSaturday
        FWeekString = "‘‰»Â"
    Case vbSunday
        FWeekString = "Ìﬂ‘‰»Â"
    Case vbMonday
        FWeekString = "œÊ‘‰»Â"
    Case vbTuesday
        FWeekString = "”Â ‘‰»Â"
    Case vbWednesday
        FWeekString = "çÂ«—‘‰»Â"
    Case vbThursday
        FWeekString = "Å‰Ã‘‰»Â"
    Case vbFriday
        FWeekString = "Ã„⁄Â"
End Select

End Function

'Public Function MMonthName(Mnth As Integer)
'Select Case Mnth
'    Case 1
'        MMonthName = "January"
'    Case 2
'        MMonthName = "February"
'    Case 3
'        MMonthName = "March"
'    Case 4
'        MMonthName = "April"
'    Case 5
'        MMonthName = "May"
'    Case 6
'        MMonthName = "June"
'    Case 7
'        MMonthName = "July"
'    Case 8
'        MMonthName = "Auguest"
'    Case 9
'        MMonthName = "September"
'    Case 10
'        MMonthName = "October"
'    Case 11
'        MMonthName = "November"
'    Case 12
'        MMonthName = "December"
'End Select
'End Function

Public Function FMonthName(Mnth As Integer)
Select Case Mnth
    Case 1
        FMonthName = "›—Ê—œÌ‰"
    Case 2
        FMonthName = "«—œÌ»Â‘ "
    Case 3
        FMonthName = "Œ—œ«œ"
    Case 4
        FMonthName = " Ì—"
    Case 5
        FMonthName = "„—œ«œ"
    Case 6
        FMonthName = "‘Â—ÌÊ—"
    Case 7
        FMonthName = "„Â—"
    Case 8
        FMonthName = "¬»«‰"
    Case 9
        FMonthName = "¬–—"
    Case 10
        FMonthName = "œÌ"
    Case 11
        FMonthName = "»Â„‰"
    Case 12
        FMonthName = "«”›‰œ"
End Select
End Function

'Public Function DayOfWeek(TheDay As String)
'Select Case TheDay
'    Case "Saturday"
'        DayOfWeek = 1
'    Case "Sunday"
'        DayOfWeek = 2
'    Case "Monday"
'        DayOfWeek = 3
'    Case "Tuesday"
'        DayOfWeek = 4
'    Case "Wednesday"
'        DayOfWeek = 5
'    Case "Thursday"
'        DayOfWeek = 6
'    Case "Friday"
'        DayOfWeek = 7
'End Select
'End Function

Public Function TDaysInMonth(mMon As Integer, mYear As Integer) As Integer
Select Case mMon
  Case 1 To 6
    TDaysInMonth = 31
  Case 7 To 11
    TDaysInMonth = 30
  Case 12
    If mYear Mod 4 = 3 Then   'This is wrong but i could do nothing more
        TDaysInMonth = 30
       Else
        TDaysInMonth = 29
    End If
'    If sh2mi(mYear & "/12/31") = sh2mi(mYear + 1 & "/1/1") Then
'      TDaysInMonth = 30
'    ElseIf sh2mi(mYear & "/12/30") = sh2mi(mYear + 1 & "/1/1") Then
'      TDaysInMonth = 29
'    ElseIf sh2mi(mYear & "/12/30") = sh2mi(mYear + 1 & "/1/1") Then
'      TDaysInMonth = 29
'    End If
End Select
End Function
'Public Function TYear(TDate As Date) As Integer
'TYear = Mid(mi2sh(TDate), 1, 4)
'End Function
'Public Function TMonth(TDate As Date) As Integer
'TMonth = Mid(mi2sh(TDate), 6, 2)
'End Function
'Public Function TDay(TDate As Date) As Integer
'TDay = Mid(mi2sh(TDate), 9, 2)
'End Function
Public Function FYear(FDate As String) As Integer
'FYear = Mid(FDate, 1, 4)
If ErrorResume Then On Error Resume Next
Dim pos1 As Integer, pos2 As Integer
pos1 = InStr(1, FDate, "/")
pos2 = InStrRev(FDate, "/")

If pos1 = 5 Then
    FYear = Val(Left$(FDate, pos1 - 1))
   Else
    FYear = Val(Mid$(FDate, pos2 + 1))
End If

If FYear < 1100 Then FYear = 1100 Else If FYear > 9999 Then FYear = 9999
End Function
Public Function FMonth(FDate As String) As Integer
'FMonth = Mid(FDate, 6, 2)
If ErrorResume Then On Error Resume Next
Dim pos1 As Integer, pos2 As Integer
pos1 = InStr(1, FDate, "/")
pos2 = InStrRev(FDate, "/")
FMonth = Val(Mid$(FDate, pos1 + 1, pos2 - pos1 - 1))
If FMonth > 12 Then FMonth = 12 Else If FMonth < 1 Then FMonth = 1
End Function
Public Function FDay(FDate As String) As Integer
'FDay = Mid(FDate, 9, 2)
If ErrorResume Then On Error Resume Next
Dim pos1 As Integer, pos2 As Integer
pos1 = InStr(1, FDate, "/")
pos2 = InStrRev(FDate, "/")

If pos1 = 5 Then
    FDay = Val(Mid$(FDate, pos2 + 1))
   Else
    FDay = Val(Left$(FDate, pos1 - 1))
End If

If FDay > 31 Then FDay = 31 Else If FDay < 1 Then FDay = 1
End Function


