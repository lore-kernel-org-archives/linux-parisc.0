Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.4.20-rc1 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Wed, 13 Nov 2002 15:32:17 GMT." <20021113153217.J30392@parcelfarce.linux.theplanet.co.uk>
References: <20021113153217.J30392@parcelfarce.linux.theplanet.co.uk> 
Date: Thu, 14 Nov 2002 00:15:42 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021114071542.2CF81482B@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> (1) drivers/pci/setup-bus.c.  It looks like most of, but not all, the
> changes in our tree were merged into 2.5.20-rc1.  I've basically taken
> the version we had in 2.4.19 but other changes may be needed.  Grant,
> can you look at this?

I was re-reading this a few times and assumed you meant 2.4.20-rc1.
I'm looking at "cvs diff -r LINUS_2420RC1 drivers/pci/setup-bus.c" output.

The primary difference is for bridge_ctl field. rmk posted the
bridge_ctl patch for 2.5 and it makes managing VGA, FBB, PERR,
SERR bits in cmd register possible per arch.
I'd like to keep this in our tree since we want SERR/PERR *on*
and PC folks in general don't. And parisc really doesn't want
anything to do with VGA stuff...I don't see any reason why this
change doesn't go back to marcello.

The second significant difference is pbus_assign_resources_sorted()
wants to disable all devices while assigning resources. Not a good
thing for our console. I trust PDC to assign sane values to all devices
whether or not all devices are initially configured or enabled.
We don't have to worry about overlapped MMIO ranges or such crap
during later resource assignments.

*sigh* I see "ifndef __hppa__" here (should be CONFIG_PARISC).

We can adopt changes in pci_bridge_check_ranges(), pbus_size_io(),
and pbus_size_mem(). You want to do those or should I?

Anyone, once this is "cleaner", I think ivan/rmk/~r/helgaas probably
want to review the bridge_ctl diff before you submit to marcello.

hth,
grant
