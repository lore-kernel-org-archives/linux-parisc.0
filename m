Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA32038
	for <parisc-linux@puffin.external.hp.com>; Sat, 27 May 2000 09:30:57 -0600
Message-Id: <200005271531.LAA08195@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [MERGE] -pre8 merge status
To: willy@thepuffingroup.com
Date: Sat, 27 May 2000 11:31:08 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: prumpf@puffin.external.hp.com, grundler@cup.hp.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <20000527005646.H31075@thepuffingroup.com> from "willy@thepuffingroup.com" at May 27, 2000 00:56:46 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> __lshrdi3.  It's referenced from fs/nfs/inode.c.  I'm damned if I can
> see where though (and I went through the gcc -E output trying to spot it.)
> Does someone want to copy that from libgcc?  I'm going to lay down a tag
> for end-of-merge now since I'm headed off for the weekend.

__lshrdi3 should be in libgcc.a.  It's in mine.  If it is not there, you
have a problem building your (cross-)compiler.  If it is, check the link
by adding "-v" to the gcc link operation to see why libgcc.a is not being
linked into the object.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
