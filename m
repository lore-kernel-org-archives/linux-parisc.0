Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C368A4833
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 11:50:21 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 157Ky0-0008J5-00; Tue, 05 Jun 2001 18:50:08 +0100
Date: Tue, 5 Jun 2001 18:50:08 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: "Michael S. Zick" <mszick@pflash.com>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	debian-hppa@lists.debian.org, parisc-linux@thepuffingroup.com,
	parisc-linux@parisc-linux.org
Message-ID: <20010605185008.R7349@parcelfarce.linux.theplanet.co.uk>
References: <20010605160653.L25745@linuxcare.com> <01060511501903.00472@wolf01.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01060511501903.00472@wolf01.my.home>; from mszick@pflash.com on Tue, Jun 05, 2001 at 11:36:37AM -0500
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Re: pa-risc V0.9 on Model 720 (+ others)
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 05, 2001 at 11:36:37AM -0500, Michael S. Zick wrote:
> Without either BA's defined - in/out Byte, Word, Long does not have
> a prototype in mem.c (amoung other places) - the compiler guesses
> (incorrectly) at what inb() and outb() mean.

That's a known-bad configuration.  You have to have some kind of PCI
or EISA controller configured in.

-- 
Revolutions do not require corporate support.
