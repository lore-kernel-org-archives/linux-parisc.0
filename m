Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.medianet-world.de (unknown [213.157.0.162])
	by dsl2.external.hp.com (Postfix) with SMTP id 59945485F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Mar 2003 06:51:23 -0700 (MST)
Message-ID: <3E6F3BA1.6050707@bluehash.de>
Date: Wed, 12 Mar 2003 14:52:33 +0100
From: =?ISO-8859-15?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] Compile-Failure Kernel 2.5.64-pa4
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

Hi there,

I tried to compiled the newest kernel from CVS. After "make distclean" 
and "make oldconfig", "make vmlinux" stops with the following error:

make -f scripts/Makefile.build obj=drivers/input/misc
  gcc -Wp,-MD,drivers/input/misc/.gsc_ps2.o.d -D__KERNEL__ -Iinclude 
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing 
-fno-common -pipe -mno-space-regs -mfast-indirect-calls -mdisable-fpregs 
-ffunction-sections -march=1.1 -mschedule=7100LC -fomit-frame-pointer 
-nostdinc -iwithprefix include    -DKBUILD_BASENAME=gsc_ps2 
-DKBUILD_MODNAME=gsc_ps2 -c -o drivers/input/misc/gsc_ps2.o 
drivers/input/misc/gsc_ps2.c
drivers/input/misc/gsc_ps2.c:59:27: linux/pc_keyb.h: Datei oder 
Verzeichnis nicht gefunden
drivers/input/misc/gsc_ps2.c:345:40: macro "input_regs" requires 2 
arguments, but only 1 given
drivers/input/misc/gsc_ps2.c: In function `gscps2_kbd_docode':
drivers/input/misc/gsc_ps2.c:345: `input_regs' undeclared (first use in 
this function)
drivers/input/misc/gsc_ps2.c:345: (Each undeclared identifier is 
reported only once
drivers/input/misc/gsc_ps2.c:345: for each function it appears in.)
drivers/input/misc/gsc_ps2.c:392:32: macro "input_regs" requires 2 
arguments, but only 1 given
drivers/input/misc/gsc_ps2.c: In function `gscps2_mouse_docode':
drivers/input/misc/gsc_ps2.c:392: `input_regs' undeclared (first use in 
this function)
drivers/input/misc/gsc_ps2.c: In function `gscps2_hpkeyb_event':
drivers/input/misc/gsc_ps2.c:454: `KBD_CMD_SET_LEDS' undeclared (first 
use in this function)
drivers/input/misc/gsc_ps2.c:471: `KBD_CMD_ENABLE' undeclared (first use 
in this function)
drivers/input/misc/gsc_ps2.c: In function `gscps2_kbd_probe':
drivers/input/misc/gsc_ps2.c:501: `KBD_CMD_SET_LEDS' undeclared (first 
use in this function)
drivers/input/misc/gsc_ps2.c:503: `KBD_CMD_ENABLE' undeclared (first use 
in this function)
drivers/input/misc/gsc_ps2.c: In function `gscps2_mouse_probe':
drivers/input/misc/gsc_ps2.c:561: `AUX_ENABLE_DEV' undeclared (first use 
in this function)
drivers/input/misc/gsc_ps2.c: In function `gscps2_probe':
drivers/input/misc/gsc_ps2.c:584: warning: `ret' might be used 
uninitialized in this function
make[3]: *** [drivers/input/misc/gsc_ps2.o] Fehler 1
make[2]: *** [drivers/input/misc] Fehler 2
make[1]: *** [drivers/input] Fehler 2
make: *** [drivers] Fehler 2
ruediger@gandalf:/usr/src/linux-2.5$

Can I delete the line, which includes "linux/pc_keyb" or how can I avoid 
this error?

TIA, Rüdiger
