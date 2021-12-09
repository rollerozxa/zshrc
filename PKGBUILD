# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=zshrc-rollerozxa
pkgver=1.0.2
pkgrel=1
pkgdesc="ROllerozxa's Zsh config"
arch=(any)
url="https://github.com/rollerozxa/zshrc"
license=('MIT')
depends=('zsh-autosuggestions' 'zsh-completions' 'zsh-history-substring-search' 'zsh-syntax-highlighting')
optdepends=('lsd: replace ls with lsd')
options=()
install="zshrc.install"
source=("zshrc"
        "install-zshrc-rollerozxa.sh")
sha256sums=(SKIP SKIP)

package() {
	install -Dm644 "zshrc" "${pkgdir}/usr/share/rollerozxa/zshrc/.zshrc"
	install -Dm755 "install-zshrc-rollerozxa.sh" "${pkgdir}/usr/bin/install-zshrc-rollerozxa"
}
