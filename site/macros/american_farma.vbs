  Sub q()
  
  
  Call Macro (31,3,2015, "La Cucaracha")
End Sub


    Sub Macro(dd as integer, mm as integer, yy as integer, distributor as String  )
      Dim inDate As Date
  inDate = DateSerial(yy, mm, dd)

Application.DisplayAlerts = False
' Sheets("Template").Delete
' Sheets("output_bbi").Delete



    'Renomeando sheet do Centro de Distribuição'
    	
    	ActiveSheet.Name = "Dados_CD"

    'criando aba nova
        
        Sheets.Add After:=ActiveSheet
        ActiveSheet.Name = "Template"
        Range("A1").Select

    'Inserindo 

        Range("A1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "CD"

        Range("B1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Material"

        Range("C1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Venda_Media"

        Range("D1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Estoque_chao"

        Range("E1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Estoque_Transito"

        Range("F1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Estoque_Pendente"

        Range("G1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Estoque_total"

        Range("H1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Dias_Chao"

        Range("I1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Dias_total"

        Range("J1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Ean"

        Range("K1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Distribuidor"

        Range("L1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Venda"

        Range("M1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Mes_06"

        Range("N1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Mes_05"

        Range("O1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Mes_04"

        Range("P1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Mes_03"

        Range("Q1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Mes_02"

        Range("R1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Mes_01"

        'Colando dados do CD no Template'

        'Nome do CD'

        Sheets("Dados_CD").Select
        Range("A2").Select
        Selection.End(xlDown).Select
        Range("A65536").Select
        Selection.End(xlUp).Select
        Range(ActiveCell, "A2").Select
        With Selection.Copy
        Sheets("Template").Select
        Range("A2").Select
        Selection.PasteSpecial Paste:=xlPasteValues
        End With

        'Descrição do Produto'

        Sheets("Dados_CD").Select
        Range("G2").Select
        Selection.End(xlDown).Select
        Range("G65536").Select
        Selection.End(xlUp).Select
        Range(ActiveCell, "G2").Select
        With Selection.Copy
        Sheets("Template").Select
        Range("B2").Select
        Selection.PasteSpecial Paste:=xlPasteValues
        End With

        'Venda Atual'

        Sheets("Dados_CD").Select
        Range("K2").Select
        Selection.End(xlDown).Select
        Range("K65536").Select
        Selection.End(xlUp).Select
        ActiveCell.Offset(-1, 0).Select
        Range(ActiveCell, "K2").Select
        With Selection.Copy
        Sheets("Template").Select
        Range("L2").Select
        Selection.PasteSpecial Paste:=xlPasteValues
        End With

        'Venda Mes_03'

        Sheets("Dados_CD").Select
        Range("N2").Select
        Selection.End(xlDown).Select
        Range("N65536").Select
        Selection.End(xlUp).Select
        ActiveCell.Offset(-1, 0).Select
        Range(ActiveCell, "N2").Select
        With Selection.Copy
        Sheets("Template").Select
        Range("P2").Select
        Selection.PasteSpecial Paste:=xlPasteValues
        End With

        'Venda Mes_02'

        Sheets("Dados_CD").Select
        Range("M2").Select
        Selection.End(xlDown).Select
        Range("M65536").Select
        Selection.End(xlUp).Select
        ActiveCell.Offset(-1, 0).Select
        Range(ActiveCell, "M2").Select
        With Selection.Copy
        Sheets("Template").Select
        Range("Q2").Select
        Selection.PasteSpecial Paste:=xlPasteValues
        End With

        'Venda Mes_01'

        Sheets("Dados_CD").Select
        Range("L2").Select
        Selection.End(xlDown).Select
        Range("L65536").Select
        Selection.End(xlUp).Select
        ActiveCell.Offset(-1, 0).Select
        Range(ActiveCell, "L2").Select
        With Selection.Copy
        Sheets("Template").Select
        Range("R2").Select
        Selection.PasteSpecial Paste:=xlPasteValues
        End With

        'Estoque Atual'

        Sheets("Dados_CD").Select
        Range("O2").Select
        Selection.End(xlDown).Select
        Range("O65536").Select
        Selection.End(xlUp).Select
        ActiveCell.Offset(-1, 0).Select
        Range(ActiveCell, "O2").Select
        With Selection.Copy
        Sheets("Template").Select
        Range("D2").Select
        Selection.PasteSpecial Paste:=xlPasteValues
        End With

        'Estoque Trânsito'

        Sheets("Dados_CD").Select
        Range("P2").Select
        Selection.End(xlDown).Select
        Range("P65536").Select
        Selection.End(xlUp).Select
        ActiveCell.Offset(-1, 0).Select
        Range(ActiveCell, "P2").Select
        With Selection.Copy
        Sheets("Template").Select
        Range("E2").Select
        Selection.PasteSpecial Paste:=xlPasteValues
        End With

        'Estoque Pedido'

        Sheets("Dados_CD").Select
        Range("Q2").Select
        Selection.End(xlDown).Select
        Range("Q65536").Select
        Selection.End(xlUp).Select
        ActiveCell.Offset(-1, 0).Select
        Range(ActiveCell, "Q2").Select
        With Selection.Copy
        Sheets("Template").Select
        Range("F2").Select
        Selection.PasteSpecial Paste:=xlPasteValues
        End With

        'Estoque Total'

        Sheets("Dados_CD").Select
        Range("R2").Select
        Selection.End(xlDown).Select
        Range("R65536").Select
        Selection.End(xlUp).Select
        Range(ActiveCell, "R2").Select
        With Selection.Copy
        Sheets("Template").Select
        Range("G2").Select
        Selection.PasteSpecial Paste:=xlPasteValues
        End With

        'Código EAN'

        Sheets("Dados_CD").Select
        Range("F2").Select
        Selection.End(xlDown).Select
        Range("F65536").Select
        Selection.End(xlUp).Select
        Range(ActiveCell, "F2").Select
        With Selection.Copy
        Sheets("Template").Select
        Range("J2").Select
        Selection.PasteSpecial Paste:=xlPasteValues
        End With

        'Noeme Distribuidor'

        Sheets("Dados_CD").Select
        Range("B2").Select
        Selection.End(xlDown).Select
        Range("B65536").Select
        Selection.End(xlUp).Select
        Range(ActiveCell, "B2").Select
        With Selection.Copy
        Sheets("Template").Select
        Range("K2").Select
        Selection.PasteSpecial Paste:=xlPasteValues
        End With

        'Calculando a média de vendas'

        range("C2").Select

        Do while IsEmpty(activecell.offset(0,-2)) = False


            activecell.FormulaR1C1 = "=Average(RC[9],RC[10],RC[11],RC[12],RC[13],RC[14],RC[15])"
            activecell.offset(1,0).select

        Loop

        'Copiando os valores da média'

        Range("C:C").Copy
        range("C:C").PasteSpecial xlPasteValues

        'Inserindo Nome do Arquivo

        Range("A1").Select
        Selection.EntireColumn.Insert
        ActiveCell.FormulaR1C1 = "Nome"
        Range("A2").select

        do while IsEmpty(activecell.offset(0,1)) = False

            activecell.FormulaR1C1 = "=cell(""filename"")"
            activecell.offset(1,0).select

        Loop

        Range("A:A").Copy
        range("A:A").PasteSpecial xlPasteValues

        range("L2").select

    '------------------------------------------------------------------

    Sheets("Template").select

    'criando aba nova
    
    Sheets.Add After:=ActiveSheet
    ActiveSheet.Name = "output_bbi"
    Range("A1").Select

   'copiando cabeçalho

    Sheets("Template").select
    range(cells(1,1),cells(1,12)).Copy
    Sheets("output_bbi").select
    Range("A1").PasteSpecial xlPasteValues

    Cells(1,13).value = "Tipo"
    Cells(1,14).value = "Valor"
    Cells(1,15).value = "Periodo"

    Sheets("Template").select

    Dim x as integer
    Dim y as integer
    dim bdate as Date

    'Dim objNewDate As Date
    'MyDate = DateSerial(2012, 5, 8)
    'DateAdd ( interval, number, date )
    'Format(DateAdd("d", -4, CDate(Me.datalivrare.Value)), "dd.mm.yyyy")'

    x = 2


    do while cells(x,1) <> ""
	    cells(x,1).value = distributor

        y = 1

        do while y < 8

            if y = 1 then 

                Sheets("Template").select
                Range(cells(x,1),cells(x,12)).Copy
                Sheets("output_bbi").select
                cells( ((x-2)*7)+y+1,1 ).PasteSpecial xlPasteValues
                cells( ((x-2)*7)+y+1,13 ).value = "Venda"
                sheets("Template").select
                Cells(x,13).copy
                Sheets("output_bbi").select
                cells( ((x-2)*7)+y+1,14).PasteSpecial xlPasteValues


                cells( ((x-2)*7)+y+1,15 ).Value = indate

            else

                Sheets("Template").select
                Range(cells(x,1),cells(x,2)).Copy
                Sheets("output_bbi").select
                cells( ((x-2)*7)+y+1,1 ).PasteSpecial xlPasteValues
                Sheets("Template").select
                Range(cells(x,11),cells(x,12)).Copy
                Sheets("output_bbi").select
                cells( ((x-2)*7)+y+1,11).PasteSpecial xlPasteValues
                Cells(((x-2)*7)+y+1, 13).value = "Mes_" &  (8-y)
                Sheets("Template").select
                Cells(x, 13+y).copy
                Sheets("output_bbi").select
                cells( ((x-2)*7)+y+2,14 ).PasteSpecial xlPasteValues

                bdate = DateAdd ("m", -(8-y), inDate)

                cells( ((x-2)*7)+y+1,15 ).Value = bdate


            End If

            y = y + 1

        Loop

    x = x + 1

    Sheets("Template").select

    Loop

	 Sheets("output_bbi").select

       
    End Sub



