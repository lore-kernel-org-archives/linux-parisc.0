Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA13188
	for <parisc-linux@puffin.external.hp.com>; Wed, 19 Jul 2000 23:41:26 -0600
Message-Id: <200007200543.HAA14216@zaphod.halden.lillfab.se>
Date: Thu, 20 Jul 2000 07:43:00 +0200 (CEST)
From: 5116@telia.com
Reply-To: 5116@telia.com
Subject: Re: [parisc-linux] HIL support on 715/old ?
To: Ulrich Strelow <ulrich_strelow@yahoo.com>
cc: parisc-linux@thepuffingroup.com, Matthew Wilcox <matthew@wil.cx>
In-Reply-To: <20000719103952.18203.qmail@web510.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

On 19 Jul, Ulrich Strelow wrote:

> 
> As I wrote earlier to this list ( see
> http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/06-Jun/0018..html
> ) the linux-2.3-pre8 is not able to boot on a 715/old.
> It hangs during the initialization of the ASP chip. So
> I guess that HIL (which depends on ASP) is not working
> right now either.
It is the parallell port. I had the same problem last week. I have not
looked in to why, I just disabled it in .config

/Daniel
-- 
Daniel Engström - Lilla Fabriken AB - Technical Support
daniel@lillfab.se - Work related.  5116@telia.com - Private.
