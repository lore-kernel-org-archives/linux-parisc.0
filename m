Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0F8C482A
	for <parisc-linux@parisc-linux.org>; Fri, 12 Oct 2001 00:44:50 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15rw3t-0004aj-00
	for parisc-linux@parisc-linux.org; Fri, 12 Oct 2001 07:44:49 +0100
Date: Fri, 12 Oct 2001 07:44:49 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011012074449.E25868@parcelfarce.linux.theplanet.co.uk>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Oct 10, 2001 at 07:24:41AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

OK, just committed 2.4.9-pa49 which makes my hp100 EISA card work:

64 bytes from 15.1.50.0: icmp_seq=1 ttl=255 time=0.5 ms

Haven't made any effort to support busmastering cards yet, but having
ioports, iomem & interrupts working should allow most cards to function.

-- 
Revolutions do not require corporate support.
