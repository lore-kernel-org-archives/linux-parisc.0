Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob05.one.net.au (mail-ob05.one.net.au [61.12.0.165])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47641482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 May 2001 22:56:26 -0600 (MDT)
Received: Received: [from squeak.local ([203.101.38.142])
	by mail-ob05.one.net.au  with SMTP id f4U4tlw13094
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 May 2001 14:55:47 +1000 (EST)]
From: amodra@one.net.au
Date: Wed, 30 May 2001 14:33:58 +0930
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010530143358.G12034@squeak.one.net.au>
References: <200105300450.WAA08392@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200105300450.WAA08392@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Tue, May 29, 2001 at 10:50:46PM -0600
Subject: [parisc-linux] Re: Using r2 for millicode return pointer
List-ID: <linux-parisc.vger.kernel.org>

On Tue, May 29, 2001 at 10:50:46PM -0600, John Marvin wrote:
> 
> Alan,
> 
> I am cc'ing parisc-linux also, since there are other parisc gcc experts
> who may have an opinion on this. For those new to this, I found a
> bug where a procedure calls millicode, which on Linux uses r2 as
> a return pointer, however, gcc wasn't aware of that.
> 
> It looks like the cause of this bug is that we changed the return
> pointer for millicode from r31 to r2. Was this a deliberate choice?
> 
> On HP-UX, millicode uses r31 for a return pointer.  This allows leaf
> routines to call millicode without having to save r2.  I notice that the
> code that you patched has a clobber for r31, which is not necessary
> (currently) for Linux.  Is this code shared with the HP-UX version of gcc?
> If not, we should remove the r31 clobbers, since they are unecessary and
> will allow more efficient usage for r31.
> 
> If this code is shared, perhaps that would be another motivation for
> changing the Linux copy of the millicode to use r31, if possible (I
> don't know what the motivation for using r2 was, so I don't know if
> this is reasonable).

It's a 64-bit vs. 32-bit ABI issue.  64-bit uses r2 as the return
for millicode.  See devresource.hp.com/STK/partner/pa64rt.pdf, chapter 5

-- 
Alan

PS: I was wrong about this bug affecting the 32-bit compiler.
