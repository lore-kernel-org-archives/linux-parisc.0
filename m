Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4CC764830
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Apr 2004 14:13:49 -0600 (MDT)
Message-Id: <200404232013.i3NKDlH4026746@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
To: James.Bottomley@steeleye.com (James Bottomley)
Date: Fri, 23 Apr 2004 16:13:47 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <1082749422.1913.54.camel@mulgrave> from "James Bottomley" at Apr
	23, 2004 03:43:42 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> On Fri, 2004-04-23 at 15:27, John David Anglin wrote:
> > I think I know why.  The 64-bit linker only supports a single stub
> > table.  Things go bad when a branch can't reach its stub.  I hit this
> > when I was trying to implement tail calls.
> 
> That's a bit, um, unfortunate, given the current kernel predisposition
> for adding a new section for almost every new feature...
> 
> How hard would it be to fix this?  Surely all we really need is one stub
> table per text section in the final executable (linux still has only
> about five executable sections in the vmlinux.lds.S map).

I would guess a few days work, probably less if Alan Modra did it.
There's a model on how to do it in elf32-hppa.c.  Alan implemented
the 32-bit stub code.  It definitely should be done at some time.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
