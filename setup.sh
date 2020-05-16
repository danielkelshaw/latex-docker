#!/bin/sh

set -e

SCHEME="$1"

if ! [[ "$SCHEME" =~ ^(full|medium|small|basic|minimal|teTeX|ConTeXt)$ ]]; then
    echo "$SCHEME" is not a valid scheme.i
    exit 1
fi

echo "--> Install TexLive"
mkdir -p /tmp/install-tl && cd /tmp/install-tl

MIRROR_URL="$(wget -q -S -O /dev/null http://mirror.ctan.org/ 2>&1 | sed -ne 's/.*Location: \(\w*\)/\1/p' | head -n 1)"
wget -nv "${MIRROR_URL}systems/texlive/tlnet/install-tl-unx.tar.gz"
wget -nv "${MIRROR_URL}systems/texlive/tlnet/install-tl-unx.tar.gz.sha512"
wget -nv "${MIRROR_URL}systems/texlive/tlnet/install-tl-unx.tar.gz.sha512.asc"

gpg --import /texlive.asc
gpg --verify ./install-tl-unx.tar.gz.sha512.asc
sha512sum -c ./install-tl-unx.tar.gz.sha512

mkdir -p /tmp/install-tl/installer

tar -xzf /tmp/install-tl/install-tl-unx.tar.gz -C /tmp/install-tl/installer --strip-components 1
/tmp/install-tl/installer/install-tl -scheme "$SCHEME" -profile=/texlive.profile

if [ "$SCHEME" != "full" ]; then
  tlmgr install latexmk
fi

echo "--> Clean Up"
rm -rf \
  /opt/texlive/texdir/install-tl \
  /opt/texlive/texdir/install-tl.log \
  /opt/texlive/texdir/texmf-dist/doc \
  /opt/texlive/texdir/texmf-dist/source \
  /opt/texlive/texdir/texmf-var/web2c/tlmgr.log \
  /root/.gnupg \
  /setup.sh \
  /texlive.profile \
  /texlive_pgp_keys.asc \
  /tmp/install-tl
