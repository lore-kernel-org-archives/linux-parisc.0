Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BABA3482A
	for <parisc-linux@parisc-linux.org>; Wed, 25 Apr 2001 12:44:18 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14sU3n-0001fJ-00; Wed, 25 Apr 2001 19:30:43 +0100
Date: Wed, 25 Apr 2001 19:30:43 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <willy@ldl.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3
Message-ID: <20010425193043.O18464@parcelfarce.linux.theplanet.co.uk>
References: <20010425010722.G1166@zumpano.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010425010722.G1166@zumpano.fc.hp.com>; from willy@ldl.fc.hp.com on Wed, Apr 25, 2001 at 01:07:22AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Apr 25, 2001 at 01:07:22AM -0600, Matthew Wilcox wrote:
> I've ported most of the remaining changes from our tree into a snapshot of today's
> upstream CVS.

I meant to say more about this last night.  The things I've skipped are:

 * a patch which does #define malloc(x) memalign(16,x)

This clearly is insufficient as Richard pointed out a few weeks ago.
We need to get malloc fixed differently.

 * Jes' patch to define ELFOSABI_LINUX and various macros which use that.
   The macros are only defined, not used, so omitting them has no
   ill-effect.  Ulrich has declined to accept these patches as part of
   glibc until we explain why it was needed.  Jes doesn't remember why
   he made this patch, so I'm leaving it out.  The curious can find the
   discussion in the mailing list archives from last december.

-- 
Revolutions do not require corporate support.
