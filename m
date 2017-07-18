From: Guenter Roeck <linux@roeck-us.net>
Subject: parisc:generic-64bit_defconfig build failures due to 'kbuild: handle
 libs-y archives separately...'
Date: Tue, 18 Jul 2017 08:21:25 -0700
Message-ID: <20170718152125.GA15577@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Nicholas Piggin <npiggin@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

parisc64 builds, specifically generic-64bit_defconfig, fail to build
in mainline as follows.

hppa64-linux-ld:
hppa64-linux/bin/../lib/gcc/hppa64-linux/4.9.0/libgcc.a(_divdi3.o)(.text+0xec):
cannot reach $$divU
hppa64-linux/bin/../lib/gcc/hppa64-linux/4.9.0/libgcc.a(_divdi3.o):
In function `__divdi3':
libgcc2.c:(.text+0xec): relocation truncated to fit: R_PARISC_PCREL22F against
symbol `$$divU' defined in .text.div section in
hppa64-linux/bin/../lib/gcc/hppa64-linux/4.9.0/libgcc.a(_divU.o)
hppa64-linux-ld:
hppa64-linux/bin/../lib/gcc/hppa64-linux/4.9.0/libgcc.a(_divdi3.o)(.text+0x150):
cannot reach $$divU

[ and many more ]

This is after enabling CONFIG_MLONGCALLS; otherwise build failures are
more severe.

Building with gcc 6.3.0 fails as well with the same error.

Bisect points to commit 3a166fc2d4ef ("kbuild: handle libs-y archives
separately from built-in.o archives") as the culprit. Bisect log is
attached.

Guenter

---
# bad: [5771a8c08880cdca3bfb4a3fc6d309d6bba20877] Linux v4.13-rc1
# good: [9f45efb9286268e01d5022d34a58a68f53ca3072] Merge branch 'akpm' (patches from Andrew)
git bisect start 'HEAD~1' '9f45efb92862'
# bad: [af3c8d98508d37541d4bf57f13a984a7f73a328c] Merge tag 'drm-for-v4.13' of git://people.freedesktop.org/~airlied/linux
git bisect bad af3c8d98508d37541d4bf57f13a984a7f73a328c
# good: [305b9eddeec6d47778aafeded63ee8f37b9ddce0] Merge tag 'drm-intel-next-2017-06-19' of git://anongit.freedesktop.org/git/drm-intel into drm-next
git bisect good 305b9eddeec6d47778aafeded63ee8f37b9ddce0
# good: [ef3ad0898a60d30da7f170032992914998c366e5] Merge tag 'linux-kselftest-4.13-rc1-update' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
git bisect good ef3ad0898a60d30da7f170032992914998c366e5
# bad: [026d15f6b9878794fae1f794cae881ccd65052e5] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/shli/md
git bisect bad 026d15f6b9878794fae1f794cae881ccd65052e5
# bad: [8b6b3172ce02aef147f74b32ea11796c580f795c] Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
git bisect bad 8b6b3172ce02aef147f74b32ea11796c580f795c
# bad: [33198c165b7afd500f7b6b7680ef994296805ef0] Merge tag 'for-linus-v4.13-1' of git://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux
git bisect bad 33198c165b7afd500f7b6b7680ef994296805ef0
# bad: [98ced886dd79a7028d203ed8adea8452bbfb47b6] Merge tag 'kbuild-thinar-v4.13' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
git bisect bad 98ced886dd79a7028d203ed8adea8452bbfb47b6
# good: [16ffc4c39415e62c1d027d1bc59ee28e267d59f2] Merge tag 'kbuild-misc-v4.13' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
git bisect good 16ffc4c39415e62c1d027d1bc59ee28e267d59f2
# bad: [3a166fc2d4ef7a6b7e440271ee6bd1799c066605] kbuild: handle libs-y archives separately from built-in.o archives
git bisect bad 3a166fc2d4ef7a6b7e440271ee6bd1799c066605
# good: [df91b0262e2cff23db5eac77126ea0bef06d54d2] ia64: remove unneeded extra-y in Makefile.gate
git bisect good df91b0262e2cff23db5eac77126ea0bef06d54d2
# good: [9a6cfca4f4130444cb02536a4fdf7b6e285c713e] kbuild: thin archives use P option to ar
git bisect good 9a6cfca4f4130444cb02536a4fdf7b6e285c713e
# first bad commit: [3a166fc2d4ef7a6b7e440271ee6bd1799c066605] kbuild: handle libs-y archives separately from built-in.o archives
