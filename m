Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA32612
	for <parisc-linux@puffin.external.hp.com>; Fri, 27 Oct 2000 15:48:13 -0600
To: Kailashnath V Rampure <kailasr@webcash.com>
Cc: Grant Grundler <grundler@cup.hp.com>, deller@gmx.de,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] glibc problem 
In-Reply-To: Message from Kailashnath V Rampure <kailasr@webcash.com>
   of "Fri, 27 Oct 2000 14:29:53 PDT." <5.0.0.25.0.20001027142719.03822920@mail.webcash.com>
References: <Your message of "Fri, 27 Oct 2000 13:37:49 PDT."
 <5.0.0.25.0.20001027131913.00a57090@mail.webcash.com>  
 <5.0.0.25.0.20001027142719.03822920@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 27 Oct 2000 15:51:37 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001027215137.00F1138137@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Kailashnath V Rampure writes...

> I also see on the Linux server that bootpd is being invoked for some time
> only.

bootpd runs from inetd and only stays up if it's receiving requests. After a 
specified amount of time of no requests it will exit. This isn't a problem as 
inetd will fire up a new one if needed.

I would make sure that tftpd is doing the right thing. You can test your tftpd 
setup by trying to download the lifimage yourself using the tftp client 
program.

bootpd and tftpd are pretty good about writing to syslog too, so check there 
for errors.

HTH,

-- 
Matt Taggart
taggart@fc.hp.com
