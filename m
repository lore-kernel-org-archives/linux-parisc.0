Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from brain.fop.ns.ca (u135n18.eastlink.ca [24.224.135.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id D49CA4840
	for <parisc-linux@parisc-linux.org>; Fri, 21 Nov 2003 18:56:06 -0700 (MST)
Date: Fri, 21 Nov 2003 21:55:59 -0400 (AST)
From: Steve Bromwich <lists@fop.ns.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Processes stuck in D state on 715/100XC with
 2.4.22-pa17
In-Reply-To: <3FBE7C6A.3010104@tiscali.be>
Message-ID: <Pine.LNX.4.58.0311212145230.21213@brain.fop.ns.ca>
References: <3FB265EC00003DBD@ocpmta3.freegates.net>
 <Pine.LNX.4.58.0311190913310.1125@brain.fop.ns.ca> <3FBE7C6A.3010104@tiscali.be>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Joel,

On Fri, 21 Nov 2003, Joel Soete wrote:

> Hi Steve,
>
> Steve Bromwich wrote:
> >
> > I've got a J class at work that's not in production...

> well, but those system are widly different (cpu, architecture, ...).

Well, my plan was something like this:

1. Install Linux on the J200, replicate my 715, and then compile the
kernel as closely as possible to how it is in the 715. Run the J200 like
that for a day or two and see if I can duplicate the problem. If so, diag
further on there.

2. If the problem does not appear on the J200, resync with the 715 and put
the J200 in place of the 715 while I tinker with the 715 to nail down the
problem. Then I should be able to regress through the kernels from cvs
until I find the one where it stopped working, and hopefully I should be
able to find a resolution from there.

Unfortunately, I was caught out right at the start - after lugging all 60
kilos of it home and downstairs into my basement server room, I discovered
that someone had borrowed the drives out of it, so I'll have to bring home
an enclosure next week to continue my testing.

In the meantime, I tried a net install which ultimately failed trying to
extract debs to the nfs root (which, incidentally, took about 5 minutes to
mount - is this to be expected on the install disks? It usually only takes
a couple of seconds for my 715 to mount an nfs partition off my
workstation). Unfortunately I was on serial console so couldn't get much
in the way of diags, I'll have to move a monitor into my server room to
hook up to it (the J200 doesn't like my 15" SVGA test monitor,
unfortunately).

> Good question? never have to test it but it is a bootable cd (I don't
> remember if it is available via internet?) so if you copy it's image
> (with dd) on a system, i think that following the faq how-to netboot
> <http://parisc-linux.org/faq/index.html#netboot> , it would works?

Hmmm... you mean like dd if=/dev/scd0 of=lifimage.testing? I guess that'll
be my next try :-)

> > Well, the frustrating thing is is that there's no debug output anywhere
> > that I can find that's showing anything obviously wrong.
> Don't feel alone, during severall month (2, 3, 4, ... I don't want to
> remember) I try to get just a panic message from a smp kernel on a N4k
> : no success :_(

Ah well... misery loves company, I guess! :-)

> hmm, what kind of disk have you on your D: hot-swapable or fixed?
> (with fixed disk, I already encounter a pb of flat cable and with
> hot-swap disk a pb with dust on disks' support)

Fixed. I don't *think* it's a problem with the cable, since (a) I reseated
all the cables after the first couple of times it died, and (b) after the
last time it reset, I rebooted back to 2.4.18 to make sure it wasn't a
flat-out hardware error (as opposed to possibly a hardware bug being
tickled by 2.4.22).

Thanks for the help :-)

Cheers, Steve
