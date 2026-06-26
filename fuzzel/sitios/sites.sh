#!/bin/bash

declare -A sites=(
  ["Whatsapp"]="https://web.whatsapp.com/"
  ["Facebook"]="https://www.facebook.com"
  ["Instagram"]="https://www.instagram.com/"
  ["YouTube"]="https://www.youtube.com"
  ["Discoard"]="https://discord.com/channels/@me"
  ["TikTok"]="https://www.tiktok.com/es-419/"
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
  ["Tioanime"]="https://tioanime.com/"
  ["Tiohentai"]="https://tiohentai.com/"
  ["anime-jl"]="https://www.anime-jl.net/"
  ["AnimeAV1"]="https://animeav1.com/"
  ["Animejara"]="https://animejara.com/"
  ["latanime"]="https://latanime.org/"
  ["Hentaila"]="https://hentaila.com/hub"
  ["hentai-jl"]="https://hentaijl.com/"
  ["uncensoredhentai"]="https://uncensoredhentai.xxx/"  
  ["JKanimes"]="https://jkanime.net/"
  ["hentaiJK"]="https://hentaijk.com/"
  ["Bancolombia"]="https://svpersonas.apps.bancolombia.com/autenticacion"
  ["Google"]="https://www.google.com/"
  ["Gmail"]="https://mail.google.com"
  ["Google Photos"]="http://photos.google.com/"
  ["Correo UdeA"]="https://mail.google.com/mail/u/0/#inbox"
  ["Ude@"]="https://udearroba.udea.edu.co/internos/login/index.php"
  ["Drive"]="https://drive.google.com/drive/my-drive"
  ["Calendar"]="https://calendar.google.com/calendar/u/0/r"
  ["Meet.google"]="https://meet.google.com/landing"
  ["Monkeytype"]="https://monkeytype.com/"
  ["Google Maps"]="https://maps.google.com/"
  ["cinecalidad.mx"]="https://cine-calidad.mx/"
  ["Zoom - Ingles IV"]="https://udea.zoom.us/j/92018362786"
  ["Zoom - Geometria Vectorial"]="https://udearroba.zoom.us/j/93110155705"
  ["XVideos"]="https://www.xvideos.com/"
  ["Pornhub"]="https://es.pornhub.com/"
  ["Google Docs"]="https://docs.new"
  ["Google slides"]="https://slides.new"
  ["Word"]="https://word.cloud.microsoft/"
  ["Power Point"]="https://powerpoint.cloud.microsoft/"
)

selection=$(printf "%s\n" "${!sites[@]}" | sort | fuzzel --dmenu --prompt="Sitios: ")

if [ -n "$selection" ]; then
    case "$selection" in
        "Correo UdeA"|"Ude@")
            google-chrome-stable "${sites[$selection]}" &
            ;;
        "XVideos"|"Pornhub")
            brave-browser --tor "${sites[$selection]}" &
            ;;
        *)
            xdg-open "${sites[$selection]}" &
            ;;
    esac
fi
