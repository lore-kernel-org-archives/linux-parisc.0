Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA13968
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Oct 2000 03:28:05 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 10 Oct 2000 09:28:55 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA31505;
	Tue, 10 Oct 2000 20:24:52 +1100
Date: Tue, 10 Oct 2000 20:24:52 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Unable to compil gcc2.96 on L2000/11.00/64 bits
In-Reply-To: <39E2CE16.E7D9A84F@admin.france.hp.com>
Message-ID: <Pine.LNX.4.21.0010102014070.20550-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 10 Oct 2000, Bruno Vidal wrote:

> -> no makefile for hppa1.1-linux/libiberty.
> Do you have any idea to correct that ?

libiberty/config.log should tell you what went wrong.  It's likely that
you need to install binutils (perhaps glibc too) and set up paths.
