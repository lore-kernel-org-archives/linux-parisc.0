Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA24131
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jan 2000 20:42:42 -0700
Sender: adevries@thepuffingroup.com
Message-ID: <387FDE4A.FE22FBBD@thepuffingroup.com>
Date: Fri, 14 Jan 2000 21:41:14 -0500
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] initcall and setup
References: <200001150113.RAA16646@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Just a clarification: The kernel will use ELF once the tool chain is
> in place. The kernel is SOM now only because of our dependency
> on HP-UX ld. Any forcasts for when we can switch to ELF?

Yup.  The 64 bit parisc GCC package will be released shortly.  We've
been busy packaging it up in the last couple of days.

After that, we'll have to start looking at making a 32 bit ELF
toolchain.

- Alex

-- 
Alex deVries
Director of Professional Services
The Puffins at Linuxcare
