Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA16826
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Nov 2000 17:11:24 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 2 Nov 2000 00:13:07 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13r80A-00082r-00; Thu, 02 Nov 2000 00:13:06 +0000
Date: Thu, 2 Nov 2000 00:13:06 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Cc: parisc-linux-cvs@puffin.external.hp.com
Subject: Re: linux bame
Message-ID: <20001102001306.A30325@parcelfarce.linux.theplanet.co.uk>
References: <200011012053.NAA15579@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011012053.NAA15579@puffin.external.hp.com>; from bame@puffin.external.hp.com on Wed, Nov 01, 2000 at 01:53:24PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Nov 01, 2000 at 01:53:24PM -0700, Paul Bame wrote:
> CVSROOT:	/home/cvs/parisc
> Module name:	linux
> Changes by:	bame	00/11/01 13:53:24
> 
> Modified files:
> 	include/asm-parisc64: posix_types.h 
> 
> Log message:
> Don't need a separate copy of this one either

err.. are you sure?  we used to get a lot of prototype problems when they
were the same file.  what's changed that they're now able to be the same?

-- 
Revolutions do not require corporate support.
