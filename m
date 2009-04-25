From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
Subject: SuperStrangeDome
Date: Sat, 25 Apr 2009 10:33:51 +0200
Message-ID: <20090425083351.GA5661@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

I found some spare time to continue hacking Madze's superdome. With
some really strange hacks (see below) I'm now able to see a successful
mount of a root filesystem over NFS, but no sign of userspace yet.

The strange hacks have to do with output to console and timing.
Here is a list of things I've added to get both partitions up to
the point mounting NFS root:

1. add 50 dummy prinkts after print_parisc_devices()
2. do a while (pdc_iodc_getc() != 'a') in iosapic.c after dumping
   Interrupt Routing Table (only needed if DEBUG_IOSAPIC_IRT is
   enabled)
3. do a while (pdc_iodc_getc() != 'b') in lba_hw_init before touching
   anything
4. carefull press a and b during boot. I need to press b for every
   found Elroy. If I'm too fast the partition locks up

Does this ring any bells ? Looks like a very timing sensitive thing,
but what could be the cause of it ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                                [ RFC1925, 2.3 ]
