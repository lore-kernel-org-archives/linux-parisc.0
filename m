Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (unknown [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE67E482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Jun 2002 21:36:07 -0600 (MDT)
Date: Wed,  5 Jun 2002 22:34:19 -0500
Message-Id: <200206052234.AA1633878578@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: "marc " <marc@centraltx.com>
Reply-To: <marc@centraltx.com>
To: marc <marc@centraltx.com>,
	"Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Building my first kernel
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

Call me crazy, but I cannot get this to work. There doesn't seem
to be a 'palo' target for make. When I run make palo it just
runs the make all (below are the first few lines).

Any Ideas?

seki:/usr/src/kernel-source-2.4.18-hppa# make palo
. scripts/mkversion > .tmpversion
gcc -D__KERNEL__ -I/usr/src/kernel-source-2.4.18-hppa/include -Wall -Wstrict-pro
totypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common
 -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -m
disable-fpregs -ffunction-sections -march=1.1 -mschedule=7100  -DUTS_MACHINE='"p
arisc"' -c -o init/version.o init/version.c
make CFLAGS="-D__KERNEL__ -I/usr/src/kernel-source-2.4.18-hppa/include -Wall -Ws
trict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -f
no-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect
-calls -mdisable-fpregs -ffunction-sections -march=1.1 -mschedule=7100 " -C  ker
nel
make[1]: Entering directory `/usr/src/kernel-source-2.4.18-hppa/kernel'
make all_targets
make[2]: Entering directory `/usr/src/kernel-source-2.4.18-hppa/kernel'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/kernel-source-2.4.18-hppa/kernel'
make[1]: Leaving directory `/usr/src/kernel-source-2.4.18-hppa/kernel'
make CFLAGS="-D__KERNEL__ -I/usr/src/kernel-source-2.4.18-hppa/include -Wall -Ws
trict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -f
no-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect
-calls -mdisable-fpregs -ffunction-sections -march=1.1 -mschedule=7100 " -C  dri
vers

---------- Original Message ----------------------------------
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Date:  Wed, 5 Jun 2002 22:26:52 -0400

>> I'm trying to build the 2.4.18 kernel, and everything goes great
>> until I get to the `make bzImage` part and it screams about palo.
>> I'm assuming I need the palo source. is this right??
>> 
>> -Marc
>>
>
>Yup.
>
>$SRC-TREE--|
>           |--- /linux
>           |
>           |--- /palo
>
>cd linux;
>make oldconfig;
>make menuconfig; (Fiddle)
>make dep;
>make palo;
>
>This puts the required lifimage in $SRC-TREE/palo
>
>c.
>
>
