Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA23381
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 21:52:42 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 21 Nov 2000 04:54:22 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA25431;
	Tue, 21 Nov 2000 15:38:57 +1100
Date: Tue, 21 Nov 2000 15:38:57 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: Paul Bame <bame@fc.hp.com>, mkp@mkp.net, parisc-linux@thepuffingroup.com
Subject: Re: A DT_INIT/DT_FINI glibc patch. 
In-Reply-To: <Pine.LNX.4.21.0011211314450.15623-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0011211537010.15623-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 21 Nov 2000, I wrote:

> Instead the .note.ABI-tag section should be examined to determine the
> target, which sadly isn't set correctly at the moment.  :-(

Actually, it is set correctly.  A comment in csu/abi-note.S was wrong.

-- 
Linuxcare.  Support for the Revolution.
