Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA28804
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 04:35:53 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 2 Jan 2001 11:39:11 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA31767;
	Tue, 2 Jan 2001 22:37:14 +1100
Date: Tue, 2 Jan 2001 22:37:14 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 64bit xgcc build failing
In-Reply-To: <20001221201649.798A737C9E@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0101022233250.24351-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 21 Dec 2000, Matt Taggart wrote:

> /home/al-76/puffin/palinux/gcc/gcc/varasm.c: In function `assemble_integer':  
> /home/al-76/puffin/palinux/gcc/gcc/varasm.c:1910: parse error before `0'  

The culprit is line 100 of config/pa/pa64.h, currently

  while 0

It should be

  while (0)

-- 
Linuxcare.  Support for the Revolution.
