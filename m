Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA27587
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Mar 2000 00:08:37 -0700
Received: (from ncc@localhost)
	by milquetoast.cs.mcgill.ca (8.9.3/8.9.3) id BAA14833
	for parisc-linux@thepuffingroup.com; Fri, 10 Mar 2000 01:09:50 -0500 (EST)
Date: Fri, 10 Mar 2000 01:09:49 -0500
From: Nick Cabatoff <ncc@cs.mcgill.ca>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HFS linux implementation
Message-ID: <20000310010949.A14656@cs.mcgill.ca>
References: <20000309193535.C3423@cs.mcgill.ca> <200003100137.RAA09015@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: Grant Grundler's message [Re: [parisc-linux] HFS linux implementation] as of Thu, Mar 09, 2000 at 05:37:32PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Mar 09, Grant Grundler wrote:
> Nick Cabatoff wrote:
> > (I sent this to Alex deVries and didn't get a response, so I figured I'd
> > give this list a try instead.)
> 
> Poor Alex is pretty busy right now...

That's what I gathered.  In any event the list was a better target for
my question I think.

> concluded it was do-able. And you might check if other open
> source parisc ports have already done it (eg OpenBSD or mklinux).

I didn't know there were any *BSD ports; I'm pretty sure mklinux didn't
get that far, based on what I looked at last year.  That's a good
thought though, thanks.  I'll see what I can find.

> As a side note, don't confused HP's HFS with Apple's.
> I'm not sure of what to call HP's since Apple HFS support was first.
> Perhaps the other ports have set precedence for this.

Actually, it looks like just stock UFS with ACL support, as far as I can
see.  Even that's kind of optional; many sites don't use ACLs at all
(hell, dump/restore don't know about them), and it looks like a
read-only implementation that just ignored them would work fine.  I
think that would be almost too easy given the existing linux UFS module
though, so once that much is working I'll probably do a writeable
version that preserves ACLs, even if it doesn't allow you to work with
them.

I think it also may be compatible with OSF/1's UFS (based on an
include-file comment), so this implementation would kill two birds with
one stone.

> > - if you think it's worth the effort, given that I expect HP-UX
> > systems are using LVM now and I don't feel up to the task of trying
> > to handle that
> 
> Yes. Most older workstations use HFS on wholedisk. HFS can be used on
> disks > 4GB without LVM. I avoid LVM whenever I can. It's easier to
> physically move disks from one host to another without LVM.  I only
> use LVM when the boot file system is on a disk > 2GB.

Ah, glad to see I was overgeneralizing from my own experience.  I've had
some bad luck with LVM on root disks myself, but I'm philosophically
opposed to having single-filesystem machines (i.e., I want seperate /var
and /tmp directories), so I stick with it.  <sigh>  I'm kind of
mystified why HP would've waited for LVM to allow multiple filesystems
on a single disk; what's so bad about partition tables?
