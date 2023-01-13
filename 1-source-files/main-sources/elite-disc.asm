\ ******************************************************************************
\
\ BBC MASTER ELITE DISC IMAGE SCRIPT
\
\ BBC Master Elite was written by Ian Bell and David Braben and is copyright
\ Acornsoft 1986
\
\ The code on this site has been reconstructed from a disassembly of the version
\ released on Ian Bell's personal website at http://www.elitehomepage.org/
\
\ The commentary is copyright Mark Moxon, and any misunderstandings or mistakes
\ in the documentation are entirely my fault
\
\ The terminology and notations used in this commentary are explained at
\ https://www.bbcelite.com/about_site/terminology_used_in_this_commentary.html
\
\ The deep dive articles referred to in this commentary can be found at
\ https://www.bbcelite.com/deep_dives
\
\ ------------------------------------------------------------------------------
\
\ This source file produces one of the following SSD disc images, depending on
\ which release is being built:
\
\   * elite-master-sng47.ssd
\   * elite-master-compact.ssd
\
\ This can be loaded into an emulator or a real BBC Master.
\
\ ******************************************************************************

INCLUDE "1-source-files/main-sources/elite-build-options.asm"

_SNG47                  = (_VARIANT = 1)
_COMPACT                = (_VARIANT = 2)

IF _SNG47
 PUTFILE "3-assembled-output/M128Elt.bin", "M128Elt", &FF0E00, &FF0E43
 PUTFILE "3-assembled-output/BDATA.bin", "BDATA", &000000, &000000
 PUTFILE "3-assembled-output/BCODE.bin", "BCODE", &000000, &000000
ELIF _COMPACT
 PUTFILE "3-assembled-output/M128Elt.bin", "!BOOT", &000E00, &000E43
 PUTFILE "3-assembled-output/BDATA.bin", "BDATA", &001300, &001300
 PUTFILE "3-assembled-output/BCODE.bin", "ELITE", &001300, &002C6C
ENDIF

PUTFILE "3-assembled-output/README.txt", "README", &FFFFFF, &FFFFFF

\ Universe files added for Universe Editor

PUTFILE "1-source-files/universe-files/U.BOXART1.bin", "U.BOXART1", &000000, &000000
PUTFILE "1-source-files/universe-files/U.BOXART2.bin", "U.BOXART2", &000000, &000000
PUTFILE "1-source-files/universe-files/U.MANUAL.bin", "U.MANUAL", &000000, &000000
PUTFILE "1-source-files/universe-files/U.SHIPID.bin", "U.SHIPID", &000000, &000000

PUTFILE "1-source-files/basic-programs/B.CONVERT.bin", "B.CONVERT", &FF0E00, &FF8023
