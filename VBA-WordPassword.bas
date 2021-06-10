Sub test()
Dim i As Long
i = 0
Dim FileName As String
Application.FileDialog(msoFileDialogOpen).Show
FileName = Application.FileDialog(msoFileDialogOpen).SelectedItems(1)
ScreenUpdating = False
Line2: On Error GoTo Line1
Documents.Open FileName, , True, , i & ""
MsgBox "Password is" & i
Application.ScreenUpdating = True
Exit Sub
Line1: i = i + 1
Resume Line2
ScreenUpdating = True
End Sub