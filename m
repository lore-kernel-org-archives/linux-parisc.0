Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6D93482A
	for <parisc-linux@parisc-linux.org>; Mon, 21 May 2001 16:41:38 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 151yM6-0000bZ-00; Mon, 21 May 2001 23:40:50 +0100
Date: Mon, 21 May 2001 23:40:50 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Paul Bame <bame@riverrock.org>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org,
	bame@www.riverrock.org
Subject: Re: [parisc-linux] More unaligned references
Message-ID: <20010521234050.J23718@parcelfarce.linux.theplanet.co.uk>
References: <20010521225006.I23718@parcelfarce.linux.theplanet.co.uk> <matthew@wil.cx> <m151y8p-001VltC@bame.riverrock.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m151y8p-001VltC@bame.riverrock.org>; from bame@riverrock.org on Mon, May 21, 2001 at 04:27:07PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, May 21, 2001 at 04:27:07PM -0600, Paul Bame wrote:
> FYI in case others run across it, this was discovered to be the ".plt-1" bug.
> To find out, use 'objdump -h' to figure out where .plt is loaded.  Then add
> 0x4800 plus 0xfb plus the dp register (r27).  If that's .plt-1 you've found
> the bug which is/should-be squashed in recent bits.

Not convinced.  Yes, this is in fact .plt-1.  However, that bug is
supposed to be both fixed in this version of binutils and an assert
added to catch it happening.  However, no assert is being tripped.
FWIW, the offending caller is:

     1d0:       eb e0 00 00     b,l 1d8 <create_server_config+0x5c>,r31
                        1d0: R_PARISC_PCREL17F  $$dyncall


-- 
Revolutions do not require corporate support.
