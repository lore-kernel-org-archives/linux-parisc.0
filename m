Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA30084
	for <parisc-linux@puffin.external.hp.com>; Fri, 27 Oct 2000 15:35:44 -0600
Message-Id: <5.0.0.25.0.20001027142719.03822920@mail.webcash.com>
Date: Fri, 27 Oct 2000 14:29:53 -0700
To: Grant Grundler <grundler@cup.hp.com>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] glibc problem 
Cc: Matt Taggart <taggart@carmen.fc.hp.com>, deller@gmx.de,
        parisc-linux@thepuffingroup.com
In-Reply-To: <200010272128.OAA23999@milano.cup.hp.com>
References: <Your message of "Fri, 27 Oct 2000 13:37:49 PDT." <5.0.0.25.0.20001027131913.00a57090@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

The path number is P0, device path is 8/0/20/0.0 and device type is LAN MODULE.

I also see on the Linux server that bootpd is being invoked for some time only.

At 02:27 PM 10/27/00 -0700, Grant Grundler wrote:
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
