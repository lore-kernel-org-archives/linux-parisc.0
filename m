Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6195482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Jun 2001 19:39:30 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 158Xif-0005fh-00; Sat, 09 Jun 2001 02:39:17 +0100
Date: Sat, 9 Jun 2001 02:39:17 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] memcpy_fromio() seems partially broken [with patch]
Message-ID: <20010609023917.C28264@parcelfarce.linux.theplanet.co.uk>
References: <20010608213850.B827A482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010608213850.B827A482A@dsl2.external.hp.com>; from deller@gmx.de on Fri, Jun 08, 2001 at 11:37:31PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 08, 2001 at 11:37:31PM +0200, Helge Deller wrote:
> while I was playing with a few network-cards in the c3k I found a strange 
> behaviour when copying unaligned data with memcpy_fromio() off the PCI bus.
> 
> Background: 
> I wanted to copy data off the network-card (HP J2585A) from an 4-byte aligned 
> PCI address to an 2-byte aligned (b/c of skb_reserve(skb, 2)) memory-address 
> with memcpy_fromio().
> The current code in CVS for memcpy_fromio() copied byteswapped and/or 
> completely wrong data for all copied values, while the following 
> memcpy_fromio() worked without problems:

This is very bizarre.  Following the codepaths, the current code does:

	if (((unsigned long)dest & 3) != (src & 3))
		goto bytecopy;

 bytecopy:
	while (count--) {
		*(char *)dest = readb(src++);
		((char *)dest)++;
	}

and i don't see how that can possibly do byteswapping.  unless byteswapping
is necessary and this code is failing to do that?  Your code is doing:

         if (((unsigned long)dest & 3) != (src & 3))
                 goto wordcopy;

  wordcopy:
         if (src & 3)
                 goto bytecopy;
  wordcopy_loop:
         value = readl(src);
         *((char*)dest) = (char) (value >> 24);  dest++;
         if (--count == 0) return;
         *((char*)dest) = (char) (value >> 16);  dest++;
         if (--count == 0) return;
         *((char*)dest) = (char) (value >> 8);   dest++;
         if (--count == 0) return;
         *((char*)dest) = (char) (value);  dest++;
         if (count) goto wordcopy_loop;
         return;

which is doing a byteswap on the  value returned from readl!  This seems
pretty grotesque to me.  I want to hear from someone (eg grant) who can
say what's actually going on here..

-- 
Revolutions do not require corporate support.
