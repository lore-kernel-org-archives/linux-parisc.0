Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 098EF4A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Mar 2001 04:53:15 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 2234DB008; Fri, 23 Mar 2001 11:53:53 +0000 (GMT)
Date: Fri, 23 Mar 2001 11:53:53 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Robert Liesenfeld <xunil96@yahoo.com>
Cc: PA-RISC Linux List <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Init not found on 735/125?
Message-ID: <20010323115353.E19779@linuxcare.com>
References: <20010322155704.A19315@linuxcare.com> <20010323105042.15272.qmail@web5502.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010323105042.15272.qmail@web5502.mail.yahoo.com>; from xunil96@yahoo.com on Fri, Mar 23, 2001 at 02:50:42AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Mar 23, 2001 at 02:50:42AM -0800, Robert Liesenfeld wrote:
> Downloaded and compiled sash...tried passing init=/bin/sash in the lifimage.  Still no luck...I'm
> stumped.

Run tcpdump on the network to see what the parisc box is really trying
to access.  If you see it is reading the content of init or sash, then
you could add debug code to your kernel to see why it doesn't like
what it is reading.

Richard
