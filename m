Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id A5276482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 02:37:50 -0600 (MDT)
Date: Thu, 30 May 2002 09:14:52 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Andy Walker <squawker@start.no>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fast-Wide Diff. SCSI on a 735
Message-ID: <20020530081452.GS3471@sleepie.demon.co.uk>
References: <200205291104.AA315359834@mail.centraltx.com> <20020529201334.8C23C482A@dsl2.external.hp.com> <1022707216.3cf54610c5ee8@nyepost.start.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1022707216.3cf54610c5ee8@nyepost.start.no>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, May 29, 2002 at 11:20:16PM +0200, Andy Walker wrote:
> Hi folks,
> 
> Just picked up a free 735/99 today, so suddenly I've become interested
> in the status of the Outfield 53c720 driver. Has there been any progress
> or is there just no information available? I'd be happy to test patches -
> or even dive into the code myself, but without docs that sounds a little
> pointless.

Specs for Outfield are available now, look for hardball_ers.pdf on the
web site.

Other 53c720 interfaces (e.g. bluefish) are supported via the
ncr53c8xx.c driver, but that doesn't work for outfield because the 735
is not cache coherent.  My next idea was to add basic 53c720 support to
the 53c700 driver, as that works older hardware.  Ryan was interested in
looking at that a while back, but I don't know what happened.  My excuse
is that I don't have 735 h/w to test on so it is no fun - but that's a
poor excuse really as I could use my bluefish card to get 53c700 working
with 53c720.

53c700.c would drive the 53c720 chip in 53c700 mode, so would be
relatively low performance (more interrupts than you would need if you
made the most of the 53c720 features), and it would be 8 bit only.
Those issues could perhaps be fixed in time, and it would be better than
nothing, anyway.

Richard
