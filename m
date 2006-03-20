From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re:[parisc-linux] A sti 2.6.16-rc5-pa2 build failure?
Date: Mon, 20 Mar 2006 12:19:58 +0100
Message-ID: <IWFBHA$6574DD99581BECB275DA2287BF1C9843@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
To: "Helge Deller" <deller@gmx.de>
Return-Path: <soete.joel@tiscali.be>
List-ID: <linux-parisc.vger.kernel.org>

Hello Helge,

> 
> Just a short report build failure of my custom kernel for my d380 (32bi=
t up):
>    ld   -o .tmp_vmlinux1 -T arch/parisc/kernel/vmlinux.lds
> arch/parisc/kernel/head.o   init/built-in.o --start-group  usr/built-in=
.o 
> arch/parisc/mm/built-in.o  arch/parisc/kernel/built-in.o 
> arch/parisc/math-emu/built-in.o arch/parisc/kernel/init_task.o 
> kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o 
> security/built-in.o  crypto/built-in.o  block/built-in.o  lib/lib.a 
> arch/parisc/lib/lib.a `gcc -print-libgcc-file-name`  lib/built-in.o 
> arch/parisc/lib/built-in.o `gcc -print-libgcc-file-name`  drivers/built=
-in.o 
> sound/built-in.o  net/built-in.o --end-group 
> drivers/built-in.o: In function `sti_rom_copy': undefined reference to
`gsc_readl'
> drivers/built-in.o: In function `sti_rom_copy': undefined reference to
`gsc_readl'
> drivers/built-in.o: In function `sti_rom_copy': undefined reference to
`gsc_readb'
> drivers/built-in.o: In function `sti_bmode_rom_copy': undefined referen=
ce to
> `gsc_readl'
> drivers/built-in.o: In function `sti_get_wmode_rom': undefined referenc=
e to
> `gsc_readl'
> drivers/built-in.o: In function `sti_try_rom_generic': undefined refere=
nce to
> `gsc_readl'
> drivers/built-in.o: In function `sti_try_rom_generic': undefined refere=
nce to
> `gsc_readl'
> drivers/built-in.o: In function `sti_try_rom_generic': undefined refere=
nce to
> `gsc_readl'
> drivers/built-in.o: more undefined references to `gsc_readl' follow
> drivers/built-in.o: In function `sti_try_rom_generic': undefined refere=
nce to
> `ioremap'
> drivers/built-in.o: In function `sti_try_rom_generic': undefined refere=
nce to
> `ioremap_nocache'
> make[1]: *** [.tmp_vmlinux1] Error 1
> make: *** [vmlinux] Error 2
> 
it seems that this reverting hunk:
--- drivers/video/sticore.h.Orig        2006-03-20 11:50:46.000000000 +01=
00
+++ drivers/video/sticore.h     2006-03-20 11:51:47.000000000 +0100
@@ -36,7 +36,7 @@
  
 #define STI_WAIT 1
 
-#include <linux/config.h> /* for CONFIG_HPPA_IOREMAP */
+#include <asm/io.h> /* for CONFIG_HPPA_IOREMAP */
 
 #ifdef CONFIG_HPPA_IOREMAP
 
=3D=3D=3D=3D<>=3D=3D=3D=3D

help (at least to rebuild this kernel).

If you agre, could you check in (I don't have cvs access)?

TIA,
    Joel=0A=0A-----------------------------------------------------------=
----=0AA free anti-spam and anti-virus filter on all Scarlet mailboxes=0A=
More info on http://www.scarlet.be/
