Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA13744
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Oct 1999 03:48:05 -0600
Message-ID: <001e01bf1884$cd0d16c0$16f950cb@80.249.6.mmm.com.hk>
From: "William M. Brack" <wbrack@mmm.com.hk>
To: <parisc-linux@thepuffingroup.com>
References: <199910170225.TAA25426@milano.cup.hp.com>
Subject: Re: [parisc-linux] rebuild of 53c7xx.o
Date: Sun, 17 Oct 1999 17:48:40 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

This is caused because the Makefile in drivers/scsi has an explicit rule for
making 53c7xx.o which invokes $(CC).  To fix it, just edit the makefile and
delete the line

    $(CC) $(CFLAGS) -c 53c7xx.c

which follows

53c7xx.o : 53c7xx_d.h 53c7xx.c


Regards,

Bill Brack
Hong Kong

----- Original Message -----
From: Grant Grundler <grundler@cup.hp.com>
To: <parisc-linux@thepuffingroup.com>
Sent: Sunday, October 17, 1999 10:25 AM
Subject: [parisc-linux] rebuild of 53c7xx.o

> It was annoying me that 53c7xx.o was getting rebuilt on every
> build....So I tried to figure out why.  The basic problem is
> "dummy" target (from Rules.make?) is invoked and fails when comparing
> time stamps. But I don't see where/why 53c7xx.o has dummy as a dependent.
> I think fixing this should fix the problem.
>
> Appended is relevant "make -d" output.
> (The whole output is 531846 lines).
> Does someone see the problem and/or know how to fix it?
>
> thanks,
> grant
>
