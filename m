Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA06204
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Apr 2000 23:14:58 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id EF96B59FC
	for <parisc-linux@thepuffingroup.com>; Wed, 12 Apr 2000 01:14:52 -0400 (EDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id WAA16365 for parisc-linux@thepuffingroup.com; Tue, 11 Apr 2000 22:14:55 -0700 (PDT)
Date: Tue, 11 Apr 2000 22:14:55 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200004120514.WAA16365@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Astro and 100BT still not working
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
I haven't been able to figure out why the 100BT isn't able
to read the Tx Descriptor and send a setup frame on the C3000.
I'm giving up on this for a bit. I need someone else too look at
this and bounce ideas off of me.

The remainder of this e-mail is a summary of what I know so far
and where to find the data I've.

Thomas has the tulip driver working on the A180's built-in tulip.
But A180 has a completely different processor and I/O subsystem.
And as noted before David Miller has the same driver (pre3)
working on Sparc64 (also 64-byte cacheline).

I've ruled out 64-byte cacheline size (in the configuration space
register) is the problem though it seems tulip driver violates
some of the rules in the doc regarding CAL and WIE bits in CSR0.

I have more PCI bus traces of HP-UX and parisc-linux talking to
the tulip chip on:
	ftp://puffin.external.hp.com/pub/parisc/debug

I've added comments to most of the register accesses since
I don't know tulip very well.

Filename         Comment
--------         -------------------------------------
cogent1.txt      parisc-linux boot. Using "Cogent" tulip card.
                 Trigger when card issues mem_read of 0xfffffffc.
cogent1_cons.txt matching c3k console output

hp100bt1.txt     parisc-linux boot. using HP 100BT card for V-class.
hp100bt1_cons.txt Matching c3k console output.

hp100bt2.txt     HP-UX 10.20 (9912) boot. trigger on first write to CSR4.
hp100bt3.txt     HP-UX 10.20 (9912) boot. trigger on second write to CSR4.
                 (Shows card reading descriptors and updating status.)
hp100bt4.txt     parisc-linux with some minor kernel changes.

The most recent PCI trace is interesting because it suggests something
is wrong with the DMA mapping. One of the changes was for "start" (first
IOVP allocated) to be pdir[0x10] (IOVP=0x10000) instead of pdir[0].
And the card read in zero's instead of the descriptor data!
(see the end of the trace)

Some possible theories:
1) it's not coherent (perhaps LCI didn't work right),
2) the code isn't writing the correct entry in the I/O pdir,
3) the DMA address (IOVA) isn't assembled correctly.
4) some Astro/Elroy HW bug. (using Astro 2.1 and Elroy 2.1)
5) some "bug" in the HP add-on 100BT boards (eg CSR15 and general purpose pins)

I don't think it's (2) or (3) because I've reviewed the results
of console output. I can't determine if LCI is "working".
Philip helped correct problems in that area last Thursday
so it should be ok too. Console output has the full I/O Pdir
entry dumped (in little endian format - MSB is last byte)
if someone could/wants to verify this.

Regarding HW bugs, X4107 (fixed in Elroy 2.2) is a nasty ordering bug.
I don't think we are hitting this since we don't have DMA going yet.
I haven't reviewed Astro Errata yet but will tomorrow.

I didn't think the GEP could cause this kind of problem but maybe
something is a problem. Perhaps I could try the same card in an A180...

thanks,
grant
