Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA26789
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 May 2000 22:14:38 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 27 May 2000 04:14:57 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA04785;
	Sat, 27 May 2000 14:14:52 +1000
Date: Sat, 27 May 2000 14:14:52 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: willy@thepuffingroup.com
cc: Philipp Rumpf <prumpf@puffin.external.hp.com>,
        Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [MERGE] -pre8 merge status
In-Reply-To: <20000527005646.H31075@thepuffingroup.com>
Message-ID: <Pine.LNX.4.21.0005271412460.31822-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 27 May 2000 willy@thepuffingroup.com wrote:

> __lshrdi3.  It's referenced from fs/nfs/inode.c.  I'm damned if I can
> see where though (and I went through the gcc -E output trying to spot it.)

You won't spot it that way.  You need to look at the output of gcc -S.
It's likely from some long long arithmetic somewhere.

-- 
Linuxcare.  Support for the Revolution.
