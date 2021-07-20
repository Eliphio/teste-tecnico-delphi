unit uEmail;

interface

uses System.SysUtils, System.JSON, REST.Client,
  IdExplicitTLSClientServerBase, IdAttachmentFile,
  idsslopenssl, idmessage, idtext, idsmtp, vcl.Forms,
  System.Classes;

type
  TEmail = class

  protected
    idMsg                : TIdMessage;
    IdText               : TIdText;
    idSMTP               : TIdSMTP;
    IdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;

  private
    FDestinatario: string;
    FUsuario: string;
    FPort: integer;
    FHost: string;
    FSenha: string;
    FCorpo: string;
    FASsunto: string;
    FRemetente: string;
    FErro: string;
    FAnexo: string;

  public
    property Destinatario: string read FDestinatario write FDestinatario;
    property Host: string read FHost write FHost;
    property Port: integer read FPort write FPort;
    property Usuario: string read FUsuario write FUsuario;
    property Senha: string read FSenha write FSenha;
    property Assunto: string read FASsunto write FAssunto;
    property Corpo: string read FCorpo write FCorpo;
    property Remetente: string read FRemetente write FRemetente;
    property Anexo: string read FAnexo write FAnexo;
    property Erro: string read FErro write FErro;

    constructor create(Sender: TComponent);
    destructor destroy;
    function enviaEmail: boolean;
  end;

implementation

{ TEmail }

constructor TEmail.create(Sender: TComponent);
begin

  IdSSLIOHandlerSocket:= TIdSSLIOHandlerSocketOpenSSL.Create(Sender);
  idMsg               := TIdMessage.Create(Sender);
  idText              := TIdText.Create(idMsg.MessageParts);
  IdSMTP              := TIdSMTP.Create(Sender);
end;

destructor TEmail.destroy;
begin
  FreeAndNil(idMsg);
  FreeAndNil(IdText);
  FreeAndNil(idSMTP);
  FreeAndNil(IdSSLIOHandlerSocket);
  FreeAndNil(Self);
end;

function TEmail.enviaEmail: boolean;
begin
  IdSSLIOHandlerSocket.SSLOptions.Method := sslvTLSv1_1;
  IdSSLIOHandlerSocket.SSLOptions.Mode  := sslmClient;

  idMsg.CharSet                    := 'utf-8';
  idMsg.Encoding                   := meMIME;
  idMsg.From.Name                  := FAssunto;
  idMsg.From.Address               := FRemetente;
  idMsg.Priority                   := mpNormal;
  idMsg.Subject                    := FAssunto;

  idMsg.Recipients.Add;
  idMsg.Recipients.EMailAddresses := FDestinatario;
  idMsg.BccList.EMailAddresses    := FRemetente;

  idText.Body.Add(FCorpo);
  idText.ContentType := 'text/html; text/plain; charset=iso-8859-1';

  IdSMTP.IOHandler                 := IdSSLIOHandlerSocket;
  IdSMTP.UseTLS                    := utUseRequireTLS;
  IdSMTP.AuthType                  := satDefault;
  IdSMTP.Host                      := FHost;
  IdSMTP.AuthType                  := satDefault;
  IdSMTP.Port                      := FPort;
  IdSMTP.Username                  := FUsuario;
  IdSMTP.Password                  := FSenha;

  //Conecta e Autentica
  IdSMTP.Connect;
  IdSMTP.Authenticate;
  if (FAnexo <> EmptyStr)
    and (FileExists(FAnexo)) then
  begin
    TIdAttachmentFile.Create(idMsg.MessageParts, FAnexo);
  end;

  if IdSMTP.Connected then
  begin
    try
      IdSMTP.Send(idMsg);
    except on E:Exception do
      begin
        result:= false;
        FErro := E.Message;
        exit;
      end;
    end;
  end;

  if IdSMTP.Connected then
  begin
    IdSMTP.Disconnect;
  end;

  Result := True;
end;

end.
