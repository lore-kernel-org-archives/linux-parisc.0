Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A8F948B8
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 22:37:52 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel7.hp.com (Postfix) with ESMTP id 66D4A8056CF
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Mar 2002 00:34:32 -0500 (EST)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id WAA17528
	for parisc-linux@lists.parisc-linux.org; Fri, 8 Mar 2002 22:34:15 -0700 (MST)
Date: Fri, 8 Mar 2002 22:34:15 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200203090534.WAA17528@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Swap space limitions for Linux on parisc
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>
> > > The 'yet' above gives me hope; will 64 bit user space processes be
> > > supported anytime soon? Being able to malloc(1<<36) would be nice!
> >
> > I sure hope not.... there is a lot of work involved to bring
> > up toolchains and all the applications to support two
> > different userlands. We still have a lot of work to do just
> > to stablize 32-bit userspace. Check the list archives, this
> > has been discussed before, and once fairly recently.
>
> I had a bit of a peek around the archives, wow, I guess hppa64 isn't the
> most 'comfortable' place for a g++ developer just now.

Well, basic gcc, binutils already work because we need that to build a
64 bit kernel. g++ is another story (which I don't know anything about).
The biggest missing piece is support for 64 bit shared libraries. I'm
not even sure there is a complete design for how that is going to work.

Then of course, a 64 bit version of glibc has to be built. Since glibc
has already been ported to other 64 bit architectures, and since it has
been ported to 32 bit parisc linux, there may not be that much work here,
but the code size is so huge, it probably is not trivial.

Finally, there is some more kernel work to be done, primarily in VM
support and syscalls.  I plan to do this work some day, but haven't been
highly motivated since there hasn't been much demand yet.

> > This is not to say it couldn't be done of course. This is
> > GNU/Linux, you have all the source, go nuts.. :-)
>
> Project deadline soon :( must.. find.. cheap.. 64 bit machine
>
> > But now you have me curious, what app are you writing that
> > needs >4G of address space?
>
> A computational physics code. Ideally I would run it in 100s of GB of
> RAM. About two months of pain went into making it work (reasonably
> efficiently, in theory at least) in 100s of GB of swap.
>
> Now you have *me* curious; I don't mean to be an ignorant asshole, but
> what's the point of hppa64 if you *don't* support >4G address space?
>
> *crying* does HP-UX support >4G address space? *finds wallet* :(
> Hmm, probably have to shell out more $$$ for the HP compilers too :\
>
>         Duraid

Yes, HP-UX does support >4Gb address space. And yes, you will probably
have to pay extra for the compilers. Another problem is that HP-UX
might not install without supported CD-ROM, disks, etc. From the
ordering page it wasn't clear if you could order HP-UX media without
getting a CD-ROM (which we charge $520 for. Such a bargain!).

So, another option might be a statically linked 64 bit gcc "compute
engine" app that used only a minimum of direct syscalls (no glibc) to
communicate with a 32 bit front end app.  If the compute part of your code
is heavily g++ dependent, this might not be feasible.  This would still
require the kernel work mentioned above to be done.

John Marvin
jsm@fc.hp.com
