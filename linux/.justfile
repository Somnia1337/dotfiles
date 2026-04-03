up:
  -eos-update --paru
  -cargo install-update -a
  -uv self update --token $GITHUB_TOKEN
  -bun upgrade

cl:
  -sudo pacman -Sc --noconfirm
  -paru -Sc --noconfirm
  -sudo rm -rf /var/cache/pacman/pkg/download-*
  -sudo pacman -Rns $(pacman -Qdtq)
  -paru -Rns $(paru -Qdtq)
  -rm -rf $HOME/.cache/thumbnails
  -cargo cache -a
  -uv cache prune

du:
  dust -r -b -n 128 -d 3

tap:
  tap -d -b

exc:
  tap --cli ~/Music/C418/Excursions --vol 40

r ip src:
  rsync -avz {{src}} somnialu@{{ip}}:/Users/somnialu

bak:
  cd
  -tar -caf home.config.tar.zst .config
  -tar -caf home.others.tar.zst --exclude='.local' --exclude='.rustup' --exclude='.cache' --exclude='.cargo' --exclude='.config' --exclude='.pub-cache' -C ~ $(cd ~ && printf '%s\n' .* | grep -v '^\.$\|^\.\.$')
