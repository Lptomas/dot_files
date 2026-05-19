#!/bin/bash

# para correr: bash dotfiles.sh

# ── Pastas ─────────────────────────────────────────────────────
gitfolder="dot_files"
git_folder="$HOME/$gitfolder/Home"
git_dot_folder="$HOME/$gitfolder/Home/.config"
home_dot_config="$HOME/.config"

# ── Ficheiros na HOME (~/) ─────────────────────────────────────
home_files=(
  .xinitrc
  .bashrc
  .bash_profile
  .zshenv
  .zshrc
)

# ── Ficheiros individuais em ~/.config ─────────────────────────
individual_files=(
  # "'Code\ -\ OSS/'/User/settings.json"  # Atenção aos espaços em Branco, resulta ?
  "Code - OSS/User/settings.json"
  # "Code - OSS/User/keybindings.json"
  # "Code - OSS/User/snippets/"
)

# ── Pastas em ~/.config ────────────────────────────────────────

config_folders=(
  alacritty
  zsh
  dwm
  dwm_slstatus
  dwm_dmenu
  lf
  htop
  Thunar
  xfce4
  mpv
)


#ln -s $git_dot_folder/Code\ -\ OSS//User/settings.json $home_dot_config/Code\ -\ OSS//User/settings.json
# ══════════════════════════════════════════════════════════════════

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

separador() { echo -e "${CYAN}────────────────────────────────────────────────────${RESET}"; }
titulo()    { echo ""; echo -e "${BOLD}${CYAN}$1${RESET}"; separador; }
ok()        { echo -e "  ${GREEN}✔${RESET}  $1"; }
info()      { echo -e "  ${CYAN}→${RESET}  $1"; }
aviso()     { echo -e "  ${YELLOW}⚠${RESET}  $1"; }
erro()      { echo -e "  ${RED}✘${RESET}  $1"; }
pausa()     {
  echo ""
  echo ""
  read -rp $'  Prima qualquer tecla para continuar...' -n1
  echo ""
  echo ""
}

# ══════════════════════════════════════════════════════════════════

mostrar_pastas() {
  titulo "Pastas configuradas"
  echo -e "  ${BOLD}De (git):${RESET}"
  info "git_folder     →  $git_folder"
  info "git_dot_folder →  $git_dot_folder"
  echo ""
  echo -e "  ${BOLD}Para (local):${RESET}"
  info "HOME           →  $HOME"
  info "home/.config   →  $home_dot_config"
  pausa
}

# ── Cruzar o que existe no gitfolder com os arrays ────────────────
cruzar_pastas() {
  titulo "Cruzamento — $gitfolder vs Arrays configurados"

  local nao_configuradas=()

  # ── Ficheiros na HOME ────────────────────────────────────────
  echo -e "  ${BOLD}Ficheiros em GIT : $git_folder :${RESET}"
  for f in "$git_folder"/.*; do
    [[ -d "$f" ]] && continue
    nome=$(basename "$f")
    [[ "$nome" == "." || "$nome" == ".." ]] && continue

    encontrado=false
    for h in "${home_files[@]}"; do
      [[ "$h" == "$nome" ]] && encontrado=true && break
    done

    if [[ "$encontrado" == true ]]; then
      echo -e "  ${GREEN}✔${RESET}  $nome"
    else
      echo -e "  ${RED}✘${RESET}  $nome  ${YELLOW}← não configurado${RESET}"
      nao_configuradas+=("~/$nome")
    fi
  done

  # ── Pastas em ~/.config (só nível raiz) ──────────────────────
  echo ""
  echo -e "  ${BOLD}Pastas em GIT : $git_dot_folder :${RESET}"
  for pasta in "$git_dot_folder"/*/; do
    [[ ! -d "$pasta" ]] && continue
    nome=$(basename "$pasta")

    encontrado=false
    for d in "${config_folders[@]}"; do
      [[ "$d" == "$nome" ]] && encontrado=true && break
    done

    if [[ "$encontrado" == true ]]; then
      echo -e "  ${GREEN}✔${RESET}  ~/.config/$nome"
    else
      echo -e "  ${RED}✘${RESET}  ~/.config/$nome  ${YELLOW}← não configurado${RESET}"
      nao_configuradas+=("~/.config/$nome")
    fi
  done

  # ── Ficheiros individuais ────────────────────────────────────
  echo ""
  echo -e "  ${BOLD}Ficheiros individuais em ~/.config/ :${RESET}"
  for f in "${individual_files[@]}"; do
    src="$git_dot_folder/$f"
    if [[ -e "$src" ]]; then
      echo -e "  ${GREEN}✔${RESET}  ~/.config/$f"
    else
      echo -e "  ${RED}✘${RESET}  ~/.config/$f  ${YELLOW}← não existe na origem${RESET}"
      nao_configuradas+=("~/.config/$f")
    fi
  done

  # ── Resumo ───────────────────────────────────────────────────
  echo ""
  separador
  if [[ "${#nao_configuradas[@]}" -gt 0 ]]; then
    echo -e "  ${RED}${BOLD}✘ Não configurados (${#nao_configuradas[@]}):${RESET}"
    for item in "${nao_configuradas[@]}"; do
      echo -e "  ${RED}✘${RESET}  $item"
    done
    echo ""
    echo -e "  ${YELLOW}⚠  Adiciona ao array correspondente se quiseres criar o symlink.${RESET}"
    echo ""
    echo -e "  ${RED}ATENCAO aos espaços nas pastas, geram problemas${RESET}" 
    echo ""
    echo -e "  ${RED}ATENCAO aos individual_files :${RESET}" 
    echo ""
      for entry in "${individual_files[@]}"; do   
        echo "       ${entry}"
    done


  else
    echo -e "  ${GREEN}${BOLD}✔ Tudo configurado.${RESET}"
  fi

  pausa
}

# ── Preview — mostra o que vai fazer ─────────────────────────
preview() {
  titulo "Preview — o que vai ser executado"

  # ── Ficheiros na HOME ────────────────────────────────────────
  echo -e "  ${BOLD}Ficheiros em ~/ :${RESET}"
  echo ""
  for f in "${home_files[@]}"; do
    echo -e "  ${RED}rm    ${RESET}  ${DIM}$HOME/${RESET}${BOLD}$f${RESET}"
    echo -e "  ${GREEN}ln -s ${RESET}  ${DIM}$git_folder/${RESET}${BOLD}$f${RESET}  →  ${DIM}$HOME/${RESET}${BOLD}$f${RESET}"
    echo ""
  done

  # ── Pastas em ~/.config ──────────────────────────────────────
  echo -e "  ${BOLD}Pastas em ~/.config/ :${RESET}"
  echo ""
  for d in "${config_folders[@]}"; do
    echo -e "  ${RED}rm    ${RESET}  ${DIM}$home_dot_config/${RESET}${BOLD}$d${RESET}"
    echo -e "  ${GREEN}ln -s ${RESET}  ${DIM}$git_dot_folder/${RESET}${BOLD}$d${RESET}  →  ${DIM}$home_dot_config/${RESET}${BOLD}$d${RESET}"
    echo ""
  done

  # ── Ficheiros individuais ────────────────────────────────────
  echo -e "  ${BOLD}Ficheiros individuais em ~/.config/ :${RESET}"
  echo ""
  for f in "${individual_files[@]}"; do
    echo -e "  ${RED}rm    ${RESET}  ${DIM}$home_dot_config/${RESET}${BOLD}$f${RESET}"
    echo -e "  ${GREEN}ln -s ${RESET}  ${DIM}$git_dot_folder/${RESET}${BOLD}$f${RESET}  →  ${DIM}$home_dot_config/${RESET}${BOLD}$f${RESET}"
    echo ""
  done

  separador
  echo -e "  ${YELLOW}⚠  Confirmas que queres executar estas operações?${RESET}"
  echo ""
  read -rp "  Continuar? [S/n]: " resposta
  [[ "$resposta" =~ ^[Nn]$ ]] && echo "" && echo -e "  ${YELLOW}Cancelado.${RESET}" && echo "" && exit 0
  echo ""
}

# ── Apagar symlinks antigos ───────────────────────────────────
apagar_symlinks() {
  titulo "A apagar symlinks antigos"

  echo -e "  ${BOLD}Em ~/ :${RESET}"
  for f in "${home_files[@]}"; do
    alvo="$HOME/$f"
    if [[ -L "$alvo" ]]; then
      rm "$alvo" && ok "removido: ~/$f"
    elif [[ -e "$alvo" ]]; then
      aviso "não é symlink (ficheiro real): ~/$f — ignorado"
    else
      info "não existe: ~/$f"
    fi
  done

  echo ""
  echo -e "  ${BOLD}Em ~/.config/ :${RESET}"
  for d in "${config_folders[@]}"; do
    alvo="$home_dot_config/$d"
    if [[ -L "$alvo" ]]; then
      rm "$alvo" && ok "removido: ~/.config/$d"
    elif [[ -e "$alvo" ]]; then
      aviso "não é symlink (pasta real): ~/.config/$d — ignorado"
    else
      info "não existe: ~/.config/$d"
    fi
  done

  echo ""
  echo -e "  ${BOLD}Ficheiros individuais:${RESET}"
  for f in "${individual_files[@]}"; do
    alvo="$home_dot_config/$f"
    if [[ -L "$alvo" ]]; then
      rm "$alvo" && ok "removido: ~/.config/$f"
    elif [[ -e "$alvo" ]]; then
      aviso "não é symlink: ~/.config/$f — ignorado"
    else
      info "não existe: ~/.config/$f"
    fi
  done

  pausa
}

# ── Criar symlinks novos ──────────────────────────────────────
criar_symlinks() {
  titulo "A criar symlinks"

  echo -e "  ${BOLD}Em ~/ :${RESET}"
  for f in "${home_files[@]}"; do
    src="$git_folder/$f"
    dst="$HOME/$f"
    if [[ ! -e "$src" ]]; then
      erro "origem não existe: $src"
    elif [[ -L "$dst" ]]; then
      aviso "já existe symlink: ~/$f"
    else
      ln -s "$src" "$dst" && ok "ln -s $src → ~/$f"
    fi
  done

  echo ""
  echo -e "  ${BOLD}Em ~/.config/ :${RESET}"
  mkdir -p "$home_dot_config"
  for d in "${config_folders[@]}"; do
    src="$git_dot_folder/$d"
    dst="$home_dot_config/$d"
    if [[ ! -e "$src" ]]; then
      erro "origem não existe: $src"
    elif [[ -L "$dst" ]]; then
      aviso "já existe symlink: ~/.config/$d"
    else
      ln -s "$src" "$dst" && ok "ln -s .../$d → ~/.config/$d"
    fi
  done

  echo ""
  echo -e "  ${BOLD}Ficheiros individuais:${RESET}"
  for f in "${individual_files[@]}"; do
    src="$git_dot_folder/$f"
    dst="$home_dot_config/$f"
    mkdir -p "$(dirname "$dst")"
    if [[ ! -e "$src" ]]; then
      erro "origem não existe: $src"
    elif [[ -L "$dst" ]]; then
      aviso "já existe symlink: ~/.config/$f"
    else
      ln -s "$src" "$dst" && ok "ln -s .../$f → ~/.config/$f"
    fi
  done

  pausa
}

resumo() {
  titulo "Concluído"
  ok "Symlinks criados com sucesso."
  echo ""
  aviso "Se algo falhou, verifica se a pasta '$gitfolder' existe em $HOME"
  echo ""
}

# ── Main ──────────────────────────────────────────────────────
clear
printf '\033[2J\033[H'   # Aponta o cursor para o INICIO

mostrar_pastas
cruzar_pastas
preview
#apagar_symlinks
#criar_symlinks
resumo
