Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0A604854
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Mar 2004 12:51:51 -0700 (MST)
Date: Tue, 16 Mar 2004 19:51:48 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] SCSI broken in latest CVS changes
In-Reply-To: <20040316165202.GW25059@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.58.0403161946550.27512@sal.ucc.ie>
References: <Pine.LNX.4.58.0403150256180.17258@sal.ucc.ie>
	<40561E7100000AF2@ocpmta2.freegates.net>
	<20040316165202.GW25059@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 16 Mar 2004, Matthew Wilcox wrote:

> On Tue, Mar 16, 2004 at 05:17:01PM +0100, Joel Soete wrote:
> > Hello Max,
> > >It doesn't detect any of the two internal 9 GB LVD-SCSI of my C3k.
> >
> > The same for me on b180 OTC 2.6.4-pa1 runing fine...
> >
> > Do you got some news?
>
> I got my c3k going and experienced the same problem.  I've backed out
> the last two patches (Christoph's one to remove the queueing and the
> dev_printk one) and it now works fine.  I've also imported 2.6.5-rc1,
> so 2.6.5-rc1-pa0 should be happy happy on a c3k now.  Shout if it's not.

Mhh, doesn't work for me with the latest CVS:


=== snip

  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
drivers/built-in.o(.text.__sync_scsi_data_for_device+0x14): In function `__sync_scsi_data_for_device':
: undefined reference to `scsi_to_pci_dma_dir'
make: *** [.tmp_vmlinux1] Error 1
root@beast:/usr/src/linux#


====


Same config as 2.6.4-rc3-pa1 and 2.6.4-pa2 (before the SCSI changes),
which work fine.

BTW, I did a "make clean" before the make. Did you miss to revert a patch?


Greetings,
  Max
