Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA29405
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 01:51:34 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 2 Nov 2000 08:53:16 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA10369;
	Thu, 2 Nov 2000 19:51:19 +1100
Date: Thu, 2 Nov 2000 19:51:19 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Paul Bame <bame@noam.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] new method for 64-bit parisc tree
In-Reply-To: <E13r2Ag-0000Xp-00@noam.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0011021825100.26717-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 1 Nov 2000, Paul Bame wrote:

> The future parisc64 tree ONLY contains files which are different from,
> or in addition to, those in the parisc tree.  When you 'make config'
> or 'make oldconfig', each file in the parsic tree is symbolically
> linked as the same file in the parisc64 tree.  This enables all
> the rest of the tools/build to work normally.  'make distclean' includes
> a step to remove all the symlinks.

Instead, can't you simply play tricks with -I, and add a symbolic link
asm -> ../asm-parisc in asm-parisc64)?  The idea being to end up with
an include path looking like
"-I $(TOPDIR)/include -I $(TOPDIR)/include/asm"

That way, asm/foo.h is found by the first -I if we have asm-parisc64/foo.h,
and is found by the second if asm-parisc/foo.h exists but not
asm-parisc64/foo.h.  Hmm, you might also need -I-

-- 
Linuxcare.  Support for the Revolution.
