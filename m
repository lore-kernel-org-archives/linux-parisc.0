Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA05017
	for <parisc-linux@puffin.external.hp.com>; Fri, 21 Jul 2000 15:53:36 -0600
Date: Fri, 21 Jul 2000 23:55:21 +0200
From: Gyula Matics <mgyula@pi.satimex.tvnet.hu>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HIL support on 715/old ?
Message-ID: <20000721235521.A6660@pi.satimex.tvnet.hu>
References: <20000719103952.18203.qmail@web510.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000719103952.18203.qmail@web510.mail.yahoo.com>; from ulrich_strelow@yahoo.com on Wed, Jul 19, 2000 at 03:39:52AM -0700
List-ID: <linux-parisc.vger.kernel.org>

> As I wrote earlier to this list ( see
> http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/06-Jun/0018.html
> ) the linux-2.3-pre8 is not able to boot on a 715/old.
> It hangs during the initialization of the ASP chip. So
> I guess that HIL (which depends on ASP) is not working
> right now either.

actually, the hang happens during parport initialization, when it tests
for ps2 (bi-directional) support.

It works fine without parport support.

Gyula
