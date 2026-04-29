up:
  -brew update
  -brew upgrade --greedy
  -cargo install-update -a
  -uv self update --token $GITHUB_TOKEN
  -bun upgrade

cl:
  -brew cleanup -s
  -brew autoremove
  -cargo cache -a
  -uv cache prune

tap:
  tap -d -b

exc:
  tap --cli ~/Music/local/C418/Excursions --vol 30

toeos ip src:
  rsync -avz {{src}} somnia1337@{{ip}}:/home/somnia1337

tomba ip src:
  rsync -avz {{src}} somnialu@{{ip}}:/Users/somnialu
