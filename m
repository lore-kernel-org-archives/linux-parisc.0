Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DC27482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Jul 2001 07:32:56 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15RDAE-0006lN-00; Mon, 30 Jul 2001 14:32:54 +0100
Date: Mon, 30 Jul 2001 14:32:54 +0100
From: Matthew Wilcox <willy@debian.org>
To: caslivkoff@telocity.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Errors trying to compile 2.4.6-pa22
Message-ID: <20010730143254.A25867@parcelfarce.linux.theplanet.co.uk>
References: <3B64F11B.DC4EEF75@telocity.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B64F11B.DC4EEF75@telocity.com>; from caslivkoff@telocity.com on Mon, Jul 30, 2001 at 01:31:07AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jul 30, 2001 at 01:31:07AM -0400, caslivkoff@telocity.com wrote:
> Hi list,
> 
> I've been trying to compile a new kernel on my 712/80 (128MB RAM) while
> running 2.4.0-pa25. I downloaded linux-latest.tar.gz (2.4.6-pa22),

> drivers/char/char.o: In function `read_port':
> drivers/char/char.o(.text.read_port+0x6c): undefined reference to `inb'

You turned off CONFIG_PCI.  This is not currently supported; but we were
discussing how to fix it yesterday.  For the moment, enable it.

-- 
Revolutions do not require corporate support.
