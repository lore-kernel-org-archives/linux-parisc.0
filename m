Return-Path: <richard@sleepie.demon.co.uk>
Received: from mail.linuxcare.com (mail.linuxcare.com [69.36.243.36])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8FFC54903
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  4 May 2004 14:37:06 -0600 (MDT)
Received: from sleepie.demon.co.uk (cpc1-hem11-4-0-cust109.lutn.cable.ntl.com
	[80.2.252.109])
	by mail.linuxcare.com (8.12.11/8.12.8) with ESMTP id i44KZxDX025973;
	Tue, 4 May 2004 13:36:05 -0700
Date: Tue, 4 May 2004 21:33:30 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] palo-1.4 broken on 32bit ?
Message-ID: <20040504203330.GF9603@linuxcare.com>
References: <200405042136.28626.deller@gmx.de>
	<20040504201122.GA32258@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040504201122.GA32258@colo.lackof.org>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, May 04, 2004 at 02:11:22PM -0600, Grant Grundler wrote:
> On Tue, May 04, 2004 at 09:36:28PM +0200, Helge Deller wrote:
> > Hi all,
> > 
> > after apt-get upgrading to palo_1.4_hppa.deb it seems, that palo-1.4 isn't able any longer to boot up a 32bit Linux kernel on a 32bit Machine.
> > I've run several tests on a B180L, and only after downgrading to palo-1.3 I was able to boot again.
> > 
> > Am I the only one seeing this problem ? 
> 
> No - I've been seeing it on the c3600 as well.
> I haven't tried 64-bit kernels.
> And downgrading iplboot to 1.3 also solves it for me too.
> 
> palo 1.3 deb is available here in case someone has upgraded:
> 	http://iou.parisc-linux.org/~grundler/palo/palo_1.3_hppa.deb
> 
> thanks to paul bame for keeping those around.
> 
> > Anyone maybe has an idea what has been changed ?
> 
> nope...have to look at palo since it doesn't matter which
> kernel I attempt to boot, it doesn't work.
> 
> Note that I tried to build palo v1.2 and that failed the same way.
> So it's possibly a compiler issue with real-mode code.
> (Not that the compiler knows the difference...)

When I last tried to build palo 1.4 the iplboot turned out bigger
(8K, iirc) than the one in the official deb, and mine didn't work.
Didn't have time to figure out why.

Richard
