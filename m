Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA01418
	for <parisc-linux@puffin.external.hp.com>; Fri, 27 Oct 2000 16:25:16 -0600
Message-Id: <5.0.0.25.0.20001027145903.037c0530@mail.webcash.com>
Date: Fri, 27 Oct 2000 15:06:09 -0700
To: Grant Grundler <grundler@cup.hp.com>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] glibc problem 
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <200010272138.OAA24029@milano.cup.hp.com>
References: <Your message of "Fri, 27 Oct 2000 13:37:49 PDT." <5.0.0.25.0.20001027131913.00a57090@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

I have redhat linux and the lin in my inetd.conf is as follows:

I missed few lines in the error. The complet error is as follows.
-------------------------
  Booting...
  Cannot find ENTRY_TEST.

  Fail to initialize.

  ENTRY_INT
  Status=-7

00000000 00000000 00000010 830339E0 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
0000000B 00000000 000000FF 00000000  00000000  00000000  00000000  00000000
00000000 00000000 00400720 00000000 00000000 00000000 00000000 00000000

Failed to initialize
-------------------------------------------

The details of the server is as follows
The machine type is HP ACLASS (A180C)
The hardware path of the lan card is 8/0/20/0.




At 02:38 PM 10/27/00 -0700, Grant Grundler wrote:
>Kailashnath - can you also include machine type and
>HW path of the "lan" device?
>
>thanks,
>grant
>
>
>Kailashnath V Rampure wrote:
>...
> > But when I type bo lan at HP server Iget the following error
> > -------------------------
> > Booting...
> > Cannot find ENTRY_TEST.
> >
> > Fail to initialize.
> >
> > ENTRY_INT
> > Status=-7
>
>Config files look fine.
>What does your HP server report for "search lan"?
>(type that instead of "bo lan")
>
>grant
>
>Grant Grundler
>Unix Systems Enablement Lab
>+1.408.447.7253
>
>---------------------------------------------------------------------------
>To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
>`unsubscribe' as the subject.
