Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA15901
	for <parisc-linux@puffin.external.hp.com>; Fri, 12 Jan 2001 23:22:08 -0700
Received: (from andrew@localhost)
	by guinness.neep.com.au (8.9.3/8.9.3/Debian/GNU) id OAA30335
	for parisc-linux@thepuffingroup.com; Sat, 13 Jan 2001 14:25:29 +0800
Date: Sat, 13 Jan 2001 14:25:26 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trying to get a 735 working
Message-ID: <20010113142523.E13351@neep.com.au>
References: <1010112164816.ZM16737@cancun.rose.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1010112164816.ZM16737@cancun.rose.hp.com>; from cmoore@cancun.rose.hp.com on Fri, Jan 12, 2001 at 04:48:15PM -0800
List-ID: <linux-parisc.vger.kernel.org>

Chris Moore said:
> I'm trying to get a 735 to boot linux.  I don't currently have an x86
> Linux machine on which to run the toolchain so I can't compile a
> kernel, and the latest binary LIF image file at
> ftp:puffin.external.hp.com:/pub/parisc/binaries/kernels/old
> has an older kernel in it which won't boot on my 735.

Do you have any Unix-like system that you can run rbootd on?  The OS and
architecture is irrelevant.  This will allow you to boot from normal
compiled kernels over the network.

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
