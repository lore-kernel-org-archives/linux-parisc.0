Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77DAA4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 20:36:16 -0700 (MST)
Message-Id: <200102090338.TAA07555@milano.cup.hp.com>
To: "M. Grabert" <xam@deathsdoor.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ASP Parallel port driver broken on HP9000/730 
In-reply-to: Your message of "Fri, 09 Feb 2001 03:04:44 PST."
             <Pine.LNX.4.21.0102090239110.25675-100000@sgate.charlysworld.de>
Date: Thu, 08 Feb 2001 19:38:38 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"M. Grabert" wrote:
> Unfortunately I don't know how to redirect the kernel output
> to the serial console, so I can give you only some hints...

Hints on using serial console on 715 (you can search the archive
for lots more 715 hints):

a) disable CONFIG_STI_CONSOLE
b) enabled CONFIG_SERIAL=y
           CONFIG_SERIAL_CONSOLE=y
           CONFIG_SERIAL_GSC=y

c) connect x86 serial to port 1 of 715 and run minicom with 9600 8N1
   serial line settings.
d) Disconnect HIL keyboard and Mouse.
   (*or* hold the TOC button for about 10 seconds while powering on the box.)
   (Either should force the PDC to use serial port 1)

> parport_init_chip: initializing bidirectional mode.
> 
> The kernel makes a memory dump from 0000 to 097f,
> then:
> 
> High Priority Machine Check (HPMC): Code=1 regs=c034a080 (Addr=00000000)
> 
> Then follows a dump of the processor registers:
> 
> PSW: 00000000000001000000000000001111
> r0-3   00000000 c02eb800 c0246328 c1f30788
> r4-7   0000002c c1fe5220 f0824800 ffffffdf
> r8-11  ffffffff 00000000 0004000e c037d8b0
> r12-15 000a5a59 000ff000 f0000124 00000000
> r16-19 00000001 50000059 0a000a00 0000000f
> r20-23 000000ff 00000041 c1fdc000 0000000f
> r24-27 ffffffff f0824800 f0824800 c0342000
> r28-31 00000034 00000800 c1fe0980 c012a7dc
> sr0-3  00000000 00000000 00000000 00000000
> sr4-7  00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: c026e458 c026e458
>  IIR: e840c000     ISR: 00000000   IOR: c0246328
> ORIG_R28: 00000000

IOAQ is the address of the instruction that the CPU
was trying to execute when the HPMC occurred.
IIR is the instruction at IOAQ.
echo 0xe840c000=i | adb   says:
		BV              r0(r2)

GR02 is the most recent subroutine call return addr.
(Typically the caller).

So look up c026e458 and c0246328 in your System.map.
You can at least figure out about where it's crashing.
(Hint: cvs co build-tools and look at a.c)

> NB: i typed all this stuff, no copy'n'paste; so perhaps
> there are some errors ... 
> 
> BTW, no HIL connected, just serial console (but since
> the kernel hangs before, i cannot see any output :))).

Wait. If PDC is printing to the serial console...I'm confused.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
