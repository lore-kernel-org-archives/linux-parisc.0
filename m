Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id BAA22725
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 01:51:02 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel1.hp.com (Postfix) with ESMTP id D8476233
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 01:53:33 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id BAA15590 for parisc-linux@puffin.external.hp.com; Wed, 22 Nov 2000 01:52:04 -0700 (MST)
Date: Wed, 22 Nov 2000 01:52:04 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011220852.BAA15590@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Use of the EI_OSABI field
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>
> BTW, it's not too hard to check .note.ABI-tag.  The linker arranges for a
> PT_NOTE program header entry to point to it, and the section itself is
> virtually guaranteed to be read in with the header as it's placed right
> after the header along with .interp.

I didn't say it was difficult, I said it was ugly. It means another
parisc only change to the machine independent file fs/binfmt_elf.c,
since the hook provided will not allow this check. Without a change,
binfmt_elf.c won't be smart enough to differentiate a binary produced
by Gnu binutils for HP-UX and a binary produced by Gnu binutils for
Linux, so it will claim both, and then blow up later, rather than
not claiming the HP-UX binary and allowing it to be claimed by
an arch dependent binary handler further down the list.

And binfmt_elf.c does NOT read the program headers in the same read, so
another read would have to be done (the data should be found in in cache
rather than going to disk for it). Since we now need both the program
headers and a section header to determine whether or not we should claim
the file AND binfmt_elf.c also wants to look at those headers after
the file is claimed, a small redesign is probably in order (rather than
re-reading the headers). I'm not sure whether or not Linus would buy
that.

So, I guess I'll pursue the interpreter field instead, since that is
what sparc is doing (i.e. they have their own sparc only code in
binfmt_elf.c). Since that will be an easier sell. I need to do more
research here. I suspect that statically linked binaries are not going
to allow this solution to work though.

John Marvin
jsm@fc.hp.com
