Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D0B8482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 13:01:04 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 164Sh4-0007fI-00; Thu, 15 Nov 2001 20:01:02 +0000
Date: Thu, 15 Nov 2001 20:01:02 +0000
From: Matthew Wilcox <willy@debian.org>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64bit kernels boot on C200 (finally) :)
Message-ID: <20011115200102.E25491@parcelfarce.linux.theplanet.co.uk>
References: <20011115123203.A2337@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011115123203.A2337@beavis.ybsoft.com>; from rbradetich@uswest.net on Thu, Nov 15, 2001 at 12:32:03PM -0700
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

On Thu, Nov 15, 2001 at 12:32:03PM -0700, Ryan Bradetich wrote:
> It is not perfect yet, still have a couple of bugs to work
> out and fix:
> 	1. sys32_ioctl: Unknown cmd fd(3) cmd(00004b50) arg(faf00788)
> 	2. the ncr720 driver seemed to hang when I had a disk
> 	   attached behind the bluefish card.
> 
> but here it is:
> 
> demo@vega:~$ uname -a
> Linux vega 2.4.14-pa1 #2 Thu Nov 15 12:08:07 MST 2001 parisc64 unknown

i'm surprised the network works given the number of warnings when compiling
lasi_82596.c with a 64-bit compiler.

btw, does a 64-bit kernel with the 32-bit wrapper options enabled boot
on a PAT PDC box like A500?

-- 
Revolutions do not require corporate support.
