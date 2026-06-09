#!/bin/bash

declare -A sites=(
  ["Whatsapp"]="https://web.whatsapp.com/"
  ["Facebook"]="https://www.facebook.com"
  ["Instagram"]="https://www.instagram.com/"
  ["YouTube"]="https://www.youtube.com"
  ["Discoard"]="https://discord.com/channels/@me"
  ["GitHub"]="https://github.com/juanest2025"
  ["La.movie"]="https://lamovie.org/"
  ["Tioplus.app"]="https://tioplus.app/"
  ["CuevaDeAna"]="https://cuevadeana.com/"
  ["Miraculos.to"]="https://miraculous.to/en/"
  ["Claude AI"]="https://claude.ai/new"
  ["ChatGPT"]="https://chatgpt.com/"
  ["DeepSeek"]="https://chat.deepseek.com/"
  ["Gemini"]="https://gemini.google.com/app"
  ["Sesame"]="https://app.sesame.com"
  ["AnimeFLV"]="https://www4.animeflv.net"
  ["Tioanime"]="https://tioanime.com/"
  ["anime-jl"]="https://www.anime-jl.net/"
  ["AnimeAV1"]="https://animeav1.com/"
  ["Animejara"]="https://animejara.com/"
  ["latanime"]="https://latanime.org/"
  ["Hentaila"]="https://hentaila.com/hub"
  ["hentai-jl"]="https://hentaijl.com/"
  ["Bancolombia"]="https://svpersonas.apps.bancolombia.com/autenticacion"
  ["Google"]="https://www.google.com/"
  ["Gmail"]="https://mail.google.com"
  ["Correo UdeA"]="https://mail.google.com/mail/u/0/#inbox"
  ["Ude@"]="https://udearroba.udea.edu.co/internos/login/index.php"
  ["Drive"]="https://drive.google.com/drive/my-drive"
  ["Calendar"]="https://calendar.google.com/calendar/u/0/r"
  ["Meet.google"]="https://meet.google.com/landing"
  ["Monkeytype"]="https://monkeytype.com/"
  ["cinecalidad.mx"]="https://cine-calidad.mx/"
  ["Zoom - Ingles IV"]="https://udea.zoom.us/j/92018362786"
  ["Zoom - Geometria Vectorial"]="https://udearroba.zoom.us/j/93110155705"
)

selection=$(printf "%s\n" "${!sites[@]}" | sort | fuzzel --dmenu --prompt="Sitios: ")

if [ -n "$selection" ]; then
    if [ "$selection" = "Correo UdeA" ] || [ "$selection" = "Ude@" ]; then
        google-chrome-stable "${sites[$selection]}" &
    else
        xdg-open "${sites[$selection]}" &
    fi
fi
