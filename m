Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7F7B482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 14:00:55 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15taOU-0007li-00; Tue, 16 Oct 2001 21:00:54 +0100
Date: Tue, 16 Oct 2001 21:00:54 +0100
From: Matthew Wilcox <willy@debian.org>
To: Jochen Friedrich <jochen@scram.de>
Cc: Tom <palinux@alaskatech.org>,
	PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011016210054.H15532@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.33.0110161110310.20693-100000@goliath.alaskatech.org> <Pine.LNX.4.33.0110162142230.13084-100000@alpha.bocc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0110162142230.13084-100000@alpha.bocc.de>; from jochen@scram.de on Tue, Oct 16, 2001 at 09:46:01PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Oct 16, 2001 at 09:46:01PM +0200, Jochen Friedrich wrote:
> An IBM Auto 16/4 Token Ring card is recognized, but doesn't work (instead, 
> i randomly get a stack dump during the module load).

Hmm.. could you try with the driver built in?  People have been reporting
that modules aren't working any more.

> parisc_ksyms.c is missing the exports for memcpy_toio and memcpy_fromio.

OK, that's easily fixed.

-- 
Revolutions do not require corporate support.
