Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF47F492C
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 08:48:11 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15rKeY-0001cH-00; Wed, 10 Oct 2001 15:48:10 +0100
Date: Wed, 10 Oct 2001 15:48:10 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Michael S . Zick" <mszick@pflash.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011010154810.D24923@parcelfarce.linux.theplanet.co.uk>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <01101003320900.00964@Wolf-01>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01101003320900.00964@Wolf-01>; from mszick@pflash.com on Wed, Oct 10, 2001 at 03:32:09AM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 10, 2001 at 03:32:09AM -0500, Michael S . Zick wrote:
> Old ISA boards only do a 10-bit decode and it is a frequent occurance
> that old drivers don't "clean up" the unused high 6 bits.
> 
> Would it be reasonable to mask port numbers to 10 bits for ISA in the
> inb/outb routines?

Actually, I currently do this, but I'm not sure I should be.  The EISA
adapter has to do different things for ISA port IO and EISA port IO.
I'm not sure which IO ports correspond the ISA and which to EISA.
Guessing based on the hp100 driver, I decided that ports less than 0x400
were ISA and the rest were EISA.  Anyone want to explain port numbers
to me properly?  The description in the Mongoose ERS assumes you know
a fair bit about EISA, and I don't.

Here's the current code for this:

+static inline unsigned long eisa_permute(u16 port)
+{
+       if (port >= 0x400) {
+               return 0xfc000000 | port;
+       } else {
+               return 0xfc000000 | ((port & 0x3f8) << 9) | (port & 7);
+       }
+}

The ERS adds in (port & 0xfc00) >> 6, but the test ensures those bits
are clear, so there's no point.

-- 
Revolutions do not require corporate support.
