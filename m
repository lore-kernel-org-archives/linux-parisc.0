Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA01088
	for <parisc-linux@puffin.external.hp.com>; Sat, 27 May 2000 12:09:58 -0600
Message-ID: <20000527120953.C664@puffin.external.hp.com>
Date: Sat, 27 May 2000 12:09:53 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>, willy@thepuffingroup.com
Cc: grundler@cup.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [MERGE] -pre8 merge status
References: <20000527005646.H31075@thepuffingroup.com> <200005271531.LAA08195@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200005271531.LAA08195@hiauly1.hia.nrc.ca>; from John David Anglin on Sat, May 27, 2000 at 11:31:08AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Sat, May 27, 2000 at 11:31:08AM -0400, John David Anglin wrote:
> > __lshrdi3.  It's referenced from fs/nfs/inode.c.  I'm damned if I can
> > see where though (and I went through the gcc -E output trying to spot it.)
> > Does someone want to copy that from libgcc?  I'm going to lay down a tag
> > for end-of-merge now since I'm headed off for the weekend.
> __lshrdi3 should be in libgcc.a.  It's in mine.  If it is not there, you
> have a problem building your (cross-)compiler.  If it is, check the link
> by adding "-v" to the gcc link operation to see why libgcc.a is not being
> linked into the object.

Our kernel doesn't get linked with libgcc;  I don't think it's worth it to
move to using libgcc.a now, even though some architectures do use it.

	Philipp Rumpf
