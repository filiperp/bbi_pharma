Sub Apsen()


  Call Macro (31,3,2015, "Goyas")
End Sub


    Sub Macro(dd as integer, mm as integer, yy as integer, distributor as String  )
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
    Range("C13").Select
    Selection.End(xlDown).Select
    Range("C65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(-10, 0).Select
    Range(ActiveCell, "C13").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2,3).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    'Origem do CD (localização)'

    'Sheets("Dados_CD").Select
    'Range("B2").Select
    'Selection.End(xlDown).Select
    'Range("B65536").Select
    'Selection.End(xlUp).Select
    'ActiveCell.Offset(0, 0).Select
    'Range(ActiveCell, "B2").Select
    'With Selection.Copy
    'Sheets("Template").Select
    'Cells(2,2).Select
    'Selection.PasteSpecial Paste:=xlPasteValues
    'End With   


    'Código EAN'

    'Sheets("Dados_CD").Select
    'Range("E2").Select
    'Selection.End(xlDown).Select
    'Range("E65536").Select
    'Selection.End(xlUp).Select
    'Range(ActiveCell, "E2").Select
    'With Selection.Copy
    'Sheets("Template").Select
    'Cells(2,4).Select
    'Selection.PasteSpecial Paste:=xlPasteValues
    'End With

    'Nome do Distribuidor'

    'Sheets("Dados_CD").Select
    'Range("B2").Select
    'Selection.End(xlDown).Select
    'Range("B65536").Select
    'Selection.End(xlUp).Select
    'Range(ActiveCell, "B2").Select
    'With Selection.Copy
    'Sheets("Template").Select
    'CElls(2,5).Select
    'Selection.PasteSpecial Paste:=xlPasteValues
    'End With

    'Coluna INFO Cells(2,6) = Vazio'

    'Estoque Chao Cells(2,7)'

    Sheets("Dados_CD").Select
    Range("J13").Select
    Selection.End(xlDown).Select
    Range("J65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(0, 0).Select
    Range(ActiveCell, "J13").Select
    With Selection.Copy
    Sheets("Template").Select
    CElls(2,7).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    'Estoque transito CElls(2,8)'

    'Sheets("Dados_CD").Select
    'Range("G5").Select
    'Selection.End(xlDown).Select
    'Range("G65536").Select
    'Selection.End(xlUp).Select
    'ActiveCell.Offset(-1, 0).Select
    'Range(ActiveCell, "G5").Select
    'With Selection.Copy
    'Sheets("Template").Select
    'Cells(2,8).Select
    'Selection.PasteSpecial Paste:=xlPasteValues
    'End With

    'Estoque Pendente Cells(2,9)'

    'Sheets("Dados_CD").Select
    'Range("J2").Select
    'Selection.End(xlDown).Select
    'Range("J65536").Select
    'Selection.End(xlUp).Select
    'ActiveCell.Offset(-2, 0).Select
    'Range(ActiveCell, "J2").Select
    'With Selection.Copy
    'Sheets("Template").Select
    'Cells(2,9).Select
    'Selection.PasteSpecial Paste:=xlPasteValues
    'End With

    'Estoque total cells(2,10)'

    'Sheets("Template").Select
    'Cells(2,10).select
'
    'Do while IsEmpty(activecell.offset(0,-7)) = False
'
    '    activecell.FormulaR1C1 = "=SUm(RC[-1],RC[-2],RC[-3])"
    '    activecell.offset(1,0).select
'
    'Loop
'
    'Range("J:J").Copy
    'Range("J:J").PasteSpecial xlPasteValues


    'Dias_Chao Cells(2,11)'

   		'Para este fornecedor é vazio'

   	'Dias_Total Cells(2,12)'

   		'Para este fornecedor é vazio'



    'Venda do Mês Atual Cells(2,11)'

    Sheets("Dados_CD").Select
    Range("H13").Select
    Selection.End(xlDown).Select
    Range("H65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(0, 0).Select
    Range(ActiveCell, "H13").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2,11).Select
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

    'Venda Mes -3 Cells(2,15)'

    Sheets("Dados_CD").Select
    Range("E13").Select
    Selection.End(xlDown).Select
    Range("E65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(-10, 0).Select
    Range(ActiveCell, "E13").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2,15).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    'Venda Mes -2 Cells(2,16)'

    Sheets("Dados_CD").Select
    Range("F13").Select
    Selection.End(xlDown).Select
    Range("F65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(-10, 0).Select
    Range(ActiveCell, "F13").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2,16).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    'Venda Mes -1 Cells(2,17)'

    Sheets("Dados_CD").Select
    Range("G13").Select
    Selection.End(xlDown).Select
    Range("G65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(0, 0).Select
    Range(ActiveCell, "G13").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2,17).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

    'Venda Média cells(2,10) --------- Vem da planilha do CD

    Sheets("Dados_CD").Select
    Range("K13").Select
    Selection.End(xlDown).Select
    Range("K65536").Select
    Selection.End(xlUp).Select
    ActiveCell.Offset(0, 0).Select
    Range(ActiveCell, "k13").Select
    With Selection.Copy
    Sheets("Template").Select
    Cells(2,10).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End With

'Dias_Chao Cells(2,11)'

    Sheets("Template").Select
    Cells(2, 11).Select

    Do While IsEmpty(ActiveCell.Offset(0, -8)) = False

        activecell.FormulaR1C1 = "=rounddown(((RC[-4]/RC[2])*30),0)"
        ActiveCell.Offset(1, 0).Select

    Loop

    Range("K:K").Copy
    Range("K:K").PasteSpecial Paste:=xlPasteValues


    'Dias_Total Cells(2,12)'

    Sheets("Template").Select
    Cells(2, 12).Select

    Do While IsEmpty(ActiveCell.Offset(0, -9)) = False

        activecell.FormulaR1C1 = "=rounddown(((RC[-2]/RC[1])*30),0)"
        ActiveCell.Offset(1, 0).Select

    Loop

    Range("L:L").Copy
    Range("L:L").PasteSpecial Paste:=xlPasteValues

    'Colando o Nome do Arquivo'

    Sheets("Template").select

    Cells(2,1).select

	do while IsEmpty(activecell.offset(0,2)) = False

        activecell.FormulaR1C1 = "=cell(""filename"")"
        activecell.offset(1,0).select

    Loop

    Range("A:A").Copy
    Range("A:A").PasteSpecial Paste:=xlPasteValues


'-----------------------------------------------------------------------------------------------------------------------



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

theDates(6) =  DateAdd ("m", -6, inDate)
theDates(7) = DateAdd ("m", -5, inDate)
theDates(8) = DateAdd ("m", -4, inDate)
theDates(9) = DateAdd ("m", -3, inDate)
theDates(10) = DateAdd ("m", -2, inDate)
theDates(11) = DateAdd ("m", -1, inDate)


Dim nValues(1 to 11) as String


    x = 2


    Do While Cells(x, 1) <> ""
                Sheets("Template").Select
                Cells(x, 1).Value = distributor

                 z=7

                 Do While z< 18 

                    if isError(Cells(x, z).Value) Then 
                          nValues(z-6) = ""
                    else
                           Cells(x, z).Value = round(Cells(x, z).Value,0)
                           nValues(z-6) = Cells(x, z).Value
                    end if

                    z= z+1

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
    
    cells(2,5).select

    dim o as integer

    o = 2

    do while IsEmpty (ActiveCell.offset(0,-2)) = False

        if cells(o,6).value = "estoque_chao" or cells(o,6).value = "estoque_total" or cells(o,6).value = "estoque_pendente" or cells(o,6).value = "estoque_transito" Then
          
            activecell.value = "estoque"

        else

            activecell.value = "venda"


        end if

        o = o + 1    

    ActiveCell.Offset(1, 0).Select

    Loop



Cells(1,1).select

  
 End Sub
     