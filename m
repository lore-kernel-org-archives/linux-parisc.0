Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id B278D482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 13:02:34 -0700 (MST)
Date: Fri, 16 Nov 2001 13:02:33 -0700
To: Michael Wood <mwood@its.uct.ac.za>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64bit kernels boot on C200 (finally) :)
Message-ID: <20011116130233.D10936@beavis.ybsoft.com>
References: <20011115123203.A2337@beavis.ybsoft.com> <20011115200102.E25491@parcelfarce.linux.theplanet.co.uk> <20011116173740.A7011@marmite.its.uct.ac.za>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011116173740.A7011@marmite.its.uct.ac.za>
From: rbradetich@uswest.net (Ryan Bradetich)
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

> The last time I tried a 64 bit kernel with lasi_82596.c (a few
> weeks ago), the network card would not work.  When the driver
> loaded it complained that sizeof(somestruct) was 64.  I had a
> look at the code and saw that it was expecting it to be 32.

yeah, I was confused.  C200 has tulip, K460 has lasi_82596.  Talking
with Richard Hirst, it sounds like making this driver 64-bit clean
would be non-trivial ... so this will probably be one of my pet
project that takes a year to get finished :)

> I've been using 32 bit kernels since then.  I don't think
> lasi_82596.c has changed significantly since I last tried it in
> a 64 bit kernel.
> 
> This was on a D270.

Cool, if your D270 also uses it, maybe you will get it ported
before I do :)

- Ryan
