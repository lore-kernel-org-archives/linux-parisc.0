Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA23792
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Oct 2000 19:05:47 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 11 Oct 2000 01:06:52 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA18426;
	Wed, 11 Oct 2000 12:03:16 +1100
Date: Wed, 11 Oct 2000 12:03:16 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Unable to compil linux kernel
In-Reply-To: <39E338E5.4ED45E2B@admin.france.hp.com>
Message-ID: <Pine.LNX.4.21.0010111157410.14915-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 10 Oct 2000, Bruno Vidal wrote:

> -> that the problem, where this "-lc" comes from ???

That's libc.a or libc.so  You need to compile and install glibc.

Incidentally, it's often useful to add -v to a failing gcc command line to
see exactly how gcc is calling the assembler/linker.  For link problems,
-Wl,-t also can help.

-- 
Linuxcare.  Support for the Revolution.
