Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA27005
	for <parisc-linux@puffin.external.hp.com>; Thu, 4 Jan 2001 10:38:24 -0700
To: law@redhat.com
Cc: Alan Modra <alan@linuxcare.com.au>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
In-Reply-To: Your message of "Thu, 04 Jan 2001 10:37:20 MST."
             <11763.978629840@upchuck>
References: <11763.978629840@upchuck> 
Date: Thu, 04 Jan 2001 10:41:44 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14EEOW-0000w1-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


FYI I just committed the 64-bit millicode to the CVS on
puffin.external.hp.com adding it to libgcc.a as with 32-bit parisc gcc.
