up:
  -brew update
  -brew upgrade
  -cargo install-update -a
  -uv self update --token $GITHUB_TOKEN
  -bun upgrade

cl:
  -brew cleanup -s
  -brew autoremove
  -cargo cache -a
  -uv cache prune

du:
  dust -r -b -n 128 -d 3

tap:
  tap -d -b

exc:
  tap --cli ~/Music/local/C418/Excursions --vol 40

r ip src:
  rsync -avz {{src}} somnia1337@{{ip}}:/home/somnia1337
