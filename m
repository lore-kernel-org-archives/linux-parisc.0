Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id EAB284A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 11:19:36 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14PqEJ-00029U-00; Mon, 05 Feb 2001 18:19:11 +0000
Date: Mon, 5 Feb 2001 18:19:11 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: penfold@customware.com.au, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] _working_ rbootd for redhat
Message-ID: <20010205181911.A5520@parcelfarce.linux.theplanet.co.uk>
References: <200102041048.VAA00309@customware.com.au> <3A7D69B4.896F63D6@dot.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A7D69B4.896F63D6@dot.at>; from christoph.plattner@dot.at on Sun, Feb 04, 2001 at 03:39:48PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Feb 04, 2001 at 03:39:48PM +0100, Christoph Plattner wrote:
> Hello !
> 
> For the SCSI I have nothing fixed !
> It works out of the box.
> 
> I have not sent any patch. I only tried it and it works.
> So to all PA-RISC hackers, add the TRAP 18 there in the main stream !!

Yes, and no.  we need a proper trap 18 handler that checks to see whether
it's a page fault or a misaligned data reference, and calls the right
handler.  This should not be too hard to write, but i don't have time
right now.

-- 
Revolutions do not require corporate support.
