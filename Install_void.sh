#!/bin/bash

# para correr: bash bootstrap.sh

# ── Travão de segurança ───────────────────────────────
# Muda para true assim que revires a lista de pacotes
#verificado=false
verificado=true
# ─────────────────────────────────────────────────────


clear   # ← limpa o terminal
printf '\033[2J\033[H'   # limpa o ecrã e move o cursor para o topo


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

pckg=(
 
  # ____ REPOSITÓRIOS EXTRA ______________________________________
  void-repo-nonfree              # repositório non-free
  void-repo-multilib             # repositório multilib (32bit)
  void-repo-multilib-nonfree     # repositório multilib non-free
 
  # ____ INTERNET ________________________________________________
  firefox                        # browser web
  speedtest-cli                  # teste de velocidade
  yt-dlp                         # download de vídeos
  syncthing                      # sincronização P2P
 
  # ____ OFFICE __________________________________________________
  pdfarranger                    # reorganizar PDFs
  libreoffice-base               # base de dados
  libreoffice-math               # fórmulas matemáticas
  libreoffice-calc               # folha de cálculo
  libreoffice-impress            # apresentações
  libreoffice-draw               # desenho vetorial
  libreoffice-dictionaries       # dicionários
  libreoffice-i18n-pt            # localização portuguesa
  mythes-pt_PT                   # thesaurus português
  hunspell-pt_PT                 # corretor ortográfico
  hyphen-pt                      # hifenização portuguesa
  vscode                         # editor de código
  git                            # controlo de versões
  gimp                           # editor de imagens
 
  # ____ FONTES __________________________________________________
  libreoffice-fonts              # fontes LibreOffice
  dina-font                      # fonte bitmap terminal
  dejavu-fonts-ttf               # fontes DejaVu
  terminus-font                  # fonte bitmap terminal
  noto-fonts-ttf-extra           # fontes Noto extra
  noto-fonts-ttf                 # fontes Noto base
  noto-fonts-emoji               # emojis Noto
  mkfontscale                    # gerar índices X11
  xfontsel                       # seletor de fontes X11
  xorg-fonts                     # fontes base Xorg
 
  # ____ THUNAR (gestor de ficheiros) ____________________________
  Thunar                         # gestor de ficheiros XFCE
  thunar-archive-plugin          # plugin de arquivos comprimidos
 
  # ____ ZIPS (arquivos comprimidos) _____________________________
  file-roller                    # gestor gráfico de arquivos
 
  # ____ PLAYERS E CODECS ________________________________________
  mpv                            # leitor de vídeo
 
  # ____ FERRAMENTAS GERAIS ______________________________________
  exiftool                       # metadados EXIF
  gparted                        # gestor de partições
  cheese                         # webcam
  flatpak                        # pacotes sandboxed
  lite-xl                        # editor de texto leve
 
  # ____ AMD GPU _________________________________________________
  amdvlk                         # driver Vulkan AMD
  amdvlk-32bit                   # driver Vulkan AMD 32bit
  xf86-video-amdgpu              # driver Xorg AMD
  mesa-vaapi                     # aceleração VAAPI
  mesa-vdpau                     # aceleração VDPAU
 
  # ____ GAMING __________________________________________________
  steam                          # plataforma Steam
  libgcc-32bit                   # GCC 32bit
  libstdc++-32bit                # C++ 32bit
  libdrm-32bit                   # DRM 32bit
  libglvnd-32bit                 # OpenGL 32bit
  mono                           # runtime .NET
  mesa-32bit                     # Mesa 32bit
  vulkan-loader                  # loader Vulkan
  mesa-dri-32bit                 # DRI Mesa 32bit
  mesa-vulkan-radeon             # Vulkan Radeon
 
  # ____ WINE ____________________________________________________
  wine                           # compatibilidade Windows
  wine-common                    # ficheiros comuns
  wine-gecko                     # motor web Wine
  wine-mono                      # .NET para Wine
  wine-tools                     # ferramentas Wine
  winegui                        # interface gráfica Wine
  winetricks                     # componentes Windows
  protontricks                   # winetricks para Steam/Proton
  wine-32bit                     # Wine 32bit
 
  # ____ BLUETOOTH _______________________________________________
  bluez                          # stack Bluetooth
  blueman                        # gestor Bluetooth gráfico
  libspa-bluetooth               # Bluetooth para PipeWire
 
  # ____ VIRTUALBOX ______________________________________________
  virtualbox-ose                 # VirtualBox
  virtualbox-ose-dkms            # módulos kernel
  virtualbox-ose-guest           # adições convidado
  virtualbox-ose-guest-dkms      # módulos kernel convidado
 
  # ____ DWM — dependências de compilação ________________________
  base-devel                     # ferramentas build
  libX11-devel                   # headers X11
  libXft-devel                   # headers Xft
  libXinerama-devel              # headers Xinerama
  freetype-devel                 # headers Freetype
  fontconfig-devel               # headers Fontconfig
 
  # ____ DWM — binários __________________________________________
  dwm                            # window manager
  dmenu                          # launcher
  slstatus                       # barra de estado
 
  # ____ DWM — desktop e utilitários _____________________________
  alacritty                      # terminal
  dunst                          # notificações
  lf                             # gestor ficheiros terminal
  volumeicon                     # volume no systray
  light                          # brilho do ecrã
  udevil                         # montar sem root
  gsimplecal-gtk3                # calendário
  htop                           # monitor processos
  flameshot                      # capturas de ecrã
  xtools                         # utilitários Void
  arandr                         # configuração monitores
  galculator                     # calculadora
  xinput                         # dispositivos entrada
  clipit                         # clipboard
  xkill                          # fechar janelas
  xdotool                        # automação janelas
  xprop                          # propriedades janelas
  tlp                            # gestão energia
  tlpui                          # interface TLP
  nerd-fonts-symbols-ttf         # símbolos Nerd Fonts
  nerd-fonts-ttf                 # Nerd Fonts
 
  # ____ LF — previews ___________________________________________
  ueberzug                       # preview imagens terminal
  odt2txt                        # ODT para texto
  bat                            # cat com highlighting
  ffmpegthumbnailer              # thumbnails vídeo
  exiftool                       # metadados (já em tools)
  jq                             # processar JSON
  lynx                           # browser terminal
  atool                          # arquivos comprimidos
  poppler                        # biblioteca PDF
  poppler-utils                  # utilitários PDF
 
)


seguranca() {
  if [[ "$verificado" == false ]]; then
    echo ""
    echo -e "${YELLOW}  ⚠  Lista de pacotes ainda não foi verificada.${RESET}"
    echo ""
    echo -e "  Abre o ficheiro \033[1mbootstrap.sh\033[0m e muda:"
    echo ""
    echo -e "    ${RED}verificado=false${RESET}  →  ${GREEN}verificado=true${RESET}"
    echo ""
    echo -e "  Depois corre o script novamente."
    echo ""
    exit 0
  fi
}

verificar_pckg() {
  local disponiveis=()
  local nao_encontrados=()

  seguranca

  echo ""
  echo -e "  A verificar se os ${YELLOW}${#pckg[@]}${RESET} pacotes existem nos repositórios..."
  echo -e "  ${GREEN}verde = existe${RESET}  |  ${RED}vermelho = não existe${RESET}"
  echo ""
  read -rp $'  Prima qualquer tecla para continuar...' -n1
  echo ""
  echo ""

  for pkg in "${pckg[@]}"; do
    if xbps-query -R "$pkg" &>/dev/null; then
      disponiveis+=("$pkg")
      echo -e "  ${GREEN}$pkg${RESET}"
    else
      nao_encontrados+=("$pkg")
      echo -e "  ${RED}$pkg${RESET}"
    fi
  done

  echo ""
  echo -e "${GREEN}✔ Disponíveis (${#disponiveis[@]})${RESET}"

  echo ""
  echo -e "${RED}✘ Não encontrados (${#nao_encontrados[@]})${RESET}"
  echo -e "  ${YELLOW}⚠  Atenção aos nomes — ex: thunar ≠ Thunar${RESET}"
  for p in "${nao_encontrados[@]}"; do
    echo -e "  ${RED}✘${RESET}  $p"
  done

  echo ""
  read -rp "  Continuar e instalar apenas os disponíveis? [S/n]: " resposta
  [[ "$resposta" =~ ^[Nn]$ ]] && exit 0

  sudo xbps-install -Sy "${disponiveis[@]}"
}

verificar_pckg