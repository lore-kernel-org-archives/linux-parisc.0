Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA06354
	for <parisc-linux@puffin.external.hp.com>; Sun, 7 Nov 1999 06:05:49 -0700
Date: Sun, 7 Nov 1999 14:09:24 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] sash commands
Message-Id: <19991107140924.A14661@mathe.stud.uni-erlangen.de>
References: <19991105021334.J25252@mencheca.ch.genedata.com> <19991106193330.I11609@mathe.stud.uni-erlangen.de> <19991107121205.M25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991107121205.M25252@mencheca.ch.genedata.com>
List-ID: <linux-parisc.vger.kernel.org>

> > If I see this correctly this is the 4-argument problem.  Our current (hacked)
> > syscall support only supports the register arguments because supporting the
> > other ones too just would mean nobody ever got around to fix syscall support :)
> 
> Partly.  I should be less gnomic..
> 
> Yes, the 4-argument problem is relevant, but it's not the only thing.
> sash (since it's a linux program) uses the linux arguments to sys_mount(),
> so rather than both writing hpux_mount(), I decided to convince sash to
> use the Linux entry point for sys_mount(), and that's what the sash-willy
> in puffin.external.hp.com's /tmp has different to the other sashes.

Oh.  I was under the impression mount was POSIX-defined (it is not).  Sure,
getting it to use Linux syscalls is the best thing to do.

> Then I discovered that Linux syscalls were not working because we didn't
> have a page mapped at 0xC000'1000, then I discovered we didn't have a
> page mapped at 0xC000'0000 either and there was instead a nasty kludge
> in fault.c to handle hpux syscalls.  So I added a nasty kludge in there
> to make linux syscalls work too (and they don't have the 4-argument
> limitation, due to the syscall convention which I decreed).
> 
> Now I'm blundering around in the mm system trying to figure out how to
> get gateway pages working properly.

Well, the first step would be to get PAGE_OFFSET == 0x8000 0000 (or any other value
that does not collide with 0xc000 0000) working.  I tried to keep dependencies on
it at a minimum but completely failed, so if someone could find all instances of

depi	3,1,2,XXX	and replace them with		tovirt XXX
0xc0000000 (as PAGE_OFFSET)				PAGE_OFFSET / __PAGE_OFFSET

that would help a lot (otherwise I'll try).

	Philipp Rumpf
