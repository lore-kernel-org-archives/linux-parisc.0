Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A07549F6
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 09:38:47 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15rLRW-0002RI-00; Wed, 10 Oct 2001 16:38:46 +0100
Date: Wed, 10 Oct 2001 16:38:46 +0100
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: "Michael S . Zick" <mszick@pflash.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011010163846.E24923@parcelfarce.linux.theplanet.co.uk>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <01101003320900.00964@Wolf-01> <20011010154810.D24923@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011010154810.D24923@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Oct 10, 2001 at 03:48:10PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 10, 2001 at 03:48:10PM +0100, Matthew Wilcox wrote:
> I'm not sure which IO ports correspond the ISA and which to EISA.
> Guessing based on the hp100 driver, I decided that ports less than 0x400
> were ISA and the rest were EISA.  Anyone want to explain port numbers
> to me properly?  The description in the Mongoose ERS assumes you know
> a fair bit about EISA, and I don't.

Ah, I found an appendix :-)

EISA cards have a slot number which determines the upper nybble of their
IO port numbers.  Then within that 0xfff of space, they use 0-ff, 400-4ff,
800-8ff, c00-cff.  The rest are ISA ports (or aliases of ISA ports).

So here's the function to use:

static inline unsigned long eisa_permute(u16 port)
{
	if (port & 0x0300) {
		return 0xfc000000 | ((port & 0xfc00) >> 6) | ((port & 0x3f8) << 9) | (port & 7);
	} else {
		return 0xfc000000 | port;
	}
}

-- 
Revolutions do not require corporate support.
