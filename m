Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 067E0483A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 07:06:40 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 18vHjh-0006LC-LZ; Tue, 18 Mar 2003 14:06:37 +0000
Date: Tue, 18 Mar 2003 14:06:37 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FWD: PCI Patches update
Message-ID: <20030318140637.GE14520@parcelfarce.linux.theplanet.co.uk>
References: <20030318062233.GA21487@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030318062233.GA21487@dsl2.external.hp.com>
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

On Mon, Mar 17, 2003 at 11:22:33PM -0700, Grant Grundler wrote:
> On parisc, this is one of the problems I've dodged.
> I'm not looking for a solution right now - but if you know the
> obvious answer, please tell me.  I just want to outline the problem.

Certainly!  ;-)

> The PCI controller (lba_pci.c) on newer PARISC machines can support
> two MMIO ranges. The "Distributed" range is a "fixed" size and base
> (1/8th of whatever the parent IO Controller (SBA) has).  The second
> "Directed" Range can use any address otherwise not assigned to PCI
> devices and directed to any PCI controller under the same SBA.

OK.

> PARISC lba_pci.c currently only advertises Distributed ranges
> and pretends Directed ranges don't exist. Things still work,
> but the resource accounting in /proc/iomem is inaccurate.

We can fix that!  ;-)

> Since Directed Ranges have precedence in the MMIO address routing, they
> can overlap with Distributed ranges. Worse, The SBA can assign "duplicate"
> MMIO address ranges by routing "unused" address space to a Directed range
> under a different PCI controller.  I think both are very ugly scenarios
> and will need alot of code to detect/handle properly.

I don't think it's such a big problem.  Well, I wouldn't, would I?  ;-)

> Each Distributed Range is typically only 16MB in size.
> Consumers of Directed Ranges are things like graphics cards or X.25
> cards which want 16MB or greater in a single BAR.
> Eg /proc/iomem on a C3000 running 2.4.20 says:
> f0000000-f0ffffff : LBA PCI LMMIO
>   f05d0000-f05d0000 : lcd_data
>   f05d0008-f05d0008 : lcd_cmd
> f1000000-f1ffffff : LBA PCI LMMIO
> f4000000-f4ffffff : LBA PCI LMMIO
>   f4007000-f4007fff : usb-ohci
>   f4008000-f40083ff : tulip
>   f4900000-f490007f : tulip
>   f4901000-f490107f : tulip
>   f4902000-f490207f : tulip
>   f4903000-f490307f : tulip
> f6000000-f6ffffff : LBA PCI LMMIO
>   f6000000-f600ffff : tg3
> fa100000-fa4fffff : stifb mmio
> fb000000-fbffffff : stifb
> ...

Thanks for posting the example, it makes life much easier.  To take some
experience from ccio-based systems, we might favour a /proc/iomem which
ends up looking something like this:

f0000000-f0ffffff : PCI bus [10/0/]
  f05d0000-f05d0000 : lcd_data
  f05d0008-f05d0008 : lcd_cmd
f1000000-f1ffffff : PCI bus [10/1/]
f4000000-f4ffffff : PCI bus [10/2/]
  f4007000-f4007fff : usb-ohci
  f4008000-f40083ff : tulip
  f4900000-f490007f : tulip
  f4901000-f490107f : tulip
  f4902000-f490207f : tulip 
  f4903000-f490307f : tulip
f6000000-f6ffffff : PCI bus [10/4/]
  f6000000-f600ffff : tg3
fa000000-fbffffff : PCI bus [10/1/]
  fa100000-fa4fffff : stifb mmio
  fb000000-fbffffff : stifb

So, how to accomplish this?  You're right it's going to be a little more
tricky than before since we may discover overlapping ranges in any order
and the directed range always takes priority over the distributed range.

Calling __request_resource() will return the address of a conflicting
resource (if there is one).  Only snag is that it's static, but I'm
sure no-one will scream too loudly if we unstatic it.  So if we're
requesting a directed range, we'll tweak the existing range to move it
out of our way.  If we're requesting a distributed range, we'll shrink
our range to avoid colliding.  In either case, we will request again.

> [ I now see one additional bugs *sigh*: PCI-PCI bridge resources are
> not properly accounted (4-port Tulip) card. I'll have to fix that. ]

iomem isn't a device hierarchy... it's not necessary to put _everything_
in.  Having said that, I think it'd be kind of nice to have it.

> The "stifb" driver claims the upper 16MB of the 32MB BAR and it's all
> routed to PCI Controller for slot 2 (PCI Bus 4). Since no other devices
> share that PCI controller, I'm pretty sure the same PCI Controller also
> gets 0xf100000 range. Add a second gfx card and it's gets uglier.
> I watched Thomas Boegendorf have fun at LinuxTag by putting 4
> similar "Vis-EG" cards in one B2600 and run xinerama. I now
> wish I had captured the /proc/iomem and lspci -v output for
> that one!

Hmm.. if I remember rightly, we put a large number of gfx cards in the
L2000 in Fort Collins once... wonder if they're still in there.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
