Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA29267
	for <parisc-linux@puffin.external.hp.com>; Thu, 4 Jan 2001 12:10:55 -0700
Message-Id: <200101041915.LAA29838@milano.cup.hp.com>
To: Cary Coutant <cary@cup.hp.com>
Cc: law@redhat.com, "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
        "Alan Modra" <alan@linuxcare.com.au>, bame@fc.hp.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
In-reply-to: Your message of "Thu, 04 Jan 2001 11:00:49 PST."
             <200101041902.LAA22273@adlmail.cup.hp.com>
Date: Thu, 04 Jan 2001 11:15:44 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Cary Coutant wrote:
> Linux shouldn't need to be concerned with either of these cases. If 
> you're using $$dyncall for the 32-bit runtime, I strongly suggest that 
> you change the compiler.

Where does support for HPUX built apps fit into the picture?

I thought a long term goal is to support HPUX built apps to run under
parisc-linux. Eg it would be really cool if we could run the HPUX
X11 server...

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
