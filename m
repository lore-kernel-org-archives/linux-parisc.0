From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset Table
Date: Fri, 31 Jul 2009 15:03:03 -0400 (EDT)
Message-ID: <20090731190304.C7BF55161@hiauly1.hia.nrc.ca>
References: <119aab440907311149j3e17466fy3782b86399142141@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: elendil@planet.nl, 539378@bugs.debian.org,
	debian-hppa@lists.debian.org, deller@gmx.de,
	linux-parisc@vger.kernel.org, randolph@tausq.org,
	submit@bugs.debian.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440907311149j3e17466fy3782b86399142141@mail.gmail.com> from "Carlos O'Donell" at Jul 31, 2009 02:49:27 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Fri, Jul 31, 2009 at 5:17 AM, Frans Pop<elendil@planet.nl> wrote:
> > Affects both stable and unstable!
> >
> > kernel: Linux version 2.6.26-2-parisc64-smp [...]
> > kernel: nfs: Global Offset Table overflow (used 1075, allowed 1023)
> >
> > kernel: Linux version 2.6.30-1-parisc64 [...]
> > kernel: nfs: Global Offset Table overflow (used 1164, allowed 1023)
> >
> > The error comes from arch/parisc/kernel/module.c.
> > Looks like it is a known issue:
> > http://lists.parisc-linux.org/pipermail/parisc-linux/2006-October/054826.html

I've seen the same problem.  Sent a message to the parisc-linux list
about this recently.

> Only 32-bit targets have the 14-bit signed immediate offset (0x3fff),
> which becomes a 13-bit limit when loading positive offsets e.g.
> +0x1fff or 1023 GOT slots.

Can't we offset the table and double the number of entries?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
