Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA05324
	for <parisc-linux@puffin.external.hp.com>; Sat, 19 Aug 2000 11:23:56 -0600
Received: from ppp-1-51.cvx3.telinco.net (HELO rhirst.linuxcare.com) (@212.1.144.51)
  by mailserv2.iuinc.com with SMTP; 19 Aug 2000 17:23:43 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id D644AB005; Sat, 19 Aug 2000 18:22:45 +0100 (BST)
Date: Sat, 19 Aug 2000 18:22:45 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] test6 merge
Message-ID: <20000819182245.F13870@linuxcare.com>
References: <20000815160510.C7757@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000815160510.C7757@vodka.thepuffingroup.com>; from matthew@wil.cx on Tue, Aug 15, 2000 at 04:05:10PM -0400
List-ID: <linux-parisc.vger.kernel.org>

My Zalon/53c720 problem is caused by changes in the way drivers/scsi
is built.  It used to build scsi.a, it now builds scsidrv.o.
If I include only one of sym53c8xx.c (for 53c875 on PCI), or ncr53c8xx.c
(for 53c720) all is well - if I include both things break.

Those two files have a number of function names in common; they are
declared static, so it shouldn't matter.  ncr_chip_reset() is one
example.  In practice, the code in ncr53c8xx.c tries to call its local
ncr_chip_reset(), but ends up in the ncr_chip_reset() function in
sym53c8xx.c.

It appeared to work fine with 2.3.99pre8, and I havn't changed my
cross compiler.

Richard
