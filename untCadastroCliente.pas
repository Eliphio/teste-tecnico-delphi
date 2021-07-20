unit untCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Xml.XMLDoc, System.JSON,
  uCliente, uEmail, REST.Client, System.inifiles, Vcl.ExtCtrls, Vcl.ComCtrls;


type
  TfrmCadCliente = class(TForm)
    pgCLiente: TPageControl;
    tsDadosCliente: TTabSheet;
    TabSheet2: TTabSheet;
    grpDocumento: TGroupBox;
    Label1: TLabel;
    lblIdentidade: TLabel;
    lblCPF: TLabel;
    lblEmail: TLabel;
    edtNome: TEdit;
    edtIdentidade: TEdit;
    edtEmail: TEdit;
    grpEndereco: TGroupBox;
    lblCep: TLabel;
    lblEndereco: TLabel;
    lblNumero: TLabel;
    lblComplemento: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lbl1: TLabel;
    Label2: TLabel;
    medtCep: TMaskEdit;
    edtEndereco: TEdit;
    edtNumero: TEdit;
    edtComplemento: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtPais: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtSMTP: TEdit;
    edtEmailRemetente: TEdit;
    edtSenha: TEdit;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    btnCancelar: TButton;
    btnEnviaEmail: TButton;
    Label8: TLabel;
    edtPort: TEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    edtDestinatario: TEdit;
    edtAssunto: TEdit;
    mmCorpo: TMemo;
    Label10: TLabel;
    lblTel: TLabel;
    medtTelefone: TMaskEdit;
    cbEstado: TComboBox;
    edtCPF: TMaskEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure medtCepExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnEnviaEmailClick(Sender: TObject);
    procedure edtSMTPExit(Sender: TObject);
    procedure edtPortExit(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtIdentidadeExit(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure medtTelefoneExit(Sender: TObject);
    procedure edtEmailExit(Sender: TObject);
    procedure edtEnderecoExit(Sender: TObject);
    procedure edtNumeroExit(Sender: TObject);
    procedure edtComplementoExit(Sender: TObject);
    procedure edtBairroExit(Sender: TObject);
    procedure edtCidadeExit(Sender: TObject);
    procedure cbEstadoExit(Sender: TObject);
    procedure edtPaisExit(Sender: TObject);
  private
    { Private declarations }
    Cliente: TCliente;
    procedure leInformacoes;
  public
    { Public declarations }

  end;

var
  frmCadCliente: TfrmCadCliente;


implementation

{$R *.dfm}

uses IdMessage, IdText, IdAttachmentFile, idhttp;

procedure TfrmCadCliente.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadCliente.btnEnviaEmailClick(Sender: TObject);
var
  EnviaEmail: TEmail;
  arq: string;
begin
  leInformacoes;

  if edtAssunto.text = emptystr then
  begin
    showmessage('Assunto deve ser preenchido');
    edtAssunto.SetFocus;
    exit;
  end;

  if edtDestinatario.text = emptystr then
  begin
    showmessage('Destinatário deve ser preenchido');
    edtDestinatario.SetFocus;
    exit;
  end;


  Cliente.geraXML(Self);

  arq := Cliente.pasta + Cliente.Nome + '.xml';
  if not FileExists(arq) then
  begin
    messagedlg('Arquivo não foi criado para enviar email.', mtWarning, [mbOk], 0);
    exit;
  end;

  try

    EnviaEmail              := TEmail.create(frmCadCliente);

    EnviaEmail.Host         := edtSMTP.Text;
    EnviaEmail.Port         := strtoint(edtPort.Text);
    EnviaEmail.Usuario      := edtEmailRemetente.Text;
    EnviaEmail.Senha        := edtSenha.Text;

    EnviaEmail.Assunto      := edtAssunto.text;
    EnviaEmail.Destinatario := edtDestinatario.text;
    EnviaEmail.Corpo        := mmCorpo.text;
    EnviaEmail.Anexo        := arq;


    if (EnviaEmail.enviaEmail = false) then
    begin
      messagedlg(EnviaEmail.Erro, mtError, [mbOk], 0);
    end
    else
    begin
      messagedlg('Email enviado com sucesso', mtInformation, [mbOk], 0);
    end;

    DeleteFile(arq);

  finally
    freeandnil(enviaEmail);
  end;

end;

procedure TfrmCadCliente.cbEstadoExit(Sender: TObject);
begin
  Cliente.Estado := trim(cbEstado.Text);
end;

procedure TfrmCadCliente.edtBairroExit(Sender: TObject);
begin
  Cliente.Bairro := trim(edtBairro.Text);
end;

procedure TfrmCadCliente.edtCidadeExit(Sender: TObject);
begin
  Cliente.Cidade := trim(edtCidade.Text);
end;

procedure TfrmCadCliente.edtComplementoExit(Sender: TObject);
begin
  Cliente.Complemento := trim(edtComplemento.Text);
end;

procedure TfrmCadCliente.edtCPFExit(Sender: TObject);
var
  cpf: string;
begin
  cpf := trim(stringReplace(edtCPF.Text, '.', '', [rfReplaceAll]));
  cpf := trim(stringReplace(cpf, '-', '', [rfReplaceAll]));
  if cpf = emptyStr then
  begin
    ShowMessage('CPF deve ser informado');
    pgCLiente.ActivePageIndex := 0;
    edtCPF.SetFocus;
    exit;
  end;

  if not Cliente.validaCPF(cpf) then
  begin
    showmessage('CPF inválido!');
    pgCLiente.ActivePageIndex:= 0;
    edtCPF.SetFocus;
    exit;
  end;


  Cliente.CPF := trim(edtCPF.Text);
end;

procedure TfrmCadCliente.edtEmailExit(Sender: TObject);
begin
  if edtEmail.Text = emptyStr then
  begin
    exit;
  end;

  if not Cliente.validaEmail(edtEmail.Text) then
  begin
    showmessage('Email inválido');
    pgCLiente.ActivePageIndex := 0;
    edtEmail.SetFocus;
    exit;
  end;
  Cliente.Email := trim(edtEmail.Text);
end;

procedure TfrmCadCliente.edtEnderecoExit(Sender: TObject);
begin
  Cliente.Logradouro := trim(edtEndereco.Text);
end;

procedure TfrmCadCliente.edtIdentidadeExit(Sender: TObject);
begin
  Cliente.Identidade := trim(edtIdentidade.Text);
end;

procedure TfrmCadCliente.edtNomeExit(Sender: TObject);
begin
  if edtNome.Text = emptyStr then
  begin
    messagedlg('Nome do cliente deve ser preenchido', mtWarning, [mbOk], 0);
    tsDadosCliente.PageControl.ActivePageIndex := 0;
    edtNome.SetFocus;
    exit;
  end;

  Cliente.Nome := trim(edtNome.Text);
end;

procedure TfrmCadCliente.edtNumeroExit(Sender: TObject);
begin
  Cliente.Numero := trim(edtNumero.Text);
end;

procedure TfrmCadCliente.edtPaisExit(Sender: TObject);
begin
  Cliente.Pais := trim(edtPais.Text);
end;

procedure TfrmCadCliente.edtPortExit(Sender: TObject);
begin
  try

    if edtPort.Text = emptyStr then
    begin
      edtPort.Text := '587';
    end;

    strtoint(edtPort.Text);

  except
    showmessage('Porta deve ser numérico');
  end;
end;

procedure TfrmCadCliente.edtSMTPExit(Sender: TObject);
begin
  if edtSMTP.Text = emptyStr then
  begin
    edtSMTP.Text := 'smtp.gmail.com';
  end;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  Cliente := TCliente.create;
end;

procedure TfrmCadCliente.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Cliente);
end;

procedure TfrmCadCliente.leInformacoes;
begin
  medtCepExit(Self);
  edtSMTPExit(Self);
  edtPortExit(Self);
  edtNomeExit(Self);
  edtIdentidadeExit(Self);
  edtCPFExit(Self);
  medtTelefoneExit(Self);
  edtEmailExit(Self);
  edtEnderecoExit(Self);
  edtNumeroExit(Self);
  edtComplementoExit(Self);
  edtBairroExit(Self);
  edtCidadeExit(Self);
  cbEstadoExit(Self);
  edtPaisExit(Self);
end;

procedure TfrmCadCliente.medtCepExit(Sender: TObject);
begin
  if trim(StringReplace(medtCep.text, '-', '', [rfReplaceAll])) = emptystr then
  begin
    exit;
  end;

  try

    Cliente.Cep := medtCep.Text;

    Screen.Cursor := crHourGlass;

    Cliente.buscaCep;

    with Cliente do
    begin
      edtEndereco.Text := Logradouro;
      edtBairro.Text   := Bairro;
      edtCidade.Text   := Cidade;
      cbEstado.Text    := Estado;
    end;

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmCadCliente.medtTelefoneExit(Sender: TObject);
begin
  Cliente.Telefone := trim(medtTelefone.Text);
end;

end.
