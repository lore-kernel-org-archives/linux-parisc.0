Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA01712
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 03:26:30 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 25 Jan 2001 10:30:09 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 09284B008; Thu, 25 Jan 2001 10:19:18 +0000 (GMT)
Date: Thu, 25 Jan 2001 10:19:18 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0 merge mangle our tree?
Message-ID: <20010125101918.M3571@linuxcare.com>
References: <200101250346.TAA21555@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101250346.TAA21555@milano.cup.hp.com>; from grundler@cup.hp.com on Wed, Jan 24, 2001 at 07:46:40PM -0800
List-ID: <linux-parisc.vger.kernel.org>

Main branch is certainly broken.  e.g. drivers/pci/Makefile makes
drivers/pci/pci.a but Makefile tries to link drivers/pci/drivers.o
I fixed that in my tree but then got masses of unresolved
references on the final link.

Richard
