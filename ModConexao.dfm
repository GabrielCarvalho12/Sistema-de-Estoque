object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 287
  Width = 434
  object SQLConnection: TSQLConnection
    ConnectionName = 'estoque'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'User_Name=root'
      'Password=123'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'Database=systoq')
    Connected = True
    Left = 32
    Top = 16
  end
  object sdsclientes: TSQLDataSet
    CommandText = 'SELECT *  FROM CLIENTES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 48
    Top = 136
  end
  object dspclientes: TDataSetProvider
    DataSet = sdsclientes
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 136
    Top = 136
  end
  object cdsclientes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspclientes'
    Left = 232
    Top = 136
    object cdsclientescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsclientesnome: TStringField
      DisplayLabel = 'Nome '
      DisplayWidth = 18
      FieldName = 'nome'
      Size = 45
    end
    object cdsclientescpf: TStringField
      DisplayLabel = 'CPF '
      DisplayWidth = 14
      FieldName = 'cpf'
      Size = 45
    end
    object cdsclientesendereco: TStringField
      DisplayLabel = 'Endere'#231'o '
      DisplayWidth = 23
      FieldName = 'endereco'
      Size = 30
    end
    object cdsclientescidade: TStringField
      DisplayLabel = 'Cidade '
      DisplayWidth = 11
      FieldName = 'cidade'
    end
    object cdsclientesuf: TStringField
      DisplayLabel = 'UF '
      DisplayWidth = 2
      FieldName = 'uf'
      Size = 2
    end
    object cdsclientescep: TStringField
      DisplayLabel = 'CEP '
      DisplayWidth = 10
      FieldName = 'cep'
      Size = 10
    end
    object cdsclientesfone: TStringField
      DisplayLabel = 'Fone '
      DisplayWidth = 11
      FieldName = 'fone'
    end
    object cdsclientesemail: TStringField
      DisplayLabel = 'Email '
      DisplayWidth = 21
      FieldName = 'email'
      Size = 30
    end
  end
  object sdsprodutos: TSQLDataSet
    CommandText = 'SELECT *  FROM PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 48
    Top = 200
  end
  object dspprodutos: TDataSetProvider
    DataSet = sdsprodutos
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 136
    Top = 200
  end
  object cdsprodutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspprodutos'
    Left = 232
    Top = 200
    object cdsprodutoscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsprodutosnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 21
      FieldName = 'nome'
      Required = True
      Size = 45
    end
    object cdsprodutosfabricante: TStringField
      DisplayLabel = 'Fabricante'
      DisplayWidth = 16
      FieldName = 'fabricante'
    end
    object cdsprodutosquantidade: TIntegerField
      DisplayLabel = 'Qtd. em estoque'
      DisplayWidth = 15
      FieldName = 'quantidade'
    end
    object cdsprodutoscusto: TSingleField
      DisplayLabel = 'Custo'
      DisplayWidth = 13
      FieldName = 'custo'
      currency = True
    end
    object cdsprodutospreco: TSingleField
      DisplayLabel = 'Pre'#231'o'
      DisplayWidth = 11
      FieldName = 'preco'
      currency = True
    end
    object cdsprodutosunidade: TStringField
      DisplayLabel = 'Unidade de Medida'
      DisplayWidth = 15
      FieldName = 'unidade'
      Size = 2
    end
  end
end
