Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA22585
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Dec 1999 12:16:05 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id OAA29543
	for parisc-linux@thepuffingroup.com; Thu, 30 Dec 1999 14:18:47 -0500
Date: Thu, 30 Dec 1999 14:18:47 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble building CVS binutils
Message-ID: <19991230141847.W12629@thepuffingroup.com>
References: <19991230121655.T12629@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991230121655.T12629@thepuffingroup.com>; from Matthew Wilcox on Thu, Dec 30, 1999 at 12:16:55PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 30, 1999 at 12:16:55PM -0500, Matthew Wilcox wrote:
> Now back to finding out why nm no longer likes to work on vmlinux...

I'm closer...

in bfd/som.c, function setup_sections(), in the subspace_index loop, around
line 2025 here:

          subspace_asect->alignment_power = log2 (subspace.alignment);
          if (subspace_asect->alignment_power == -1)
            goto error_return;

subspace.alignment is _0_ in one of the subspaces.  HP's nm manages
just fine.  GNU's bails, which actually seems pretty reasonable to me :-)
Two questions spring to mind: 
Why is the linker producing a subspace with an alignment of 0?
What should BFD do when it encounters a file with such an alignment?

I shall continue investigating to see if I can find the answer to #1.
