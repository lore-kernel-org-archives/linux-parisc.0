Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA12795
	for <parisc-linux@puffin.external.hp.com>; Thu, 5 Oct 2000 10:35:45 -0600
Message-Id: <200010051640.JAA04424@milano.cup.hp.com>
To: yuqian <yuqian@huawei.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] bug report on Sym53C895a or config error? 
In-reply-to: Your message of "05 Oct 2000 12:13:46 PDT."
             <20001005121346.23782.qmail@mailserv2.iuinc.com>
Date: Thu, 05 Oct 2000 09:40:46 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

yuqian wrote:
> For xc not available yet, I download Image-testcpu(2000-10-02) 
> as my net-boot kernel, my HP box is HP B2000 (9000/785) with 
> NCR53C8x SCSI card.

The B2000 isn't really supported yet. The piece that's missing
support is the SuckyIO (superio from NCR) chip. SuckyIO provides
USB, IDE, Floppy, Serial port, etc.

I'm using an add-on serial card as my "console" in a C3000.
The built-in Serial port 1 provides output until linux switches
from PDC console to serial console.
Once SuckyIO support is in place, the add-on serial card won't
be needed.

...
> BTW: Is xc not available for HP-UX 10.20 yet?

No one has taken ownership of HPUX XC builds since building
on i686-linux is pretty fast. Did I hear you volunteer? :^)

You can try building an HPUX XC with the following script
after downloading the appropriate sources (either from CVS
or nightly snapshots via ftp):
    http://puffin.external.hp.com/cgi-bin/cvsview/build-tools/recipe.hpux

> (When I type 'configure --target hppa-linux' for glibc, it told me this
> is not supported yet.)

You don't need xc-glibc to build kernels - only userspace apps.
The XC resulting from recipe.hpux is only suitable for building
parisc-linux kernels.

> And: How can I get more information (like instruction, registers value ...)
> for bug report?

Add calls to show_reg() in the code path that crashes.
We should get register dumps with most dumps and I thought with
panics as well.

> Kernel panic: sba_iommu.c:sba_alloc_range() I/O MMU is out of mapping resources

The problem here is the same one Ryan Bradetich (and others) ran into.
Basically the I/O Pdir mapping resource is poorly utilized (though
not as bad as it originally was). Much of the I/O Pdir is "wasted"
due to the way it's managed.

I'll add some more debug code in this particular panic path.

BTW, can someone look at why the panic didn't halt the machine and
provide a register dump?

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
