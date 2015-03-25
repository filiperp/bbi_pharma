Sub macro()

    Range("A3").Select
    Range(Selection, Selection.End(xlDown)).Select
    
'deletando linhas

    Selection.EntireRow.Delete
      
' achando_ultima_linha Macro

    
    Selection.End(xlDown).Select
    Selection.End(xlDown).Select
    Selection.End(xlDown).Select
    Range("C1048576").Select
    Selection.End(xlUp).Select
    
' copiando_praca Macro

    Range("A2").Select
    Selection.Copy

' achando_ultima_linha Macro

    Selection.End(xlDown).Select
    Selection.End(xlDown).Select
    Selection.End(xlDown).Select
    Range("C1048576").Select
    Selection.End(xlUp).Select

'Deletando linha 1'
    Range("A1").Select
    Selection.EntireRow.Delete
    
    
'Inserindo Praça

    Range("B3").Select
    Selection.EntireColumn.Insert
    ActiveCell.FormulaR1C1 = "Praça"


' ate_fim Macro
  
    Range("a1").Copy
    Selection.End(xlDown).Select
    Range("C1048576").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(0, -1).Select
    Range(ActiveCell, "b5").Select
    ActiveSheet.Paste

'Deletando linha 1 e 2'

    Range("A1:A2").Select
    Selection.EntireRow.Delete


'------------------------------------------------------------------------------------------------'

'renomear sheet inicial do arquivo que sai do MW

    ActiveSheet.Name = "Dados"

'criar aba nova para transpose
    
    Sheets.Add After:=ActiveSheet
    ActiveSheet.Name = "Transpose"
    Range("A1").Select

'copiar cabeçalho página inicial
    
    Sheets("Dados").Select
    Range(Cells(1, 2), Cells(1, 5)).Select
    With Selection.Copy
    Sheets("Transpose").Select
    Cells(1, 1).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With
    Cells(1, 5) = "Target"

'copiar bloco de informações que irão se repetir ao longo dos targets

    Sheets("Dados").Select

'contador para saber quantas colunas serão necessárias

Dim i As Integer
i = 6
    
    Do While Cells(1, i) <> ""
    
        If Cells(1, i) <> "" Then
        i = i + 7
        End If
    
    Loop
i = i - 1

'contador para saber quantas linhas serão copiadas

Dim j As Integer

j = 3

    Do While Cells(j, 2) <> ""
    
        If Cells(j, 2) <> "" Then
        j = j + 1
        End If
    Loop
j = j - 1

'copiar e colar os itens fixos (numero de vezes definido pela variável i

Dim k As Long 'variável para contar as vezes que se colam
Dim m As Integer 'variável para contar o target

k = 2
m = 11 
        
        Sheets("dados").Select
        Range(Cells(3, 2), Cells(j, 6)).Copy
        j = j - 2
    
    Do While m <= i
        
        Sheets("Transpose").Select
        Cells(k, 1).Select
        Selection.PasteSpecial Paste:=xlPasteValues
       
        k = k + j
        m = m + 7
    
    Loop

'copiar  e colar os targets na coluna target

k = 2
m = 6

    Do While m <= i
        Sheets("Dados").Select
        Cells(1, m).Copy
        Sheets("Transpose").Select
        Range(Cells(k, 5), Cells(k + j - 1, 5)).Select
        Selection.PasteSpecial Paste:=xlPasteValues
   
        k = k + j
        m = m + 7
    Loop

'Daqui para cima tudo CERTO'
    
'copiar e colar os fatos para a planilha transpose

    'copiar e colar cabeçalho dos fatos
    Sheets("Dados").Select
    Range(Cells(2, 6), Cells(2, 12)).Copy
    Sheets("Transpose").Select
    Cells(1, 6).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    
    'copiar e colar colunas em linhas
    
Dim x As Integer

m = 6
k = 2

Do While m <= i

    Sheets("Dados").Select
        Range(Cells(3, m), Cells(j + 2, m + 6)).Copy
    Sheets("Transpose").Select
    Range(Cells(k, 6), Cells(k + j - 1, 11)).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    
    k = k + j
    m = m + 7
    
Loop

    Sheets("Transpose").Select
    Range(Cells(2, 1), Cells(k, 1)).Select

'adicionar coluna Praça
''    Columns("A:A").Select
''    Selection.Insert Shift:=xlToRight
''    Cells(1, 1).Select
''    ActiveCell.FormulaR1C1 = "Praça"

'formatar coluna data como data
    Range("C2").Select
    Range(Selection, Selection.End(xlDown)).Select
    Selection.NumberFormat = "dd/mm/yyyy"
    Cells(1, 1).Select
'Mudar nome da sheet para Macro_Processada
    Sheets("Transpose").Select
    ActiveSheet.Name = "Macro_Processada"'


End Sub


