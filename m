Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA18966
	for <parisc-linux@puffin.external.hp.com>; Mon, 3 Jul 2000 14:19:52 -0600
Received: from ottawa.linuxcare.com (HELO localhost.localdomain) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 3 Jul 2000 20:21:16 -0000
Date: Mon, 3 Jul 2000 15:15:39 -0400
From: willy@vodka.thepuffingroup.com
To: Alan Modra <alan@linuxcare.com.au>
Cc: Paul Bame <bame@fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs
Message-ID: <20000703151539.K12436@vodka.thepuffingroup.com>
References: <Pine.LNX.4.21.0006231116510.24137-100000@front.linuxcare.com.au> <Pine.LNX.4.21.0006232007520.26260-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0006232007520.26260-100000@front.linuxcare.com.au>; from Alan Modra on Fri, Jun 23, 2000 at 08:34:43PM +1000
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 23, 2000 at 08:34:43PM +1000, Alan Modra wrote:
> Hi Paul,
>    I nearly forgot to follow up with the results of my kernel build.  It
> was "ld -r" that caused the failure, and the following patch to the kernel
> Makefile cures the build problem for me.  Not tested as I don't have any
> hp hardware.

Applying that patch to the kernel makefile and the r8-patch to the current
CVS binutils-2.10 yields a working kernel.  Thanks, Alan.

-- 
The Sex Pistols were revolutionaries.  The Bay City Rollers weren't.
