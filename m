Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA07549
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 05:07:23 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 25 Jan 2001 12:11:19 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 867EDB008; Thu, 25 Jan 2001 12:00:27 +0000 (GMT)
Date: Thu, 25 Jan 2001 12:00:27 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0 merge mangle our tree?
Message-ID: <20010125120027.P3571@linuxcare.com>
References: <200101250346.TAA21555@milano.cup.hp.com> <20010125101918.M3571@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010125101918.M3571@linuxcare.com>; from rhirst@linuxcare.com on Thu, Jan 25, 2001 at 10:19:18AM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 25, 2001 at 10:19:18AM +0000, Richard Hirst wrote:
> Main branch is certainly broken.  e.g. drivers/pci/Makefile makes
> drivers/pci/pci.a but Makefile tries to link drivers/pci/drivers.o
> I fixed that in my tree but then got masses of unresolved
> references on the final link.

For the main branch, Makefile appears to be from 2.4.0, but
drivers/pci/Makefile isn't.  I dropped in a new drivers/pci/Makefile
and the next problem is that it isn't building anything in arch/parisc/lib.
Make.Rules change, maybe.

Giving up for now,
  Richard
