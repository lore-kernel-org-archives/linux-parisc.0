Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA17446
	for <parisc-linux@puffin.external.hp.com>; Fri, 30 Apr 1999 21:00:01 -0600
Message-ID: <19990501030804.06634@insula.local>
Date: Sat, 1 May 1999 03:08:04 +0000
From: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
To: Alex deVries <adevries@redhat.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linker problems
Reply-To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
References: <Pine.LNX.3.96.990430190529.10592L-100000@devserv.devel.redhat.com> <19990501022458.64384@insula.local> <19990501025751.05359@insula.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990501025751.05359@insula.local>; from Philipp Rumpf on Sat, May 01, 1999 at 02:57:51AM +0000
List-ID: <linux-parisc.vger.kernel.org>

> I typoed there, use 1.4. We now die with an undefined reference to $global$.
> should not be exactly hard to fix I guess but it is 5am here :)

not hard at all. here we are:

prumpf@insula:~/cvs-s/parisc/linux > ls -l vmlinux 
-rwxr-xr-x   1 prumpf   users      353695 May  1 03:01 vmlinux

I'll commit the $global$ change now. someone tell me how far the boot gets,
ok ? (not that I expect much).
