Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA25322
	for <parisc-linux@puffin.external.hp.com>; Mon, 30 Oct 2000 01:55:00 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 30 Oct 2000 08:56:33 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA05918;
	Mon, 30 Oct 2000 19:50:48 +1100
Date: Mon, 30 Oct 2000 19:50:47 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: John Marvin <jsm@fc.hp.com>, parisc-linux@thepuffingroup.com,
        opensource@cup.hp.com
Subject: Re: [parisc-linux] hppa64-linux gcc bug
In-Reply-To: <200010260404.VAA21509@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0010301937470.25085-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I've checked in a fix for the arg_pointer problem on pa64 that should fix
the problem you found with create_proc_entry (and probably elsewhere in
the kernel too).  It's not the ideal fix, as I ran into other problems
trying to eliminate the arg_pointer completely, and it's taken up a large
lump of my time already.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
