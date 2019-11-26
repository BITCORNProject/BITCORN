#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

BITCORND=${BITCORND:-$BINDIR/bitcornd}
BITCORNCLI=${BITCORNCLI:-$BINDIR/bitcorn-cli}
BITCORNTX=${BITCORNTX:-$BINDIR/bitcorn-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/bitcorn-wallet}
BITCORNQT=${BITCORNQT:-$BINDIR/qt/bitcorn-qt}

[ ! -x $BITCORND ] && echo "$BITCORND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
read -r -a BTCVER <<< "$($BITCORNCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }')"

# Create a footer file with copyright content.
# This gets autodetected fine for bitcornd if --version-string is not set,
# but has different outcomes for bitcorn-qt and bitcorn-cli.
echo "[COPYRIGHT]" > footer.h2m
$BITCORND --version | sed -n '1!p' >> footer.h2m

for cmd in $BITCORND $BITCORNCLI $BITCORNTX $WALLET_TOOL $BITCORNQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
