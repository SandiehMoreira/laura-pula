; Laura Pula! - instalador (Inno Setup 6)
; Gerar: "%LOCALAPPDATA%\Programs\Inno Setup 6\ISCC.exe" windows\LauraPula.iss  -> build\LauraPula-Setup.exe
; Instala so para o usuario (sem pedir administrador). O jogo abre numa janela propria do Edge (modo app).

#define AppName "Laura Pula!"
#define AppVersion "1.1.0"

[Setup]
AppId={{B5D2E8F1-6A3C-4C7E-9F21-3E8A7D5C4B19}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
AppPublisher=SanMobile
AppPublisherURL=https://sandieh.online/#laura-pula
DefaultDirName={autopf}\LauraPula
DefaultGroupName={#AppName}
DisableProgramGroupPage=yes
DisableDirPage=yes
PrivilegesRequired=lowest
WizardStyle=modern
SetupIconFile=..\icone\icone.ico
UninstallDisplayIcon={app}\icone\icone.ico
UninstallDisplayName={#AppName}
OutputDir=..\build
OutputBaseFilename=LauraPula-Setup
Compression=lzma2/ultra64
SolidCompression=yes

[Languages]
Name: "ptbr"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Messages]
ptbr.WelcomeLabel2=Este assistente vai instalar o [name/ver] no seu computador.%n%nA Laura corre pelo jardim e voce ajuda ela a pular flores, pedras e abelhas e a pegar estrelinhas!%n%nFunciona sem internet.

[Tasks]
Name: "desktopicon"; Description: "Criar atalho na Area de Trabalho"; GroupDescription: "Opcoes:"

[Files]
Source: "..\index.html"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\img\*.png"; DestDir: "{app}\img"; Flags: ignoreversion
Source: "..\icone\icone.ico"; DestDir: "{app}\icone"; Flags: ignoreversion
Source: "..\icone\icone-192.png"; DestDir: "{app}\icone"; Flags: ignoreversion
Source: "..\icone\apple-touch-icon.png"; DestDir: "{app}\icone"; Flags: ignoreversion

[Icons]
Name: "{group}\{#AppName}"; Filename: "{code:Navegador}"; Parameters: "{code:Parametros}"; IconFilename: "{app}\icone\icone.ico"
Name: "{group}\Desinstalar {#AppName}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#AppName}"; Filename: "{code:Navegador}"; Parameters: "{code:Parametros}"; IconFilename: "{app}\icone\icone.ico"; Tasks: desktopicon

[Run]
Filename: "{code:Navegador}"; Parameters: "{code:Parametros}"; Description: "Jogar agora"; Flags: nowait postinstall skipifsilent shellexec

[Code]
// Edge em modo app (janela sem barra de endereco). Sem Edge: abre o index.html no navegador padrao.
function Navegador(Param: String): String;
begin
  Result := ExpandConstant('{commonpf32}\Microsoft\Edge\Application\msedge.exe');
  if not FileExists(Result) then
    Result := ExpandConstant('{commonpf64}\Microsoft\Edge\Application\msedge.exe');
  if not FileExists(Result) then
    Result := ExpandConstant('{app}\index.html');
end;

function Parametros(Param: String): String;
var
  Url: String;
begin
  Result := '';
  if Navegador('') <> ExpandConstant('{app}\index.html') then
  begin
    Url := ExpandConstant('{app}\index.html');
    StringChangeEx(Url, '\', '/', True);
    Result := '--app="file:///' + Url + '" --window-size=1020,560';
  end;
end;
