Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1FE44482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Dec 2001 15:41:49 -0700 (MST)
Date: Mon, 10 Dec 2001 23:41:39 +0100 (CET)
From: Peter Mottram <peter@petescaff.com>
To: Chuck Slivkoff <charles_slivkoff@hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 2.4.16-pa16 (from CVS) fails on "make depend"
In-Reply-To: <3C1539B8.A3175E86@hp.com>
Message-ID: <Pine.LNX.4.42.0112102340470.14615-100000@r6.petescaff.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Chuck

Did you do a 'make oldconfig' after copying in your old .config & before
anything else?

R.
PeteM

On Mon, 10 Dec 2001, Chuck Slivkoff wrote:

> I did a CVS update yesterday and tried to build a kernel today, using
> the same .config from my last successful build (2.4.9-pa78).
>
> After a "make clean", "make depend" is failing with the error below.
> I've done a "make menuconfig" and things seem to be OK.
>
> Anyone have any suggestions?
>
> -chuck
>
>
>
> make[6]: Entering directory `/usr/src/linux/drivers/char/joystick'
> /usr/src/linux/scripts/mkdep -D__KERNEL__ -I/usr/src/linux/include -Wall
> -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer
> -fno-strict-aliasing -fno-common -D__linux__ -pipe -fno-strength-reduce
> -mno-space-regs -mfast-indirect-calls -mdisable-fpregs
> -ffunction-sections -march=1.1 -mschedule=7100LC  -- a3d.c adi.c
> amijoy.c analog.c cobra.c cs461x.c db9.c emu10k1-gp.c gamecon.c
> gameport.c gf2k.c grip.c iforce.c interact.c lightning.c magellan.c
> ns558.c pcigame.c serio.c serport.c sidewinder.c spaceball.c spaceorb.c
> stinger.c tmdc.c turbografx.c warrior.c > .depend
> make[6]: Leaving directory `/usr/src/linux/drivers/char/joystick'
> make -C mwave fastdep
> make: *** mwave: No such file or directory.  Stop.
> make: Entering an unknown directorymake: Leaving an unknown
> directorymake[5]: *** [_sfdep_mwave] Error 2
> make[5]: Leaving directory `/usr/src/linux/drivers/char'
> make[4]: *** [fastdep] Error 2
> make[4]: Leaving directory `/usr/src/linux/drivers/char'
> make[3]: *** [_sfdep_char] Error 2
> make[3]: Leaving directory `/usr/src/linux/drivers'
> make[2]: *** [fastdep] Error 2
> make[2]: Leaving directory `/usr/src/linux/drivers'
> make[1]: *** [_sfdep_drivers] Error 2
> make[1]: Leaving directory `/usr/src/linux'
> make: *** [dep-files] Error 2
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
