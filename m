Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 27 Jun 2003 10:54:51 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] warning: minor abi change
Message-ID: <20030627165451.GB371@dsl2.external.hp.com>
References: <20030627151546.GA30607@dsl2.external.hp.com> <3ED70CF10000AE2E@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3ED70CF10000AE2E@ocpmta2.freegates.net>
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

Joel,
I mistakenly replied only to you on my previous mail.
Can you please forward my previous reply to parisc-linux mailing list
or send a copy back to me - I'll post it to the list then.

On Fri, Jun 27, 2003 at 06:14:58PM +0200, Joel Soete wrote:
> Hi Grant,
> 
> > diff -NaurX dontdiff linux-2.4.21-pa0/drivers/ide/pci/ns87415.c linux-2.4.21-rc8-pa35/drivers/ide/pci/ns87415.c
> 
> > This is for c3000/j5000/et al workstations.
> > NS "SuckyIO" multifunction chip includes ns87415 compatible IDE controller.
> 
> ...
> >> +#define __save_and_cli(x)  do { __save_flags(x); __cli(); } while(0);
> >> +#define __save_and_sti(x)  do { __save_flags(x); __sti(); } while(0);
> >> +
> 
> > This is something different - but I'd think this is needed too.
> > Make sure this isn't a merge error (ie see if it's defined elsewhere).
> 
> I need it to make work my ide cdrom onto my b2k (I grab this stuff
> from another platform)

ah ok.

The IDE CDROM are pretty standard devices. Note the DMA does NOT work.
And even with PIO mode, it just barely works - enough to do an install.
So don't use it too much unless you can afford to crash your box.
At least that was my experience with 2.4.19 or so.

> The following stuff is just a variant (just for info)

ok.

...
> > If they are no longer referenced, that's fine.
> hmm in fact the last ref of 'cpu_irq_actions' is in arch/parisc/kernel/processor.c
> and now embrace by #if 0 [...] #endif
> (I will see to cleanup too)
> ...

ok

> 
> > I need the above changes in a format that I apply with "patch -p1 < diff"
> 
> Here is attached Mydiff2421.txt

ok. let me apply local and try it out first. If all is well, should see
something by this weekend.

thanks,
grant
