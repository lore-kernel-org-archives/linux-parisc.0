Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA22562
	for <parisc-linux@puffin.external.hp.com>; Tue, 17 Oct 2000 09:56:32 -0600
Message-Id: <200010171601.JAA12803@milano.cup.hp.com>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] simple kernel tasks? 
In-reply-to: Your message of "Tue, 17 Oct 2000 07:15:03 PDT."
             <20001017071503.D928@tausq.org>
Date: Tue, 17 Oct 2000 09:01:51 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Randolph Chung wrote:
> Hi all,
> 
> Per Grant's suggestion I had looked into getting /dev/rtc to work. I
> checked in my changes yesterday and they seem to be ok.

Hey Randolph! Excellent!

I'm still chuckling about finding "#CONFIG_RTC is not set".

> I was wondering if there's a list of TODOs for things that need to be
> done in the kernel. I'd like to help if i can, though I'm still learning
> the ropes so simple tasks are preferred :-)

We certainly do have a list:

	http://www.thepuffingroup.com/parisc/status.html

The only problem is this list lags behind the "real" TODO list
(in CVS website/status.x). This lag is a result of hosting CVS
on a different machine than the website and a slightly manual
process to syncronize the two.

The plan is to automate CVS->webserver updates...but maybe we shouldn't
bother and hook into the debian bug tracking system instead.
Suggestions for some other existing "change request" system?

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
