Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA04982
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Nov 2000 19:33:37 -0700
Date: Sun, 5 Nov 2000 21:34:54 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] string.h warnings
In-Reply-To: <200011060218.SAA02082@milano.cup.hp.com>
Message-ID: <Pine.BSO.4.21.0011052130550.30062-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>



On Sun, 5 Nov 2000, Grant Grundler wrote:
> When linux/arch/parisc/kernel/pci.c built, I get the following
> warnings:
> /linux/kwdb64/linux/include/linux/string.h:54: warning: conflicting types for built-in function `strlen'
> /linux/kwdb64/linux/include/linux/string.h:61: warning: conflicting types for built-in function `memset'
> /linux/kwdb64/linux/include/linux/string.h:64: warning: conflicting types for built-in function `memcpy'
> /linux/kwdb64/linux/include/linux/string.h:73: warning: conflicting types for built-in function `memcmp'

For some reason I had numerous problems with string.h not being included
when building ncurses natively with the nfsroot tarball.  (Also the 
nfsroot tarball seems to not be able to find the crt* objects by default)

--
Brian S. Julin
