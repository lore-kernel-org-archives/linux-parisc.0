Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F466482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 Aug 2001 09:08:28 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15cpuF-00032x-00; Fri, 31 Aug 2001 16:08:27 +0100
Date: Fri, 31 Aug 2001 16:08:27 +0100
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel failures
Message-ID: <20010831160827.C5126@parcelfarce.linux.theplanet.co.uk>
References: <3B8F18EF.9060404@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3B8F18EF.9060404@hrzpub.tu-darmstadt.de>; from rscholz@hrzpub.tu-darmstadt.de on Fri, Aug 31, 2001 at 06:56:15AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 31, 2001 at 06:56:15AM +0200, Rüdiger Scholz wrote:
> When I played a little bit  with the kernel, I found some failures.
> My machine is a 715/100 with a second  Graphics-Card (Coral SGC). If the 

Could you change kernel/printk.c, line 36 from:
#define DEFAULT_CONSOLE_LOGLEVEL 7 /* anything MORE serious than KERN_DEBUG */
to:
#define DEFAULT_CONSOLE_LOGLEVEL 9 /* anything MORE serious than KERN_DEBUG */

This should print out more debug messages and might help diagnose the problem.

-- 
Revolutions do not require corporate support.
