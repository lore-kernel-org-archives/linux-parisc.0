Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA08830
	for <parisc-linux@puffin.external.hp.com>; Sat, 5 Aug 2000 01:06:35 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 76AE051C
	for <parisc-linux@thepuffingroup.com>; Sat,  5 Aug 2000 00:08:39 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id AAA04887
	for parisc-linux@thepuffingroup.com; Sat, 5 Aug 2000 00:11:13 -0700 (PDT)
Date: Sat, 5 Aug 2000 00:11:13 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200008050711.AAA04887@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] U2/Uturn support added
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
I just committed two not-yet-but-almost-working "CCIO" drivers
to support U2 and Uturn "I/O Adapters". FOr those not on the
CVS e-mail list, attached is the CVS commit message.

The sort-of-bad news is I can't spend more time on ccio-dma.c.
I've burned a over week already and I'm afraid I won't have enough time
to get other parisc-linux PCI issues resolved that my empoyer cares about.
If someone else (I nominate John D Anglin and Ryan Bradetich ;^) could
take a look at ccio-dma.c, I'd be quite happy to answer (most likely
not) stupid questions...especially since U2/Uturn documentation still
hasn't been published. <sigh>.

In HP speak, IOA's are more than just bus converters and bus bridges.
(And I don't know what the difference between those are either).
The U2/Uturn IOAs provide coherency between DMA/CPU D-cache and perform
physical address translations between a 32-bit <-> 40-bit bus. For
parisc-linux, we require the I/O MMU to provide I/O coherency on
many platforms.  Follow the e-mail thread that started with
http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/03-Mar/0032.html
if you want to learn the underlying requirements.

One exception is Uturn under PCX-W processors. Here, the IOA is only needed
to provide I/O Coherency since PCX-W follows the coherency model defined
someplace that U2/Uturn also implement.  And ccio-rm-dma.c might work as-is.
I just don't have a C360 to test it on. Philipp Rumpf claims his dma-rm.c
(the original file) works on his C360.

And though I explicitly call-out the older C-class models in my
comments, I expect most of this to apply to equivalent K/D/R/J-class
models which have U2/UTurn in them as well.

enjoy!
grant

CVS: ----------------------------------------------------------------------
CVS: Enter Log.  Lines beginning with `CVS:' are removed automatically
CVS: 
CVS: Committing in .
CVS: 
CVS: Modified Files:
CVS: 	arch/parisc/config.in arch/parisc/defconfig 
CVS: 	arch/parisc/kernel/Makefile drivers/gsc/gsc.c 
CVS: Added Files:
CVS: 	arch/parisc/kernel/ccio-dma.c arch/parisc/kernel/ccio-rm-dma.c 
CVS: ----------------------------------------------------------------------
Add two versions of U2/Uturn I/O MMU driver : ccio-dma and ccio-rm-dma.

ccio-dma is intended
a) to work on all platforms w/U2 or Uturn (but doesn't yet.)
   (I think it's very close to working but I have to get away from it
    for a while and get back to PCI support issues)
b) once it is working, provide better DMA performance/bus utilization.
c) to only support 1 IOA.
   (Supporting more than one IOA requires tree structure for PA I/O devices.)
d) allow someone else to play with it and maybe see what's wrong.

ccio-rm-dma:
a) only works under PCX-W (ie C360) platforms (not under PCX-U - C180/200/240)
b) is borrowed from prumpf's linux-parisc
c) provides better CPU utilization since it's not really doing anything.
   (Mostly function call overhead)
d) supports any/all IOAs under UTurn since it doesn't need to know
   anything about the heirarchy of the I/O subsystem.

The "switch" is in the parisc/kernel/Makefile since I was too lazy
to figure out a clean way to pick the "right" one. I was thinking
a runtime check might be the right way but it isn't. It also depends
on load characteristics which aren't visible to the CPU (ie type of
DMA transactions - connected or split).
