Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8E80F482B
	for <parisc-linux@parisc-linux.org>; Sun,  8 Jul 2001 19:30:50 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15JPsu-0000oj-00; Mon, 09 Jul 2001 02:30:48 +0100
Date: Mon, 9 Jul 2001 02:30:48 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] I think WAX is broken
Message-ID: <20010709023048.S6103@parcelfarce.linux.theplanet.co.uk>
References: <willy@debian.org> <200107090103.TAA09348@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107090103.TAA09348@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Sun, Jul 08, 2001 at 07:03:20PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jul 08, 2001 at 07:03:20PM -0600, Grant Grundler wrote:
> Hey! that's mine! :^P

It's still obscure.  I know x86 does something similar, and I think it's
obfuscated too.

> Someone needs to understand what "((addr & 0xfc00) >> 6)" does.
> It looks like it overlaps with "((addr & 0x03f8) << 9)".

fc00 >> 6 = 3f0
03f8 << 9 = 7f000
7 = 7

1111'1100'0000'0000 -> 0000'0000'0011'1111'0000
0000'0011'1111'1000 -> 0111'1111'0000'0000'0000
0000'0000'0000'0111 -> 0000'0000'0000'0000'0111

1111'1111'1111'1111 -> 0111'1111'0011'1111'0111

Icky.  And it means we can't do away with the function calls for inb/outb.
*sigh*.

-- 
Revolutions do not require corporate support.
