Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA23017
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Dec 1999 12:29:05 -0700
To: Matthew Wilcox <willy@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble building CVS binutils 
Reply-To: law@cygnus.com
In-reply-to: Your message of Thu, 30 Dec 1999 14:18:47 EST.
             <19991230141847.W12629@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Dec 1999 12:28:48 -0700
Message-ID: <14902.946582128@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <19991230141847.W12629@thepuffingroup.com>you write:
  > I'm closer...
  > 
  > in bfd/som.c, function setup_sections(), in the subspace_index loop, around
  > line 2025 here:
  > 
  >           subspace_asect->alignment_power = log2 (subspace.alignment);
  >           if (subspace_asect->alignment_power == -1)
  >             goto error_return;
  > 
  > subspace.alignment is _0_ in one of the subspaces.  HP's nm manages
  > just fine.  GNU's bails, which actually seems pretty reasonable to me :-)
  > Two questions spring to mind: 
  > Why is the linker producing a subspace with an alignment of 0?
  > What should BFD do when it encounters a file with such an alignment?
According to the SOM spec the subspace alignment must be greater than zero.
Thus, this seems like a bug in the HP linker.

jeff
