Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1215C4891
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Jan 2004 05:37:10 -0700 (MST)
Date: Mon, 19 Jan 2004 12:16:40 +0100
Message-ID: <40047B6A000037F2@ocpmta2.freegates.net>
In-Reply-To: <20040117081720.GA29918@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] init and exit text problem
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"James Bottomley" <James.Bottomley@steeleye.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Matthew Wilcox <willy@debian.org>, Randolph Chung <tausq@debian.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Grant,

A great news: your kernel (2.6.1-pa4) boot well on the N4000-55 :)
palx4000:/var/logs# dmesg | more
Linux version 2.6.1-pa4 (grundler@ios) (gcc version 3.0.4) #10 Sat Jan 17
00:04:07 PST 2004
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00005d30 00000491 00000000 00000002 27988e5d 100000f1 00000008 000000b2
000000b2
vers  00000301
CPUID vers 18 rev 11 (0x0000024b)
capabilities 0x1
model 9000/800/N4000-55
Total Memory: 2048 Mb
On node 0 totalpages: 524288
  DMA zone: 524288 pages, LIFO batch:16
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Building zonelist for node : 0
Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=3/vmlinux-2.6.1-pa4
PID hash table entries: 16 (order 4: 256 bytes)
[snip]

:))

>2.6.1 kernel with this patch and "bridge_ctl" PCI patch from
>Russell King are uploaded to ftp.p-l.o:kernels/a500/2.6.1-pa4.tgz

If i well find back your mail and references to this "bridge_ctl" patch otc
I don't reach to apply Russel's patch like this (against 2.6.1) to test on
my B2k (which you know don't work yet with pdc_cons). Can you make your "bridge_ctl"
patch available on ftp.p-l.o?

Thanks again for all,
    Joel

PS: an additional question regarding pdc_cons: in 2.4 there was a device
driver in devices/char/pdc_console.[ch] which allowing to use ttyB device.
But in 2.6 there isn't anymore such driver? any idea?

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
