Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA27468
	for <parisc-linux@puffin.external.hp.com>; Thu, 14 Dec 2000 22:51:05 -0700
Sender: mang@mailserv2.iuinc.com
Message-ID: <3A39B0B5.27A14539@subcarrier.org>
Date: Fri, 15 Dec 2000 00:48:37 -0500
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: Alan Modra <alan@linuxcare.com.au>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] phase 2 gcc build fails
References: <Pine.LNX.4.21.0012141742060.2565-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:
> 
> > Yeah, that's exactly what you wanted to do.  After you ran the "admin
> > -b" command, the vendor branch was de-vendorised, so I'm guessing that
> > the next time you pulled you got the trunk, not the branch.  With vendor
> > branches, you never really know if you're pulling from a branch or the
> > trunk, hence our desire to avoid them.
> 
> For answering, you're the lucky recipient of another question :-)

Heh, serves me right ;)
 
> Is it possible to import a vendor branch that contains new files, without
> them magically appearing when checking out the HEAD version?  I've just
> done an import from sourceware, then had to rm all the new files, cvs rm,
> cvs commit.  Which is a pain.  Also, unless people use "checkout -P", they
> get empty directories.

Hmm, I didn't realise that this was another side effect of "import".  I
generally use "add" on the branch instead, which does the right thing
for new files.  So I guess when updating a third-party branch you have
two choices:
1. Use "import", and both "admin -b" and "cvs rm" from the trunk any new
files.
2. Use "add" on the branch, and "cvs rm" any removed files from the
branch.

New files on the trunk that shouldn't be there are probably less of a
nuisance than persistent files that should be gone, but there's no need
to make this kind of mistake.

If people want to prune empty directories they should use "checkout
-P".  Here's the contents of my .cvsrc:
cvs -z3
diff -uN
remove -f

I don't turn on "checkout -P" or "update -d" by default, but that's just
me.  I've been meaning to set up a checkout module for the kernel that
would include the minimal set of stuff you need to build for PA-RISC,
omitting the other arch dependent junk.  I plan to do it Real Soon Now.

	- Mike.
