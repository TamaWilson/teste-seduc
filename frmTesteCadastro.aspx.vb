
Partial Class frmTesteCadastro
    Inherits System.Web.UI.Page
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If Not Page.IsPostBack Then
            DesabilitarCampos()
            CarregarSelector()
        End If
        Validacao.Livre(nomeMae, True, "Nome da Mãe")
        Validacao.Outros(cpfMae, True, "CPF da Mae",, Validacao.eFormato.CPF)
        Validacao.Outros(cpfPai, False, "CPF do Pai",, Validacao.eFormato.CPF)
        Validacao.Outros(telefoneResposavel, False, "Telefone do Resposavel",, Validacao.eFormato.TELEFONE)
        Validacao.Data(dtEmissao, False, "Data de Emissão")
        Validacao.Data(dtNasc, True, "Data de Nascimento")
        Validacao.Finalizar(btnSalvar)
    End Sub

#Region "Funções de Cadastro"

    Private Sub Carregar()
        If drpAlunos.SelectedValue.Length = 0 Then
            MsgBox("Selecione um Aluno")
            Exit Sub
        End If
        Dim objDocumento As New Documento(drpAlunos.SelectedValue)

        If (objDocumento.Codigo > 0) Then
            nomeMae.Text = objDocumento.NomeMae
            cpfMae.Text = objDocumento.CPFMae
            nomePai.Text = objDocumento.NomePai
            cpfPai.Text = objDocumento.CPFPai
            telefoneResposavel.Text = objDocumento.TelefoneResponsavel
            rg.Text = objDocumento.RG
            dtEmissao.Text = objDocumento.DataEmissaoRG
            dtNasc.Text = objDocumento.DataNascimento
            rdSexo.Items.FindByValue(objDocumento.Sexo).Selected = True

        End If


        objDocumento = Nothing

        HabilitarCampos()
    End Sub
    Private Sub Salvar()

        Dim objDocumento As New Documento(ViewState("Codigo"))

        With objDocumento
            .CodigoAluno = drpAlunos.SelectedValue
            .NomeMae = Trim(Validacao.RetirarEspacos(nomeMae.Text))
            .CPFMae = Replace(Replace(cpfMae.Text, ".", ""), "-", "")
            .NomePai = Trim(Validacao.RetirarEspacos(nomePai.Text))
            .CPFPai = Replace(Replace(cpfPai.Text, ".", ""), "-", "")
            .TelefoneResponsavel = Validacao.RetirarEspacos(telefoneResposavel.Text.Replace("(", "").Replace(")", "").Replace("-", ""))
            .RG = rg.Text
            .DataEmissaoRG = dtEmissao.Text
            .DataNascimento = dtNasc.Text
            .Sexo = rdSexo.SelectedValue
            .Salvar()
        End With


    End Sub

    Private Sub LimparCampos()
        nomeMae.Text = ""
        cpfMae.Text = ""
        nomePai.Text = ""
        cpfPai.Text = ""
        telefoneResposavel.Text = ""
        rg.Text = ""
        dtEmissao.Text = ""
        dtNasc.Text = ""
        rdSexo.ClearSelection()
        drpAlunos.ClearSelection()
    End Sub

    Private Sub DesabilitarCampos()
        nomeMae.ReadOnly = True
        cpfMae.ReadOnly = True
        nomePai.ReadOnly = True
        cpfPai.ReadOnly = True
        telefoneResposavel.ReadOnly = True
        rg.ReadOnly = True
        dtEmissao.ReadOnly = True
        dtNasc.ReadOnly = True
        rdSexo.Enabled = False
        btnSalvar.Enabled = False
        btnCancelar.Enabled = False
        drpAlunos.Enabled = True
    End Sub

    Private Sub HabilitarCampos()
        nomeMae.ReadOnly = False
        cpfMae.ReadOnly = False
        nomePai.ReadOnly = False
        cpfPai.ReadOnly = False
        telefoneResposavel.ReadOnly = False
        rg.ReadOnly = False
        dtNasc.ReadOnly = False
        dtEmissao.ReadOnly = False
        rdSexo.Enabled = True
        btnSalvar.Enabled = True
        btnCancelar.Enabled = True
        drpAlunos.Enabled = False
    End Sub

#End Region

#Region "Eventos de Cadastro"
    Protected Sub btnSalvar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSalvar.Click
        Salvar()
        LimparCampos()
        DesabilitarCampos()
    End Sub

    Protected Sub lnkBuscar_click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lnkBuscarAluno.Click
        Carregar()
    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
        LimparCampos()
        DesabilitarCampos()
    End Sub

#End Region

#Region "Funções de Listagem"
    Private Sub CarregarSelector()
        Dim objAluno As New Aluno

        drpAlunos.DataSource = objAluno.Pesquisar(ViewState("OrderBy"))
        drpAlunos.DataTextField  = "CI01_NM_ALUNO"
        drpAlunos.DataValueField = "CI01_ID_ALUNO"
        drpAlunos.DataBind()
        drpAlunos.Items.Insert(0, New ListItem("Selecione um aluno", ""))
        objAluno = Nothing

    End Sub
#End Region

#Region "Eventos de Listagem"


#End Region
End Class
