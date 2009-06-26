From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: 2.6.31-rc1: parisc: multiple PCI BAR collisions
Date: Fri, 26 Jun 2009 11:02:04 -0500
Message-ID: <1246032125.3925.45.camel@mulgrave.site>
References: <a4423d670906260158q15080049ue516c3d454f4afbf@mail.gmail.com>
	 <1246027060.3925.18.camel@mulgrave.site>
	 <20090626170823.0a8730b7@epia.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Alexander Beregalov <a.beregalov@gmail.com>,
	linux-parisc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090626170823.0a8730b7@epia.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2009-06-26 at 17:08 +0200, Jeroen Roovers wrote:
> On Fri, 26 Jun 2009 14:37:40 +0000
> James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> > On Fri, 2009-06-26 at 12:58 +0400, Alexander Beregalov wrote:
> > > Hardware is HP j6000.
> > > It cannot initialize many PCI devices (sym53c8xx, tulip, STI,
> > > usb(onci)) and cannot boot (no root device).
> > > Messages like this:
> > > sym53c8xx 0:0:0f.0: device not available because of BAR 1
> > > [0xf4005000
> > > - 0xf40053ff] collisions.
> > 
> > This tends to indicate a problem with resource parenting ... could you
> > post the full boot output?  That might indicate why.
> 
> Here goes.

It looks like there's some sort of screw up in the LBA resource
allocation on 32 bits.  The slight problem with this is that I don't
have an LBA 32 bit system to debug this; I've only got a C360.

How recent is the failure? Could you bisect it back to the failing
commit?

Thanks,

James


