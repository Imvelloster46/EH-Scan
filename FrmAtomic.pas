{
     EH-Scanner - Desenvolvido por Rafael Augusto ( Brlo0ping) rafatkd2@hotmail.com
}
unit FrmAtomic;


interface

uses
  Windows, Messages, SysUtils, IdHashMessageDigest, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,ShellApi, ComCtrls, sSkinProvider, sSkinManager, StdCtrls, sEdit,
  sSpinEdit, sSplitter, ToolWin, CategoryButtons, Buttons, acProgressBar,
  OleCtrls, SHDocVw, sDialogs, ImgList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP,UrlMon, Menus, IEDownload,
  IEMultiDownload, IEParser, EwbEventsComp, IdDNSResolver, IdRawBase,
  IdRawClient, IdIcmpClient, IdWhois, IdCoder, IdCoder3to4, IdCoderMIME,
  FileCtrl, jpeg, acPNG;

type  {MySql Injection }
    VerificaFalhaSql = class(TThread)
    protected
    procedure Execute; override;
    end;



type
    TForm1 = class(TForm)
    Skn: TsSkinManager;
    WebBusca: TWebBrowser;
    Save: TsSaveDialog;
    Img: TImageList;
    http: TIdHTTP;
    MemoFalhas: TMemo;
    MenuSql: TPopupMenu;
    Abrirpgina1: TMenuItem;
    Salvar1: TMenuItem;
    Limpar1: TMenuItem;
    Importareiniciar1: TMenuItem;
    pg: TsProgressBar;
    PageHash: TPageControl;
    PageBusca: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label3: TLabel;
    TxtDorks: TComboBox;
    TxtPaginas: TsSpinEdit;
    MemoBusca: TMemo;
    TabSql: TTabSheet;
    StatusSql: TLabel;
    Label4S: TLabel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Aspa: TEdit;
    LvSql: TListView;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    TxtDns: TEdit;
    BitBtn1: TBitBtn;
    Icmp: TIdIcmpClient;
    MemoSaveVul: TMemo;
    ImgDns: TImageList;
    Panel3: TPanel;
    Web_Dns: TWebBrowser;
    Whois: TIdWhois;
    Panel4: TPanel;
    MemoWhois: TMemo;
    TxtWhois: TEdit;
    SiteLabel: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    PageMd5: TTabSheet;
    Panel5: TPanel;
    Label5: TLabel;
    TxtMd5: TEdit;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    MemoMd5: TMemo;
    LvMd5: TListView;
    Open: TOpenDialog;
    LabelMd5: TLabel;
    SpeedButton13: TSpeedButton;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    TxtHashString: TEdit;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Txtbase64Entrada: TEdit;
    Label8: TLabel;
    TxtBase64Saida: TEdit;
    BitBtn3: TBitBtn;
    Base: TIdDecoderMIME;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    TxtHashOn: TEdit;
    Button1: TButton;
    Panel6: TPanel;
    WebHash: TWebBrowser;
    MenuBuscaSites: TPopupMenu;
    Buscar1: TMenuItem;
    PageSpider: TTabSheet;
    Panel7: TPanel;
    Label10: TLabel;
    TxtAdmin: TEdit;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    LabelAdmFinder: TLabel;
    Label11: TLabel;
    BoxFiles: TFileListBox;
    BoxDir: TDirectoryListBox;
    Label12: TLabel;
    MemoExecuta: TMemo;
    Refresh: TTimer;
    PageConfig: TTabSheet;
    Label13: TLabel;
    MemoConfDorks: TMemo;
    Label14: TLabel;
    BitBtn4: TBitBtn;
    BtnSave: TBitBtn;
    MemoConfMysql: TMemo;
    Label15: TLabel;
    MemoConfMd5: TMemo;
    TabSheet5: TTabSheet;
    Image5: TImage;
    Label16: TLabel;
    LabelSql: TLabel;
    BtnTema: TCheckBox;
    MemoTema: TMemo;
    Escondernabandeja1: TMenuItem;
    Icon: TTrayIcon;
    MIcon: TPopupMenu;
    Mostrar1: TMenuItem;
    Sair1: TMenuItem;
    procedure TxtDorksEnter(Sender: TObject);
    procedure WebBuscaDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure WebBuscaProgressChange(ASender: TObject; Progress,
      ProgressMax: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtnEnviaClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure httpWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure httpWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure httpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure Abrirpgina1Click(Sender: TObject);
    procedure TabSqlShow(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure TxtDnsEnter(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Web_DnsProgressChange(ASender: TObject; Progress,
      ProgressMax: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure TxtWhoisEnter(Sender: TObject);
    procedure TxtWhoisExit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure WebHashDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure TabSheet3Show(Sender: TObject);
    procedure WebHashProgressChange(ASender: TObject; Progress,
      ProgressMax: Integer);
    procedure Buscar1Click(Sender: TObject);
    procedure PageSpiderEnter(Sender: TObject);
    procedure PageSpiderExit(Sender: TObject);
    procedure PageSpiderShow(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure RefreshTimer(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure PageConfigEnter(Sender: TObject);
    procedure PageConfigExit(Sender: TObject);
    procedure TabSheet4Enter(Sender: TObject);
    procedure TabSheet4Exit(Sender: TObject);
    procedure TabSheet5Enter(Sender: TObject);
    procedure TabSheet5Exit(Sender: TObject);
    procedure BtnTemaClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Escondernabandeja1Click(Sender: TObject);
    procedure Mostrar1Click(Sender: TObject);
    procedure IconClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;

// Busca Sites
   Dork : String ;
   Pag  : String ;
   I:   Integer;

//Mysql Injection
    BuscaBing : Integer;
    A , B : Integer;
    Puxa : String ;
    FalhaSql : Integer;

// Ipreverse Dns
   Dns : String ;

// Brute Force Md5
   countMd5, C : Integer;
   StrMd5 : String ;
   Verifica  : TidHashMessageDigest5;
   Md5Atual : String ;
   Hash : String ;


// Admin Finder
   SiteAdmin : String;
   Apaga : String;

implementation

uses ThreadVerificaSites, RefSitesMd5;

{$R *.dfm}

procedure TForm1.Sair1Click(Sender: TObject);
begin
     if MessageDlg('Deseja realmente fechar o programa?', MtWarning,[mbYes,mbcancel],0) = mrYes then
     Application.Terminate;

end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
    MemoWhois.Clear;
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
    MemoMd5.Lines.LoadFromFile('conf\md5.txt');
end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin

     CountMd5 := MemoMd5.Lines.Count;
     StrMd5 := TxtMd5.Text;

     for C := 0 to CountMd5 - 1 do
     Begin

         Md5Atual := MemoMd5.Lines.Strings[C];
         Verifica := TidHashMessageDigest5.Create;
         Hash := Verifica.HashStringAsHex(Md5Atual);

         if (Hash = StrMd5) then
         Begin
         LvMd5.Items.Add.SubItems.Add(Md5Atual);
         End;

         Pg.Position := C;
         Pg.Max := CountMd5;

     End;


end;

procedure TForm1.SpeedButton13Click(Sender: TObject);
begin
    MemoMd5.Clear;
    Pg.Position := 0 ;
end;

procedure TForm1.SpeedButton14Click(Sender: TObject);
begin
    if (TxtAdmin.Text = '') then
   Begin
       MessageDlg('Digite um site!',MtInformation,[MbOk],0);
   End
        else

        Begin
           SiteAdmin := 'wget.exe -P site -nH  -r '+TxtAdmin.Text;
           Winexec(PAnsiChar(AnsiString(SiteAdmin)),SW_SHOW);
           Form1.SetFocus;
           sleep(1000);
           Refresh.Enabled := True;
           BoxDir.Directory := 'C:\EH-Scan\site\';
        End;
end;

procedure TForm1.SpeedButton15Click(Sender: TObject);
begin
      Refresh.Enabled := False;
      BoxDir.Directory := 'C:\EH-Scan\';
      BoxFiles.Directory := 'C:\EH-Scan\';
      BoxDir.Clear;
      BoxFiles.Clear;

      Sleep(300);

      Winexec('taskkill /im wget.exe',Sw_hide);
      WinExec('C:\EH-Scan\del.bat', Sw_hide);
      MessageDlg('Parado!',MtInformation,[MbOk],0);
      WinExec('C:\EH-Scan\del.bat', Sw_hide);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin

     Dork := TxtDorks.Text;
     Pag  := TxtPaginas.Text + '1';
     WebBusca.Navigate('http://br.bing.com/search?q='+dork+'&first='+Pag+'&FORM=PERE');

end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
 { Mysql Injection C�digo }
  Var

      VerificaFalha : VerificaFalhaSql;

begin

     MemoFalhas.Lines.LoadFromFile('C:\EH-Scan\conf\ref.txt');
     if (MemoBusca.Lines.Text  = '') then
     Begin

     MessageDlg('Sites n�o Encontrados!',MtInformation,[MbOk],0);
     PageBusca.Show;

     End
        else
     Begin
       StatusSql.Caption := 'Iniciando...';
       VerificaFalha := VerificaFalhaSql.Create(True);
       VerificaFalha.FreeOnTerminate := True;
       VerificaFalha.Resume;
     End;

end;


procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
     if Save.Execute then
     MemoBusca.Lines.SaveToFile(Save.FileName);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
       MemoBusca.Clear;
       Pg.Position := 0;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
     Http.Disconnect;
     StatusSql.Caption := 'Parado!';
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
     if (Save.Execute()) then
     MemoSaveVul.Lines.SaveToFile(Save.FileName);
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
    LvSql.Clear;
    StatusSql.Caption := 'Parado!';
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
     with Whois Do
     begin
          MemoWhois.Lines.Text := Whois(trim(TxtWhois.Text));
     end;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
    if Save.Execute then
    MemoWhois.Lines.SaveToFile(Save.FileName);
end;

procedure TForm1.TabSheet1Show(Sender: TObject);
begin
     Pg.Position := 0;
end;

procedure TForm1.TabSheet3Show(Sender: TObject);
begin
   Pg.Position := 0;
end;

procedure TForm1.TabSheet4Enter(Sender: TObject);
begin
     Pg.Visible := False;
end;

procedure TForm1.TabSheet4Exit(Sender: TObject);
begin
     Pg.Visible := True;
end;

procedure TForm1.TabSheet5Enter(Sender: TObject);
begin
    Pg.Visible := False;
end;

procedure TForm1.TabSheet5Exit(Sender: TObject);
begin
    Pg.Visible := True;
end;

procedure TForm1.TabSqlShow(Sender: TObject);
begin
     Pg.Position := 0 ;
end;

procedure TForm1.TxtDnsEnter(Sender: TObject);
begin
    TxtDns.Clear;
end;

procedure TForm1.TxtDorksEnter(Sender: TObject);
begin

{  Dorks Text}

     TxtDorks.Items.LoadFromFile('conf\dorks.txt');

end;

procedure TForm1.TxtWhoisEnter(Sender: TObject);
begin
   TxtWhois.Clear;
end;

procedure TForm1.TxtWhoisExit(Sender: TObject);
begin
TxtWhois.Text := 'Ex: (site.com)';
end;

procedure TForm1.WebBuscaDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
     MemoBusca.Lines.Add('http://'+WebBusca.OleObject.Document.All.Tags('cite').Item(0).InnerText);
     MemoBusca.Lines.Add('http://'+WebBusca.OleObject.Document.All.Tags('cite').Item(1).InnerText);
     MemoBusca.Lines.Add('http://'+WebBusca.OleObject.Document.All.Tags('cite').Item(2).InnerText);
     MemoBusca.Lines.Add('http://'+WebBusca.OleObject.Document.All.Tags('cite').Item(3).InnerText);
     MemoBusca.Lines.Add('http://'+WebBusca.OleObject.Document.All.Tags('cite').Item(4).InnerText);
     MemoBusca.Lines.Add('http://'+WebBusca.OleObject.Document.All.Tags('cite').Item(5).InnerText);
     MemoBusca.Lines.Add('http://'+WebBusca.OleObject.Document.All.Tags('cite').Item(6).InnerText);
     MemoBusca.Lines.Add('http://'+WebBusca.OleObject.Document.All.Tags('cite').Item(7).InnerText);
     MemoBusca.Lines.Add('http://'+WebBusca.OleObject.Document.All.Tags('cite').Item(8).InnerText);
     MemoBusca.Lines.Add('http://'+WebBusca.OleObject.Document.All.Tags('cite').Item(9).InnerText);
     Label3.Caption := IntToStr(MemoBusca.Lines.Count)+' Sites encontrados!';
end;

procedure TForm1.WebBuscaProgressChange(ASender: TObject; Progress,
  ProgressMax: Integer);
begin

    if (Progress >=1)and(ProgressMax>1) then
    Pg.Position := Round((Progress * 100)Div ProgressMax);
    Pg.Visible := True;

end;

procedure TForm1.WebHashDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
Var
 Verifica : String ;

begin //Quebra de hash


    Verifica := WebHash.OleObject.Document.documentElement.innerText;

    if (Pos('Sorry',Verifica))>0 then
    Begin
    WebHash.Navigate('http://md5.hashcracking.com/search.php?md5='+TxtHashOn.Text);
    End;




    Verifica := WebHash.OleObject.Document.documentElement.innerText;

    if (Pos('No results returned.',Verifica))>0 then
    Begin
    WebHash.Navigate('http://md5.noisette.ch/md5.php?hash='+TxtHashOn.Text);
    End;




    Verifica := WebHash.OleObject.Document.documentElement.innerText;

    if (Pos('<error>',Verifica))>0 then
    Begin
    WebHash.Navigate('http://md5-db.de/'+TxtHashOn.Text+'.html');
    End;



    Verifica := WebHash.OleObject.Document.documentElement.innerText;

    if (Pos('Der',Verifica))>0 then
    Begin
    WebHash.Stop;
    RHash.Show;
    End;

end;

procedure TForm1.WebHashProgressChange(ASender: TObject; Progress,
  ProgressMax: Integer);
begin
    if (Progress >=1)and(ProgressMax>1) then
    Pg.Position := Round((Progress * 100)Div ProgressMax);
    Pg.Visible := True;
end;

procedure TForm1.Web_DnsProgressChange(ASender: TObject; Progress,
  ProgressMax: Integer);
begin
    if (Progress >=1)and(ProgressMax>1) then
    Pg.Position := Round((Progress * 100)Div ProgressMax);
    Pg.Visible := True;
end;

procedure TForm1.Abrirpgina1Click(Sender: TObject);
begin
HlinkNavigateString(nil,PwideChar(LvSql.Selected.SubItems.Text));
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
     Dns := 'http://www.yougetsignal.com/tools/web-sites-on-web-server/?remoteAddress='+TxtDns.Text;
     if (Pos('http://', TxtDns.Text)>0) then
     Begin
         MessageDlg('O link n�o pode conter http:// !',MtInformation,[mBoK],0);
     End

        else

     Begin
          Web_Dns.Navigate(Dns);
     End;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);

Var

   Conta : Integer;
   StrTxt:String ;

begin

      StrTxt := TxtHashString.Text;
      Conta  := Length(StrTxt);

       if (Conta = 32) then     //Md5
       Begin
         MessageDlg('O tipo de encripta��o � Md5!',mtInformation,[MbOk],0);
       End;


       if (Conta = 40) then
       Begin
          MessageDlg('O tipo de encripta��o � SHA1!',mtInformation,[MbOk],0);
       End;


       if (Conta = 64) then
       Begin
         MessageDlg('O tipo de encripta��o � SHA 256!',mtInformation,[MbOk],0);
       End;


       if (Conta = 98) then
       Begin
         MessageDlg('O tipo de encripta��o � SHA 384!',mtInformation,[MbOk],0);
       End;


       if (Conta = 16) then
       Begin
         MessageDlg('O tipo de encripta��o � MySQL 4.1!',mtInformation,[MbOk],0);
       End;


       if (Conta = 41) then
       Begin
          MessageDlg('O tipo de encripta��o � do MySQL 5!',mtInformation,[MbOk],0);
       End;

       if (Pos('$',StrTxt))>0 then
       Begin
           MessageDlg('O tipo de encripta��o � Md5Wordpress!',mtInformation,[MbOk],0);
       End;


       if (Pos('=',StrTxt))>0 then
       Begin
            MessageDlg('O tipo de encripta��o � Base64 ',mtInformation,[MbOk],0);
       End;

end;

procedure TForm1.BitBtn3Click(Sender: TObject); { Base 64 Inicio }
Var
   StrEntrada64 : String ;
   DecodeBase64 : String;
begin
   StrEntrada64 := TxtBase64Entrada.Text;
   DecodeBase64 :=  Base.DecodeString(StrEntrada64);
   TxtBase64Saida.Text := DecodeBase64
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
   MemoConfDorks.Lines.LoadFromFile('conf\dorks.txt');
   MemoConfMysql.Lines.LoadFromFile('conf\ref.txt');
   MemoConfMd5.Lines.LoadFromFile('conf\md5.txt');
   BtnSave.Enabled := True;
end;

procedure TForm1.BtnEnviaClick(Sender: TObject);
begin
  LvSql.Items.Add.SubItems.Add('a');
end;

procedure TForm1.BtnSaveClick(Sender: TObject);
begin
    MemoConfDorks.Lines.SaveToFile('conf\dorks.txt');
    MemoConfMysql.Lines.SaveToFile('conf\ref.txt');
    MemoConfMd5.Lines.SaveToFile('conf\md5.txt');
    MessageDlg('Configura��es efetuada com sucesso!',mtInformation,[MboK],0);
    BtnSave.Enabled:=False;
    Form1.Hide;
    WinExec('EH-Scan.exe',Sw_Show);
    Application.Terminate;
end;

procedure TForm1.Buscar1Click(Sender: TObject);
begin

     Dork := TxtDorks.Text;
     Pag  := TxtPaginas.Text + '1';
     WebBusca.Navigate('http://br.bing.com/search?q='+dork+'&first='+Pag+'&FORM=PERE');

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
WebHash.Navigate('http://www.netmd5crack.com/cgi-bin/Crack.py?InputHash='+TxtHashOn.Text);
end;

procedure TForm1.BtnTemaClick(Sender: TObject);
begin
     if (BtnTema.Checked) then
     Begin
     MemoTema.Lines.Text := '0';
     MemoTema.Lines.SaveToFile('C:\EH-Scan\conf\tema.txt');
     End
     else
     Begin
     MemoTema.Lines.Text := '1';
     MemoTema.Lines.SaveToFile('C:\EH-Scan\conf\tema.txt');
     End;

end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
    MemoTema.Lines.Text := '1';
    MemoTema.Lines.SaveToFile('C:\EH-Scan\conf\tema.txt');
end;

procedure TForm1.Escondernabandeja1Click(Sender: TObject);
begin
    Form1.Hide;
    Icon.Visible := True;
    Icon.Animate := True;
    Icon.BalloonTitle := 'EH-Scan';
    Icon.BalloonHint:='Scanenando sites...';
    Icon.ShowBalloonHint;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
    PageBusca.Show;

    MemoTema.Lines.LoadFromFile('conf\tema.txt');
    if (MemoTema.Lines.Text = '0') then
    Begin
      Skn.Active := False;
      BtnTema.Checked:= True;
    End
    else
    Begin
        Skn.Active := True;
        BtnTema.Checked:= False;
    End;


end;

procedure TForm1.httpWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
     Pg.Position := AWorkCount;
end;

procedure TForm1.httpWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
     Pg.Position := 0 ;
     Pg.Max := AWorkCountMax;
end;

procedure TForm1.httpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
     Pg.Position := Pg.Max;
end;

procedure TForm1.IconClick(Sender: TObject);
begin
    Icon.Visible := False;
    Form1.Show;
end;

procedure TForm1.Limpar1Click(Sender: TObject);
begin
    LvSql.Clear;
    StatusSql.Caption := 'Parado!';
end;

procedure TForm1.Mostrar1Click(Sender: TObject);
begin
    Icon.Visible := False;
    Form1.Show;
end;

procedure TForm1.PageConfigEnter(Sender: TObject);
begin
     Pg.Visible:= False;
end;

procedure TForm1.PageConfigExit(Sender: TObject);
begin
 Pg.Visible:= True;
end;

procedure TForm1.PageSpiderEnter(Sender: TObject);
begin
    Pg.Visible := False;
end;

procedure TForm1.PageSpiderExit(Sender: TObject);
begin
    Pg.Visible := True;
end;

procedure TForm1.PageSpiderShow(Sender: TObject);
begin
  BoxDir.Clear;
  BoxFiles.Clear;
end;

procedure TForm1.RefreshTimer(Sender: TObject);
begin
     BoxDir.Update;
     BoxFiles.Directory := BoxDir.Directory;
     BoxFiles.Update;
end;



procedure VerificaFalhaSql.Execute;{ VerificaSql }

begin
With Form1 Do Begin // Inicio do form1

      BuscaBing := MemoBusca.Lines.Count;

      for A := 0 to BuscaBing - 1 do
      Begin
           try

           Puxa := Http.Get(MemoBusca.Lines.Strings[A]+Aspa.Text);
           FalhaSql := MemoFalhas.Lines.Count;

           for B := 0 to FalhaSql do
           Begin
               StatusSql.Caption := 'Scaneando o seguinte site: ' + MemoBusca.Lines.Strings[A]+Aspa.Text;
               if (pos(MemoFalhas.Lines.Strings[B],Puxa)) > 0 then
               LvSql.Items.Add.SubItems.Add(MemoBusca.Lines.Strings[A]);
               MemoSaveVul.Lines.Add(MemoBusca.Lines.Strings[A]);
           End
           Except
            //MessageDlg('N�o foi possivel verificar o seguinte site: ! '+MemoBusca.Lines.Strings[A]+'',MtInformation,[MbOk],0);
            LabelSql.Caption := 'N�o foi possivel verificar o seguinte site: ! '+MemoBusca.Lines.Strings[A]+'';
           end;

           end;

      MessageDlg('Verifica��o termianda! '+IntToStr(Lvsql.Items.Count)+' sites vulneraveis',MtInformation,[MbOk],0);

End; // fim do form 1

end;

end.
