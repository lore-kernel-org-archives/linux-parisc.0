Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA17817
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 May 2000 06:48:18 -0600
Message-ID: <20000518064806.A17788@puffin.external.hp.com>
Date: Thu, 18 May 2000 06:48:06 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] New binutils available from cvs
References: <20000518045138.C14031@puffin.external.hp.com> <Pine.LNX.4.21.0005182055320.6449-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0005182055320.6449-100000@front.linuxcare.com.au>; from Alan Modra on Thu, May 18, 2000 at 09:09:09PM +1000
List-ID: <linux-parisc.vger.kernel.org>

> I'm talking about floating point compare instruction conditions, for
> example: "fcmp,dbl,!?>= %fr4,%fr5"

Oh, I see.  (I stupidly only checked the condition codes tables in the
architecture manual, the floating point conditions were in the FPU
section).

So, '!' isn't usable as either line comment or '\n'-equivalent
character without hacking.  Let's just not use it ?

	Philipp Rumpf
