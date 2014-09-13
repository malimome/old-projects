Attribute VB_Name = "Perm"
Option Base 1
Public Function KfN(Collec As String, K As Integer) As String
Dim Ret As String
Dim N As Integer, i As Integer, st As Integer
Dim Index() As Integer
ReDim Index(1 To K)
Dim b As Variant
b = Split(Collec, "\")
N = UBound(b) + 1
Dim a() As String
ReDim a(1 To N)
For i = 0 To N - 1
    a(i + 1) = b(i)
Next i

If K > N Then
    'KfN = Replace$(Join(a), " ", "")
    MsgBox "K more than N"
    Exit Function
End If

For i = 1 To K
    Index(i) = i
Next i

Ret = GetElem(a, Index)
st = 1
While GenNext(Index, N)
    Ret = Ret & "-" & GetElem(a, Index)
    st = st + 1
Wend

KfN = Ret
Label1 = st
End Function
Private Function GenNext(ByRef ind As Variant, N As Integer) As Boolean
Dim K As Integer
K = UBound(ind)
While (ind(1) <= N - K)
    For i = K To 1 Step -1
        If i = 1 Then
            ind(1) = ind(1) + 1
            For j = 2 To K
                ind(j) = ind(j - 1) + 1
            Next j
            GenNext = True
            Exit Function
        End If
        
        If (ind(i) >= N - (K - i)) And Not (ind(i - 1) >= N - (K - i + 1)) Then
            ind(i - 1) = ind(i - 1) + 1
            For j = i To K
                ind(j) = ind(j - 1) + 1
            Next j
            GenNext = True
            Exit Function
         ElseIf (ind(i) >= N - (K - i)) And (ind(i - 1) >= N - (K - i + 1)) Then
            '
         Else
            ind(i) = ind(i) + 1
            GenNext = True
            Exit Function
        End If
    Next i
Wend
GenNext = False
End Function
Private Function GetElem(ByRef a As Variant, ByRef ind As Variant) As String
Dim Res As String, i As Integer
'On Error Resume Next
For i = 1 To UBound(ind)
    Res = Res & a(ind(i))
Next i
GetElem = Res
End Function

''''''''''for numbers''''''''''''''

Public Function CoefficientKfN(Collec As Variant, K As Integer) As Single
Dim Ret As Single
Dim N As Integer, i As Integer, st As Integer
Dim Index() As Integer

If K = 0 Then
    CoefficientKfN = 1
    Exit Function
End If

ReDim Index(1 To K)
N = UBound(Collec)

If K > N Then
    'MultiKfN =
    'Exit Function
End If

For i = 1 To K
    Index(i) = i
Next i

Ret = MultipElem(Collec, Index)
st = 1
While GenNext(Index, N)
    Ret = Ret + MultipElem(Collec, Index)
    st = st + 1
Wend

CoefficientKfN = Ret
End Function
Private Function MultipElem(ByRef a As Variant, ByRef ind As Variant) As String
Dim Res As Single, i As Integer
'On Error Resume Next
Res = 1
For i = 1 To UBound(ind)
    Res = Res * a(ind(i))
Next i
MultipElem = Res
End Function

