object frmCadCliente: TfrmCadCliente
  Left = 221
  Top = 88
  Caption = 'Cadastro de cliente'
  ClientHeight = 470
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pgCLiente: TPageControl
    Left = 0
    Top = 0
    Width = 408
    Height = 429
    ActivePage = tsDadosCliente
    Align = alClient
    TabOrder = 0
    TabStop = False
    ExplicitHeight = 471
    object tsDadosCliente: TTabSheet
      Caption = 'Dados do Cliente'
      ExplicitWidth = 420
      ExplicitHeight = 437
      object grpDocumento: TGroupBox
        Left = 10
        Top = 3
        Width = 377
        Height = 158
        Caption = 'Dados Pessoais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 27
          Height = 13
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblIdentidade: TLabel
          Left = 16
          Top = 64
          Width = 52
          Height = 13
          Caption = 'Identidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCPF: TLabel
          Left = 127
          Top = 64
          Width = 19
          Height = 13
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEmail: TLabel
          Left = 16
          Top = 107
          Width = 24
          Height = 13
          Caption = 'Email'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTel: TLabel
          Left = 260
          Top = 64
          Width = 42
          Height = 13
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtNome: TEdit
          Left = 16
          Top = 40
          Width = 345
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnExit = edtNomeExit
        end
        object edtIdentidade: TEdit
          Left = 16
          Top = 80
          Width = 105
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = edtIdentidadeExit
        end
        object edtEmail: TEdit
          Left = 16
          Top = 123
          Width = 345
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnExit = edtEmailExit
        end
        object medtTelefone: TMaskEdit
          Left = 260
          Top = 80
          Width = 101
          Height = 21
          EditMask = '(99) 9 9999-9999;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 16
          ParentFont = False
          TabOrder = 3
          Text = '(  )       -    '
          OnExit = medtTelefoneExit
        end
        object edtCPF: TMaskEdit
          Left = 127
          Top = 80
          Width = 127
          Height = 21
          EditMask = '999.999.999-99;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 14
          ParentFont = False
          TabOrder = 2
          Text = '   .   .   -  '
          OnExit = edtCPFExit
        end
      end
      object grpEndereco: TGroupBox
        Left = 10
        Top = 163
        Width = 377
        Height = 228
        Caption = 'Endereco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblCep: TLabel
          Left = 16
          Top = 24
          Width = 64
          Height = 13
          Caption = 'Consulta Cep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEndereco: TLabel
          Left = 16
          Top = 70
          Width = 55
          Height = 13
          Caption = 'Logradouro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNumero: TLabel
          Left = 16
          Top = 106
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblComplemento: TLabel
          Left = 111
          Top = 106
          Width = 65
          Height = 13
          Caption = 'Complemento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblBairro: TLabel
          Left = 16
          Top = 146
          Width = 28
          Height = 13
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCidade: TLabel
          Left = 16
          Top = 186
          Width = 33
          Height = 13
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 311
          Top = 186
          Width = 19
          Height = 13
          Caption = 'Pa'#237's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 264
          Top = 186
          Width = 33
          Height = 13
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object medtCep: TMaskEdit
          Left = 16
          Top = 43
          Width = 71
          Height = 21
          EditMask = '99999-999;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 9
          ParentFont = False
          TabOrder = 0
          Text = '     -   '
          OnExit = medtCepExit
        end
        object edtEndereco: TEdit
          Left = 16
          Top = 85
          Width = 345
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = edtEnderecoExit
        end
        object edtNumero: TEdit
          Left = 16
          Top = 120
          Width = 89
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnExit = edtNumeroExit
        end
        object edtComplemento: TEdit
          Left = 111
          Top = 120
          Width = 250
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnExit = edtComplementoExit
        end
        object edtBairro: TEdit
          Left = 16
          Top = 160
          Width = 345
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnExit = edtBairroExit
        end
        object edtCidade: TEdit
          Left = 16
          Top = 200
          Width = 242
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnExit = edtCidadeExit
        end
        object edtPais: TEdit
          Left = 311
          Top = 200
          Width = 50
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 7
          Text = 'BRA'
          OnEnter = edtPaisExit
          OnExit = edtPaisExit
        end
        object cbEstado: TComboBox
          Left = 264
          Top = 200
          Width = 41
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          Sorted = True
          TabOrder = 6
          OnExit = cbEstadoExit
          Items.Strings = (
            ''
            'AC'
            'AM'
            'AP'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Envio de Email'
      ImageIndex = 1
      ExplicitWidth = 420
      ExplicitHeight = 437
      object GroupBox1: TGroupBox
        Left = 3
        Top = 3
        Width = 377
        Height = 110
        Caption = 'Configura'#231#227'o do e-Mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label3: TLabel
          Left = 16
          Top = 24
          Width = 26
          Height = 13
          Caption = 'SMTP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 16
          Top = 64
          Width = 84
          Height = 13
          Caption = 'e-Mail Remetente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 191
          Top = 64
          Width = 30
          Height = 13
          Caption = 'Senha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 311
          Top = 24
          Width = 26
          Height = 13
          Caption = 'Porta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtSMTP: TEdit
          Left = 16
          Top = 38
          Width = 289
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'smtp.gmail.com'
          OnExit = edtSMTPExit
        end
        object edtEmailRemetente: TEdit
          Left = 16
          Top = 80
          Width = 169
          Height = 21
          Hint = 'Por padr'#227'o est'#225' configurado para enviar email  em conta de gmail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TextHint = 'usuario@gmail.com'
        end
        object edtSenha: TEdit
          Left = 191
          Top = 80
          Width = 169
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 3
        end
        object edtPort: TEdit
          Left = 311
          Top = 38
          Width = 50
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '587'
          OnExit = edtPortExit
        end
      end
      object Button1: TButton
        Left = 247
        Top = 418
        Width = 75
        Height = 25
        Caption = 'Enviar Email'
        TabOrder = 1
        OnClick = btnEnviaEmailClick
      end
      object Button2: TButton
        Left = 325
        Top = 418
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = btnCancelarClick
      end
      object btnEnviaEmail: TButton
        Left = 247
        Top = 315
        Width = 133
        Height = 25
        Caption = 'Enviar cadastro por Email'
        TabOrder = 3
        OnClick = btnEnviaEmailClick
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 119
        Width = 377
        Height = 190
        Caption = 'e-Mail Destinat'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object Label7: TLabel
          Left = 16
          Top = 24
          Width = 28
          Height = 13
          Caption = 'e-Mail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 16
          Top = 64
          Width = 39
          Height = 13
          Caption = 'Assunto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 16
          Top = 112
          Width = 29
          Height = 13
          Caption = 'Corpo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtDestinatario: TEdit
          Left = 16
          Top = 40
          Width = 344
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtAssunto: TEdit
          Left = 16
          Top = 80
          Width = 344
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object mmCorpo: TMemo
          Left = 16
          Top = 128
          Width = 344
          Height = 46
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 429
    Width = 408
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 96
    ExplicitTop = 64
    ExplicitWidth = 185
    object btnCancelar: TButton
      Left = 316
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
  end
end
