Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA14515
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 10:43:04 -0700
Date: Wed, 17 Nov 1999 07:34:53 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Jeffrey A Law <law@cygnus.com>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, bame@debian.fc.hp.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Today's boot experience on a 735
Message-Id: <19991117073453.I750@mathe.stud.uni-erlangen.de>
References: <199911170248.VAA15412@hiauly1.hia.nrc.ca> <1129.942809756@upchuck>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1129.942809756@upchuck>
List-ID: <linux-parisc.vger.kernel.org>

> Yea, but you appear to be depending on highly suspicious behavior.    The
> trick of ordering subspaces in the first .o on the link line to provide an
> ordering for the subspaces in the final executable relies on documented
> behavior of the HP linker.

After reading the whole discussion, I have to admit I really don't understand
what the problem is.  Maybe the boot loader doesn't tell us where the kernel
ends, but do we really want to know ?  We know that everything after the start
of the BSS section is our memory, and no-one is going to expect any nonzero
value beyond it.

While memsetting the whole memory after the start of the BSS section might be
overkill, it certainly will eliminate some otherwise unreproducable bugs.
Maybe limit it to some barrier that will be sane for the foreseeable future
(say, 16 MB) (and do print a warning / panic if _end is even higher), but it
shouldn't be a problem just doing it the stupid way now and do it right when
we have ELF, no ?

	Philipp Rumpf
