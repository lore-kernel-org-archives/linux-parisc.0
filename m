Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA115482A
	for <parisc-linux@parisc-linux.org>; Mon, 16 Apr 2001 11:41:19 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14pD02-0006kd-00
	for parisc-linux@parisc-linux.org; Mon, 16 Apr 2001 18:41:18 +0100
Date: Mon, 16 Apr 2001 18:41:18 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Booting 735/99
Message-ID: <20010416184118.B18045@parcelfarce.linux.theplanet.co.uk>
References: <007701c0c415$3f4779a0$1401a8c0@peewee> <20010413233152.F8797@neep.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010413233152.F8797@neep.com.au>; from andrew@neep.com.au on Fri, Apr 13, 2001 at 11:31:54PM +0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Apr 13, 2001 at 11:31:54PM +0800, Andrew Shugg wrote:
> I don't think a partition table written on the i386 would be readable by
> the HP box though.

Actually, it is.  We decided to simply adopt the x86 partition format
rather than defining a new one.

-- 
Revolutions do not require corporate support.
