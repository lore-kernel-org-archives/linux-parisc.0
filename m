Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id F17C5482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Dec 2001 15:39:54 -0700 (MST)
Received: from xatlrelay1.atl.hp.com (xatlrelay1.atl.hp.com [15.45.89.190])
	by atlrel7.hp.com (Postfix) with ESMTP id C59C21F87C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Dec 2001 17:36:30 -0500 (EST)
Received: from xatlbh3.atl.hp.com (xatlbh3.atl.hp.com [15.45.89.188])
	by xatlrelay1.atl.hp.com (Postfix) with ESMTP id 56EC91F519
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Dec 2001 17:39:53 -0500 (EST)
Message-ID: <3C1539B8.A3175E86@hp.com>
Date: Mon, 10 Dec 2001 17:39:52 -0500
From: Chuck Slivkoff <charles_slivkoff@hp.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.4.16-pa16 (from CVS) fails on "make depend"
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

I did a CVS update yesterday and tried to build a kernel today, using
the same .config from my last successful build (2.4.9-pa78).

After a "make clean", "make depend" is failing with the error below.
I've done a "make menuconfig" and things seem to be OK.

Anyone have any suggestions?

-chuck



make[6]: Entering directory `/usr/src/linux/drivers/char/joystick'
/usr/src/linux/scripts/mkdep -D__KERNEL__ -I/usr/src/linux/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer
-fno-strict-aliasing -fno-common -D__linux__ -pipe -fno-strength-reduce
-mno-space-regs -mfast-indirect-calls -mdisable-fpregs
-ffunction-sections -march=1.1 -mschedule=7100LC  -- a3d.c adi.c
amijoy.c analog.c cobra.c cs461x.c db9.c emu10k1-gp.c gamecon.c
gameport.c gf2k.c grip.c iforce.c interact.c lightning.c magellan.c
ns558.c pcigame.c serio.c serport.c sidewinder.c spaceball.c spaceorb.c
stinger.c tmdc.c turbografx.c warrior.c > .depend
make[6]: Leaving directory `/usr/src/linux/drivers/char/joystick'
make -C mwave fastdep
make: *** mwave: No such file or directory.  Stop.
make: Entering an unknown directorymake: Leaving an unknown
directorymake[5]: *** [_sfdep_mwave] Error 2
make[5]: Leaving directory `/usr/src/linux/drivers/char'
make[4]: *** [fastdep] Error 2
make[4]: Leaving directory `/usr/src/linux/drivers/char'
make[3]: *** [_sfdep_char] Error 2
make[3]: Leaving directory `/usr/src/linux/drivers'
make[2]: *** [fastdep] Error 2
make[2]: Leaving directory `/usr/src/linux/drivers'
make[1]: *** [_sfdep_drivers] Error 2
make[1]: Leaving directory `/usr/src/linux'
make: *** [dep-files] Error 2
