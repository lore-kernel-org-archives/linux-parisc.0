Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA17268
	for <parisc-linux@puffin.external.hp.com>; Fri, 30 Apr 1999 20:49:45 -0600
Message-ID: <19990501025751.05359@insula.local>
Date: Sat, 1 May 1999 02:57:51 +0000
From: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
To: Alex deVries <adevries@redhat.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linker problems
Reply-To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
References: <Pine.LNX.3.96.990430190529.10592L-100000@devserv.devel.redhat.com> <19990501022458.64384@insula.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990501022458.64384@insula.local>; from Philipp Rumpf on Sat, May 01, 1999 at 02:24:58AM +0000
List-ID: <linux-parisc.vger.kernel.org>

> binutils/ld/emultempl/hppaelf.em is now version 1.2, was version 1.1.

I typoed there, use 1.4. We now die with an undefined reference to $global$.
should not be exactly hard to fix I guess but it is 5am here :)
