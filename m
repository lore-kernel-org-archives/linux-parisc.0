Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA02866
	for <parisc-linux@puffin.external.hp.com>; Fri, 27 Oct 2000 19:28:08 -0600
Message-Id: <5.0.0.25.0.20001027180812.00a505d0@mail.webcash.com>
Date: Fri, 27 Oct 2000 18:22:26 -0700
To: Matt Taggart <taggart@carmen.fc.hp.com>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] glibc problem 
Cc: Grant Grundler <grundler@cup.hp.com>, deller@gmx.de,
        parisc-linux@thepuffingroup.com
In-Reply-To: <20001027215137.00F1138137@carmen.fc.hp.com>
References: <Message from Kailashnath V Rampure <kailasr@webcash.com>
 <5.0.0.25.0.20001027142719.03822920@mail.webcash.com>
 <Your message of "Fri, 27 Oct 2000 13:37:49 PDT."  <5.0.0.25.0.20001027131913.00a57090@mail.webcash.com>
 <5.0.0.25.0.20001027142719.03822920@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

Thanks !!!!! a lot specially to MATT and Helge Deller
I was able to Bring up the linux on A class server.

Now I have formatted the hdd and mounted disk to /mnt and then transfered 
the root to /dev/hda2.
I want to know how  do I transfer palo to this new hdd.

Regards
Kailas

At 03:51 PM 10/27/00 -0600, Matt Taggart wrote:

>Kailashnath V Rampure writes...
>
> > I also see on the Linux server that bootpd is being invoked for some time
> > only.
>
>bootpd runs from inetd and only stays up if it's receiving requests. After a
>specified amount of time of no requests it will exit. This isn't a problem as
>inetd will fire up a new one if needed.
>
>I would make sure that tftpd is doing the right thing. You can test your 
>tftpd
>setup by trying to download the lifimage yourself using the tftp client
>program.
>
>bootpd and tftpd are pretty good about writing to syslog too, so check there
>for errors.
>
>HTH,
>
>--
>Matt Taggart
>taggart@fc.hp.com
>
>
>---------------------------------------------------------------------------
>To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
>`unsubscribe' as the subject.
