Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc1-hem11-4-cust109.lutn.cable.ntl.com [80.2.252.109])
	by dsl2.external.hp.com (Postfix) with ESMTP id F368348B8
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 11:20:46 -0600 (MDT)
Date: Sun, 28 Sep 2003 17:56:31 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030928165631.GS5759@sleepie.demon.co.uk>
References: <20030927072449.5AF0F494058@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030927072449.5AF0F494058@palinux.hppa>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 willy
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

On Sat, Sep 27, 2003 at 01:24:49AM -0600, Matthew Wilcox wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	willy	03/09/27 01:24:49
> 
> Modified files:
> 	drivers/scsi   : Makefile NCR_Q720.c ncr53c8xx.c 
> 	                 sym53c8xx_defs.h 
> 
> Log message:
> SIMULATED_INTFLY is always true for ncr720 chips, so remove the other case.

Only because I didn't get it to work properly when I did the original
720 support, iirc.  The chip does have INTFLY.  I _think_ INTFLY worked
a bit, but the driver tended to miss interrupts sometimes.  Could easily
have been a driver bug.  Was a long time ago now though, so I could be
misremembering.

Richard
