Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id DAAFA482A
	for <parisc-linux@parisc-linux.org>; Fri, 12 Oct 2001 02:46:51 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id CC5CBB00C; Fri, 12 Oct 2001 09:47:19 +0100 (BST)
Date: Fri, 12 Oct 2001 09:47:19 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011012094719.P11105@linuxcare.com>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <20011012074449.E25868@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011012074449.E25868@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Fri, Oct 12, 2001 at 07:44:49AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Oct 12, 2001 at 07:44:49AM +0100, Matthew Wilcox wrote:
> 
> OK, just committed 2.4.9-pa49 which makes my hp100 EISA card work:
> 
> 64 bytes from 15.1.50.0: icmp_seq=1 ttl=255 time=0.5 ms
> 
> Haven't made any effort to support busmastering cards yet, but having
> ioports, iomem & interrupts working should allow most cards to function.

Still can't get any interrupts out of my EISA scsi card in 715/75.

Richard
