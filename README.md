# Laura Pula! 🌸

Jogo infantil de corrida: a Laura corre pelo jardim e você ajuda ela a pular flores, pedras, arbustos,
cogumelos e abelhas, e a pegar estrelinhas. Feito para a minha filha.

**Jogar no navegador:** https://sandieh.online/laura-pula/

## Controles

- **Computador:** Espaço ou ⬆ = pular (aperte 2x para o pulo duplo) · ⬇ = abaixar · M = som
- **Celular/tablet:** toque na tela = pular · botão **Abaixar**

## Downloads

- **Windows:** `LauraPula-Setup.exe` (abre numa janela própria do Edge, funciona sem internet)
- **Android:** `LauraPula.apk` (tela cheia, deitado; Android 5.0 ou mais novo)

Os dois estão no [Releases](https://github.com/SandiehMoreira/laura-pula/releases/latest) e no site.

## Estrutura

| Pasta | O que é |
|---|---|
| `index.html` | o jogo inteiro (HTML + canvas + JavaScript puro) |
| `img/` | poses da Laura já recortadas (corrida em 4 quadros, pulando, abaixada, parada, ops) |
| `icone/` | ícones (site, Windows e Android) |
| `arte/` | folha de poses original, gerada por IA de imagem a partir de fotos |
| `windows/` | instalador Inno Setup |
| `android/` | app Android (WebView) e script de build sem Gradle |

## Gerar os instaladores

```sh
# Windows (Inno Setup 6)
"%LOCALAPPDATA%\Programs\Inno Setup 6\ISCC.exe" windows\LauraPula.iss   # -> build/LauraPula-Setup.exe

# Android (JDK 17 + Android SDK build-tools 34 + platform android-34), no Git Bash
sh android/gerar-apk.sh                                                 # -> build/LauraPula.apk
```

A chave de assinatura do APK (`android/laura.keystore` + `android/keystore.properties`) fica fora do Git.
Guarde uma cópia: sem ela não dá para lançar atualizações que instalem por cima.
