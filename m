Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA25834
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 May 2000 20:54:37 -0600
Message-ID: <20000526205433.C24675@puffin.external.hp.com>
Date: Fri, 26 May 2000 20:54:33 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: willy@thepuffingroup.com, Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [MERGE] -pre8 merge status
References: <200005262326.QAA09671@milano.cup.hp.com> <20000526233720.E31075@thepuffingroup.com> <20000526204522.B24675@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000526204522.B24675@puffin.external.hp.com>; from Philipp Rumpf on Fri, May 26, 2000 at 08:45:22PM -0600
List-ID: <linux-parisc.vger.kernel.org>

> grant: did you have CONFIG_SYSCTL set ?  if you didn't, that might
> explain your problems.

Okay, by the look of things RPC_DEBUG doesn't make sense if you don't
have CONFIG_SYSCTL too.  RPC_DEBUG always gets defined in current 2.3
versions, and presumably will be undefined in a stable kernel version.

I wouldn't really consider this a bug, but if anyone does he should
probably report it to whoever is working on that code in 2.3.

	Philipp Rumpf
