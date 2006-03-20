From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] A sti 2.6.16-rc5-pa2 build failure?
Date: Mon, 20 Mar 2006 23:01:57 +0100
Message-ID: <IWG579$D587EF14E82061D3756F5E56CBD16D69@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "deller" <deller@gmx.de>,
 "parisc-linux" <parisc-linux@lists.parisc-linux.org>,
 "tsg45800" <tsg45800@scarlet.be>
To: "soete\.joel" <soete.joel@tiscali.be>
Return-Path: <soete.joel@tiscali.be>
List-ID: <linux-parisc.vger.kernel.org>

Hello Helge,

Sorry in advance for anoying you but it still failed, here what I did (as=

usual, usual is not always a good ref but):
  1/ grab http://cvs.parisc-linux.org/download/linux-2.6/linux-2.6.16-pa0=
.tar.bz2

  2/ untar it into /usr/src,
  3/ create also a new dir /usr/src/linux-2.6-pa-d32up-n
  4/ cp the CustomConfigD380 /usr/src/linux-2.6-pa-d32up-n/.config
  5/ cd /usr/src/linux-2.6.16-pa0
  6/ export KBUILD_OUTPUT=3D"../linux-2.6-pa-d32up-n"
  7/ make oldconfig (eventualy keep a trace)
  8/ make V=3D1 vmlinux 
  9/ always failed on the same pb:
  ld   -o .tmp_vmlinux1 -T arch/parisc/kernel/vmlinux.lds
arch/parisc/kernel/head.o   init/built-in.o --start-group  usr/built-in.o=
 
arch/parisc/mm/built-in.o  arch/parisc/kernel/built-in.o 
arch/parisc/math-emu/built-in.o arch/parisc/kernel/init_task.o 
kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o 
security/built-in.o  crypto/built-in.o  block/built-in.o  lib/lib.a 
arch/parisc/lib/lib.a `gcc -print-libgcc-file-name`  lib/built-in.o 
arch/parisc/lib/built-in.o `gcc -print-libgcc-file-name`  drivers/built-i=
n.o 
sound/built-in.o  net/built-in.o --end-group 
drivers/built-in.o: In function `sti_rom_copy': undefined reference to `g=
sc_readl'
drivers/built-in.o: In function `sti_rom_copy': undefined reference to `g=
sc_readl'
drivers/built-in.o: In function `sti_rom_copy': undefined reference to `g=
sc_readb'
drivers/built-in.o: In function `sti_bmode_rom_copy': undefined reference=
 to
`gsc_readl'
drivers/built-in.o: In function `sti_get_wmode_rom': undefined reference =
to
`gsc_readl'
drivers/built-in.o: In function `sti_try_rom_generic': undefined referenc=
e to
`gsc_readl'
drivers/built-in.o: In function `sti_try_rom_generic': undefined referenc=
e to
`gsc_readl'
drivers/built-in.o: In function `sti_try_rom_generic': undefined referenc=
e to
`gsc_readl'
drivers/built-in.o: more undefined references to `gsc_readl' follow
drivers/built-in.o: In function `sti_try_rom_generic': undefined referenc=
e to
`ioremap'
drivers/built-in.o: In function `sti_try_rom_generic': undefined referenc=
e to
`ioremap_nocache'
make[1]: *** [.tmp_vmlinux1] Error 1
make: *** [vmlinux] Error 2

btw I was convience that restauring asm/io.h (i.e. asm-parisc/io.h) 
because it's where gsc_ are defined (but I not a guru and missed somethin=
g else).

Thanks again,
    Joel

PS: for this d380 I can remove this option because it never had any grafi=
c
cards but my c110 has one and use nearly the same config file.=0A=0A-----=
----------------------------------------------------------=0AA free anti-=
spam and anti-virus filter on all Scarlet mailboxes=0AMore info on http:/=
/www.scarlet.be/
