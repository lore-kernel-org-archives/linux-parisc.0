Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0F1A8482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 08:37:51 -0700 (MST)
Received: from marmite.its.uct.ac.za ([137.158.26.155])
	by mail.uct.ac.za with smtp (Exim 3.33 #4)
	id 164l5N-000GTq-00
	for parisc-linux@lists.parisc-linux.org; Fri, 16 Nov 2001 17:39:21 +0200
Date: Fri, 16 Nov 2001 17:37:40 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64bit kernels boot on C200 (finally) :)
Message-ID: <20011116173740.A7011@marmite.its.uct.ac.za>
References: <20011115123203.A2337@beavis.ybsoft.com> <20011115200102.E25491@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011115200102.E25491@parcelfarce.linux.theplanet.co.uk>
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

On Thu, Nov 15, 2001 at 08:01:02PM +0000, Matthew Wilcox wrote:
> On Thu, Nov 15, 2001 at 12:32:03PM -0700, Ryan Bradetich wrote:
> > It is not perfect yet, still have a couple of bugs to work
> > out and fix:
> > 	1. sys32_ioctl: Unknown cmd fd(3) cmd(00004b50) arg(faf00788)
> > 	2. the ncr720 driver seemed to hang when I had a disk
> > 	   attached behind the bluefish card.
> > 
> > but here it is:
> > 
> > demo@vega:~$ uname -a
> > Linux vega 2.4.14-pa1 #2 Thu Nov 15 12:08:07 MST 2001 parisc64 unknown
> 
> i'm surprised the network works given the number of warnings
> when compiling lasi_82596.c with a 64-bit compiler.

The last time I tried a 64 bit kernel with lasi_82596.c (a few
weeks ago), the network card would not work.  When the driver
loaded it complained that sizeof(somestruct) was 64.  I had a
look at the code and saw that it was expecting it to be 32.

I've been using 32 bit kernels since then.  I don't think
lasi_82596.c has changed significantly since I last tried it in
a 64 bit kernel.

This was on a D270.

-- 
Michael Wood <mwood@its.uct.ac.za>
