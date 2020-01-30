<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="frmTesteCadastro.aspx.vb" Inherits="frmTesteCadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content-header">
    </section>
    <section class="content">
        <h4 class="page-header">Teste Formulario Cadastro</h4>
        <div class="box-body">
        </div>
        <div class="row">
            <div class="col-md-5">
                <div class="form-group">
                    <label for="Estado">Alunos:</label>
                    <div class="input-group">
                        <asp:DropDownList runat="server" ID="drpAlunos" class="form-control" name="Aluno">
                        </asp:DropDownList>
                        <span class="input-group-btn">
                            <asp:LinkButton ID="lnkBuscarAluno" runat="server" class="btn btn-primary" ToolTip="Buscar Aluno" CausesValidation="false">
                                <i id="iBuscarAluno" runat="server" class="fa fa-search"></i>
                            </asp:LinkButton>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-7">
                <div class="form-group">
                    <label for="NomeMae">Nome da Mãe:</label>
                    <asp:TextBox runat="server" type="text" class="form-control" ID="nomeMae" name="NomeMae" placeholder="Ex.: Maria da Silva" MaxLength="50" />
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label for="CPFMae">CPF da Mãe:</label>
                    <asp:TextBox runat="server" ValidateRequestMode="Disabled" type="text" class="form-control" ID="cpfMae" name="CPFMae" placeholder="Ex.: 010.011.111-00" MaxLength="14" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-7">
                <div class="form-group">
                    <label for="NomePai">Nome do Pai:</label>
                    <asp:TextBox runat="server" type="text" class="form-control" ID="nomePai" name="NomePai" placeholder="Ex.: João da Silva" MaxLength="50" />
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label for="CPFPai">CPF do Pai:</label>
                    <asp:TextBox runat="server" type="text" class="form-control" ID="cpfPai" name="CPFPai" placeholder="Ex.: 010.011.111-00" MaxLength="14" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <label for="telefoneResposavel">Telefone do Responsável</label>
                    <asp:TextBox runat="server" type="text" class="form-control" ID="telefoneResposavel" name="TelefoneResposavel" placeholder="Ex.: (98) 9009-9999" MaxLength="15" />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="RG">RG do Aluno:</label>
                    <asp:TextBox runat="server" type="text" class="form-control" ID="rg" name="RG" placeholder="Ex.: 9999999999" MaxLength="20" />
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label for="DataEmissao">Data de Emissão</label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <asp:TextBox runat="server" type="text" class="form-control" ID="dtEmissao" name="DataEmissao" placeholder="Ex.: 01/01/1990" MaxLength="8" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-md-2">
                <div class="form-group">
                    <label for="dtNascimento">Data de Nascimento</label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <asp:TextBox runat="server" type="text" class="form-control" ID="dtNasc" name="DataNascimento" placeholder="Ex.: 01/01/1990" MaxLength="8" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="rdSexo">Sexo</label>
                    <asp:RadioButtonList ID="rdSexo" name="Sexo" RepeatDirection="Horizontal" runat="server">
                        <asp:ListItem Value='M' class="radioalign" Text="Masculino">Masculino</asp:ListItem>
                        <asp:ListItem Value='F' class="radioalign" Text="Feminino">Feminino</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator
                        ID="ReqiredFieldValidator1"
                        runat="server"
                        ControlToValidate="rdSexo"
                        ErrorMessage="Selecione o Sexo do Aluno"
                        SetFocusOnError="true"
                        Display="None"
                        ValidationGroup="validacao">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <div class="col-md-6">
                <asp:Button ID="btnSalvar" Text="Salvar" runat="server" CssClass="btn btn-primary" ValidationGroup="validacao" />
               <asp:Button ID="btnCancelar" Text="Cancelar" runat="server" CssClass="btn btn-default" CausesValidation="false" style="margin-left: 5rem;"/>
            </div>
        </div>
    </section>
</asp:Content>
