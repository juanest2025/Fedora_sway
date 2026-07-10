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
  ["Cuevana"]="https://cue-vana3.org/"
  ["Cuevana main"]="https://cuevana.ca/"
  ["Goojara"]="https://ww1.goojara.to/ejdWP7"
  ["kimcartoon"]="https://kimcartoon.si/CartoonList"
  ["kimcartoon 2"]="https://kimcartoon.com.co/"
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
  ["Search Pirate"]="https://search.brave.com/"
  ["Google"]="https://www.google.com/"
  ["Perplexity"]="https://www.perplexity.ai/"
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
  ["Love Next Door 1"]="https://www.doramasyt.com/dorama/amor-en-la-puerta-de-al-lado-latino-sub-espanol"
  ["Love Next Door 2"]="https://doramasflix.in/doramas-online/love-next-door"
  ["It's ok not to be ok"]="https://www.doramasyt.com/dorama/its-okay-to-not-be-okay-sub-espanol"
  ["King the land"]="https://www.doramasyt.com/dorama/king-the-land-latino-sub-espanol"
  ["La reina de las lagrimas"]="https://www.doramasyt.com/dorama/la-reina-de-las-lagrimas-latino-sub-espanol"
  ["Twenty-Five, Twenty-One"]="https://www.doramasyt.com/dorama/twenty-five-twenty-one-sub-espanol"
  ["Amor entre lineas"]="https://www.doramasyt.com/dorama/amor-entre-lineas-latino-sub-espanol"
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
