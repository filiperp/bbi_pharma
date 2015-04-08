Sub Apsen()


  Call Macro(31, 3, 2015, "Profarma")
End Sub


    Sub Macro(dd As Integer, mm As Integer, yy As Integer, distributor As String)
      Dim inDate As Date
  inDate = DateSerial(yy, mm, dd)

Application.DisplayAlerts = False

'Sheets("Template").Delete

'Renomeando sheet do Centro de Distribuição'
        
    ActiveSheet.Name = "Dados_CD"

'Criando nova aba'

    Sheets.Add After:=ActiveSheet
    ActiveSheet.Name = "Template"
    Range("A1").Select

'Nomeando colunas do template_padrao'

     Cells(1, 1) = "Nome"
     Cells(1, 2) = "CD"
     Cells(1, 3) = "Material"
     Cells(1, 4) = "EAN"
     Cells(1, 5) = "Distribuidor"
     Cells(1, 6) = "INFO"
     Cells(1, 7) = "Estoque_chao"
     Cells(1, 8) = "Estoque_Transito"
     Cells(1, 9) = "Estoque_Pendente"
     Cells(1, 10) = "Venda_Media"
     Cells(1, 11) = "Venda_Atual"
     Cells(1, 12) = "Mes_06"
     Cells(1, 13) = "Mes_05"
     Cells(1, 14) = "Mes_04"
     Cells(1, 15) = "Mes_03"
     Cells(1, 16) = "Mes_02"
     Cells(1, 17) = "Mes_01"
     

'Colando os dados do CD no template'

       
    'Descrição do Material'

    Sheets("Dados_CD").Select
    Range("c8").Select
    Selection.End(xlDown).Select
    Range("c65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(0, 0).Select
    Range(ActiveCell, "c8").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2, 3).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    'Origem do CD (localização - Estado)'

    Sheets("Dados_CD").Select
    Range("a8").Select
    Selection.End(xlDown).Select
    Range("a65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(0, 0).Select
    Range(ActiveCell, "a8").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2, 2).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    cells(1,18).value = "CD"
    Cells(2, 18).Select

    Do While IsEmpty(ActiveCell.Offset(0, -15)) = False

      ActiveCell.FormulaR1C1 = "=right(RC[-16],2)"
      ActiveCell.Offset(1, 0).Select
      
    Loop

    Range("R:R").Select
    with Selection.Copy
    Cells(1,2).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    ENd with

    Range("R:R").Delete


    


    'Código EAN'

    'Sheets("Dados_CD").Select
    'Range("g2").Select
    'Selection.End(xlDown).Select
    'Range("g65536").Select
    'Selection.End(xlUp).Select
    'Range(ActiveCell, "g2").Select
    'With Selection.Copy
    'Sheets("Template").Select
    'Cells(2,4).Select
    'Selection.PasteSpecial Paste:=xlPasteValues
    'End With

    

    'Coluna INFO Cells(2,6) = Vazio'

    'Estoque Chao Cells(2,7)'

    Sheets("Dados_CD").Select
    Range("d8").Select
    Selection.End(xlDown).Select
    Range("d65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(-1, 0).Select
    Range(ActiveCell, "d8").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2, 7).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    'Estoque transito CElls(2,8)'

    Sheets("Dados_CD").Select
    Range("f8").Select
    Selection.End(xlDown).Select
    Range("f65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(-1, 0).Select
    Range(ActiveCell, "f8").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2, 8).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    'Estoque Pendente Cells(2,9)'

    'Sheets("Dados_CD").Select
    'Range("l2").Select
    'Selection.End(xlDown).Select
    'Range("l65536").Select
    'Selection.End(xlUp).Select
    'ActiveCell.Offset(0, 0).Select
    'Range(ActiveCell, "l2").Select
    'With Selection.Copy
    'Sheets("Template").Select
    'Cells(2,9).Select
    'Selection.PasteSpecial Paste:=xlPasteValues
    'End With

    'Estoque total cells(2,10)'

   ' 'Sheets("Template").Select
   ' 'Cells(2,10).select

   ' 'Do while IsEmpty(activecell.offset(0,-7)) = False

   ' '    activecell.FormulaR1C1 = "=SUm(RC[-1],RC[-2],RC[-3])"
   ' '    activecell.offset(1,0).select

   ' 'Loop

   ' 'Range("J:J").Copy
   ' 'Range("J:J").PasteSpecial xlPasteValues


    'Dias_Total Cells(2,12)'

        'Para este fornecedor é vazio'



    'Venda do Mês Atual Cells(2,14)'

    Sheets("Dados_CD").Select
    Range("h8").Select
    Selection.End(xlDown).Select
    Range("h65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(-1, 0).Select
    Range(ActiveCell, "h8").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2, 11).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    'Venda Mes -6 Cells(2,15)'
        
    'Sheets("Dados_CD").Select
    'Range("G8").Select
    'Selection.End(xlDown).Select
    'Range("G65536").Select
    'Selection.End(xlUp).Select
    'ActiveCell.Offset(-1, 0).Select
    'Range(ActiveCell, "G8").Select
    'With Selection.Copy
    'Sheets("Template").Select
    'Cells(2,15).Select
    'Selection.PasteSpecial Paste:=xlPasteValues
    'End With

    'Venda Mes -5 Cells(2,16)'
        
    'Sheets("Dados_CD").Select
    'Range("H8").Select
    'Selection.End(xlDown).Select
    'Range("H65536").Select
    'Selection.End(xlUp).Select
    'ActiveCell.Offset(-1, 0).Select
    'Range(ActiveCell, "H8").Select
    'With Selection.Copy
    'Sheets("Template").Select
    'Cells(2,16).Select
    'Selection.PasteSpecial Paste:=xlPasteValues
    'End With

    'Venda Mes -4 Cells(2,17)'

        
    'Sheets("Dados_CD").Select
    'Range("I8").Select
    'Selection.End(xlDown).Select
    'Range("I65536").Select
    'Selection.End(xlUp).Select
    'ActiveCell.Offset(-1, 0).Select
    'Range(ActiveCell, "I8").Select
    'With Selection.Copy
    'Sheets("Template").Select
    'Cells(2,17).Select
    'Selection.PasteSpecial Paste:=xlPasteValues
    'End With

    'Venda Mes -3 Cells(2,18)'

    Sheets("Dados_CD").Select
    Range("k8").Select
    Selection.End(xlDown).Select
    Range("k65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(-3, 0).Select
    Range(ActiveCell, "k8").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2, 15).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    'Venda Mes -2 Cells(2,19)'

    Sheets("Dados_CD").Select
    Range("j8").Select
    Selection.End(xlDown).Select
    Range("j65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(-4, 0).Select
    Range(ActiveCell, "j8").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2, 16).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With
'
    'Venda Mes -1 Cells(2,20)'

    Sheets("Dados_CD").Select
    Range("i8").Select
    Selection.End(xlDown).Select
    Range("i65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(-4, 0).Select
    Range(ActiveCell, "i8").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2, 17).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    'Venda Média cells(2,10)'

    Sheets("Dados_CD").Select
    Range("l8").Select
    Selection.End(xlDown).Select
    Range("l65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(-1, 0).Select
    Range(ActiveCell, "l8").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2, 10).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    'cells(2,22).Select
'
    'do while IsEmpty (ActiveCell.offset(0,-20)) = False
'
    '  Cells(2,22).value = rounddown(cells(2,10).value,0))
    '  ActiveCell.offset(1,0).Select
'
    'Loop
'
    'Range("V:V").Copy
    'cells(1,10).select
    'Selection.PasteSpecial Paste:=xlPasteValues
'


   '' 'Dias_Chao Cells(2,11)'
''
   '' Sheets("Template").Select
   '' Cells(2, 11).Select
''
   '' Do While IsEmpty(ActiveCell.Offset(0, -8)) = False
''
   ''     activecell.FormulaR1C1 = "=round(((RC[-4]/RC[2])*30),0)"
   ''     ActiveCell.Offset(1, 0).Select
''
   '' Loop
''
   '' Range("K:K").Copy
   '' Range("K:K").PasteSpecial Paste:=xlPasteValues
''
''
   '' 'Dias_Total Cells(2,12)'
''
   '' Sheets("Template").Select
   '' Cells(2, 12).Select
''
   '' Do While IsEmpty(ActiveCell.Offset(0, -9)) = False
''
   ''     activecell.FormulaR1C1 = "=round(((RC[-2]/RC[1])*30),0)"
   ''     ActiveCell.Offset(1, 0).Select
''
   '' Loop
''
   '' Range("L:L").Copy
   '' Range("L:L").PasteSpecial Paste:=xlPasteValues

    'Colando o Nome do Arquivo'

    Sheets("Template").Select

    Cells(2, 1).Select

    Do While IsEmpty(ActiveCell.Offset(0, 2)) = False

        ActiveCell.FormulaR1C1 = "=cell(""filename"")"
        ActiveCell.Offset(1, 0).Select

    Loop

    Range("A:A").Copy
    Range("A:A").PasteSpecial Paste:=xlPasteValues




''-----------------------------------------------------------------------------------------------------------------------



'planilha final

  '------------------------------------------------------------------

    
    Sheets.Add After:=ActiveSheet
    ActiveSheet.Name = "output_bbi"
    

   'copiando cabeçalho
    
    Sheets("output_bbi").Select

    Range("A1").Select
     Cells(1, 1) = "nome"
     Cells(1, 2) = "cd"
     Cells(1, 3) = "material"
     Cells(1, 4) = "ean"
     Cells(1, 5) = "tipo"
     Cells(1, 6) = "info"
     Cells(1, 7) = "valor"
     Cells(1, 8) = "periodo"


    Sheets("Template").Select

    Dim x As Integer
    Dim y As Integer
    Dim z As Integer
    Dim bdate As Date

Dim Films(1 To 11) As String

Films(1) = "estoque_chao"
Films(2) = "estoque_transito"
Films(3) = "estoque_pendente"
'Films(4) = "estoque_total"
'Films(5) = "dias_chao"
'Films(6) = "dias_total"
Films(4) = "venda_media"
Films(5) = "venda_atual"
Films(6) = "mes_06"
Films(7) = "mes_05"
Films(8) = "mes_04"
Films(9) = "mes_03"
Films(10) = "mes_02"
Films(11) = "mes_01"


Dim theDates(1 To 11) As Date

theDates(1) = inDate
theDates(2) = inDate
theDates(3) = inDate
'theDates(4) = inDate
'theDates(5) = inDate
'theDates(6) = inDate
theDates(4) = inDate
theDates(5) = inDate

theDates(6) = DateAdd("m", -6, inDate)
theDates(7) = DateAdd("m", -5, inDate)
theDates(8) = DateAdd("m", -4, inDate)
theDates(9) = DateAdd("m", -3, inDate)
theDates(10) = DateAdd("m", -2, inDate)
theDates(11) = DateAdd("m", -1, inDate)


Dim nValues(1 To 11) As String


    x = 2


    Do While Cells(x, 1) <> ""
                Sheets("Template").Select
                Cells(x, 1).Value = distributor

                 z = 7

                 Do While z < 18

                    If IsError(Cells(x, z).Value) Then
                          nValues(z - 6) = ""
                    Else
                         Cells(x, z).Value = Round(Cells(x, z).Value, 0)
                         nValues(z - 6) = Cells(x, z).Value
                           
                    End If

                    z = z + 1

                Loop

                

               


                Range(Cells(x, 1), Cells(x, 5)).Copy

        y = 1

        Do While y < 12

           
                Sheets("output_bbi").Select
                Cells(((x - 2) * 11) + y + 1, 1).PasteSpecial xlPasteValues
                Cells(((x - 2) * 11) + y + 1, 6) = Films(y)
                Cells(((x - 2) * 11) + y + 1, 7) = nValues(y)
                Cells(((x - 2) * 11) + y + 1, 8) = theDates(y)

          

            y = y + 1

        Loop

    x = x + 1

    
    Sheets("Template").Select
    Loop

     Sheets("output_bbi").Select

         'Tipo de Banco (Estoque ou Venda)'
    
    Cells(2, 5).Select

    Dim o As Integer

    o = 2

    Do While IsEmpty(ActiveCell.Offset(0, -2)) = False

        If Cells(o, 6).Value = "estoque_chao" Or Cells(o, 6).Value = "estoque_total" Or Cells(o, 6).Value = "estoque_pendente" Or Cells(o, 6).Value = "estoque_transito" Then
          
            ActiveCell.Value = "estoque"

        Else

            ActiveCell.Value = "venda"


        End If

        o = o + 1

    ActiveCell.Offset(1, 0).Select

    Loop



Cells(1, 1).Select

  
 End Sub
     

