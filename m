Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA19064
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 13:16:17 -0700
Message-Id: <200101242022.MAA21224@milano.cup.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 and newest CVS bits 
In-reply-to: Your message of "Wed, 24 Jan 2001 19:14:57 PST."
             <20010124191457.H3571@linuxcare.com>
Date: Wed, 24 Jan 2001 12:22:06 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:

> I cant explain
> why it used to work though, unless previous versions of ccio-dma.c
> handled zero length requests differently.

cvs log of ccio-dma.c explains:
revision 1.21
date: 2001/01/16 03:19:50;  author: rbrad;  state: Exp;  lines: +857 -457
...
- Added support so the ASSERTS actually work.
