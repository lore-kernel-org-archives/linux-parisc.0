Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8FC14841
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Nov 2003 17:34:17 -0700 (MST)
Date: Sun, 16 Nov 2003 17:34:16 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: Damian Muchli?ski <mudamian@poczta.onet.pl>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux on HP
Message-ID: <20031117003416.GA18066@colo.lackof.org>
References: <002901c3aad6$87fb1c10$64d71399@Damian> <20031116013854.GA3735@colo.lackof.org> <3FB7B032.8050505@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FB7B032.8050505@tiscali.be>
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

On Sun, Nov 16, 2003 at 05:13:22PM +0000, Joel Soete wrote:
> Not me, it is the same pb on my b2k:
> (see logs in the src thread)
> "[...]
> NS87415: IDE controller on PCI bus 00 dev 70
> NS87415: chipset revision 3
> NS87415: 100% native mode on irq 103
>     ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:pio
>     ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio
> hda: HL-DT-ST GCE-8481B, ATAPI CD/DVD-ROM drive
> ide0 at 0xf00-0xf07,0xe02 on
> hda: ATAPI 40X CD-ROM CD-R/RW drive, 2048kB Cache
> [...]"
> 
> The question is: is it enough to unplug the ide cable of this ide cdrom 
> to make it works?

It might if the IDE is causing problems.
is NS87415 code causing problems?

> btw can you have a look in your dmesg to see if you also encounter 
> NS87415's messages?

NS87415 is the IDE controller on the c3xxx motherboard.
Disconnecting the cable will only make the CD-ROM drive inaccessible.
Suckyio provides NS87415-like functionality and is quite buggy.

grant
