Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5AE4485F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Mar 2003 07:18:47 -0700 (MST)
Date: Wed, 12 Mar 2003 15:18:44 +0100
Subject: Re: [parisc-linux] Compile-Failure Kernel 2.5.64-pa4
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v551)
Cc: parisc-linux@lists.parisc-linux.org
To: =?ISO-8859-1?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <3E6F3BA1.6050707@bluehash.de>
Message-Id: <88753163-5495-11D7-A259-0030656F07A2@esiee.fr>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

that's 2.5, aka _development_ kernel, and the keyboard driver is=20
b0rken. There'll be a fix soon, please be patient; but unless you want=20=

to contribute to 2.5, you don't want to use it.

Anyway, if your box boots using serial console, you don't need that=20
driver.

Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

Le mercredi, 12 mar 2003, =E0 14:52 Europe/Paris, R=FCdiger Scholz a =
=E9crit :

> Hi there,
>
> I tried to compiled the newest kernel from CVS. After "make distclean"=20=

> and "make oldconfig", "make vmlinux" stops with the following error:
>
> make -f scripts/Makefile.build obj=3Ddrivers/input/misc
>  gcc -Wp,-MD,drivers/input/misc/.gsc_ps2.o.d -D__KERNEL__ -Iinclude=20
> -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing=20
> -fno-common -pipe -mno-space-regs -mfast-indirect-calls=20
> -mdisable-fpregs -ffunction-sections -march=3D1.1 -mschedule=3D7100LC=20=

> -fomit-frame-pointer -nostdinc -iwithprefix include   =20
> -DKBUILD_BASENAME=3Dgsc_ps2 -DKBUILD_MODNAME=3Dgsc_ps2 -c -o=20
> drivers/input/misc/gsc_ps2.o drivers/input/misc/gsc_ps2.c
> drivers/input/misc/gsc_ps2.c:59:27: linux/pc_keyb.h: Datei oder=20
> Verzeichnis nicht gefunden
> drivers/input/misc/gsc_ps2.c:345:40: macro "input_regs" requires 2=20
> arguments, but only 1 given
> drivers/input/misc/gsc_ps2.c: In function `gscps2_kbd_docode':
> drivers/input/misc/gsc_ps2.c:345: `input_regs' undeclared (first use=20=

> in this function)
> drivers/input/misc/gsc_ps2.c:345: (Each undeclared identifier is=20
> reported only once
> drivers/input/misc/gsc_ps2.c:345: for each function it appears in.)
> drivers/input/misc/gsc_ps2.c:392:32: macro "input_regs" requires 2=20
> arguments, but only 1 given
> drivers/input/misc/gsc_ps2.c: In function `gscps2_mouse_docode':
> drivers/input/misc/gsc_ps2.c:392: `input_regs' undeclared (first use=20=

> in this function)
> drivers/input/misc/gsc_ps2.c: In function `gscps2_hpkeyb_event':
> drivers/input/misc/gsc_ps2.c:454: `KBD_CMD_SET_LEDS' undeclared (first=20=

> use in this function)
> drivers/input/misc/gsc_ps2.c:471: `KBD_CMD_ENABLE' undeclared (first=20=

> use in this function)
> drivers/input/misc/gsc_ps2.c: In function `gscps2_kbd_probe':
> drivers/input/misc/gsc_ps2.c:501: `KBD_CMD_SET_LEDS' undeclared (first=20=

> use in this function)
> drivers/input/misc/gsc_ps2.c:503: `KBD_CMD_ENABLE' undeclared (first=20=

> use in this function)
> drivers/input/misc/gsc_ps2.c: In function `gscps2_mouse_probe':
> drivers/input/misc/gsc_ps2.c:561: `AUX_ENABLE_DEV' undeclared (first=20=

> use in this function)
> drivers/input/misc/gsc_ps2.c: In function `gscps2_probe':
> drivers/input/misc/gsc_ps2.c:584: warning: `ret' might be used=20
> uninitialized in this function
> make[3]: *** [drivers/input/misc/gsc_ps2.o] Fehler 1
> make[2]: *** [drivers/input/misc] Fehler 2
> make[1]: *** [drivers/input] Fehler 2
> make: *** [drivers] Fehler 2
> ruediger@gandalf:/usr/src/linux-2.5$
>
> Can I delete the line, which includes "linux/pc_keyb" or how can I=20
> avoid this error?
>
> TIA, R=FCdiger
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>
