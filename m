Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA05135
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Jan 2001 17:38:20 -0700
Message-Id: <200101270044.QAA24345@milano.cup.hp.com>
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] My 9000/720 boots, but problems with `ldconfig' 
In-reply-to: Your message of "Sat, 27 Jan 2001 01:36:36 PST."
             <3A721814.B357DEEA@dot.at>
Date: Fri, 26 Jan 2001 16:44:21 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Christoph Plattner wrote:
> I have problems with the RTC chip, setting the time with hwclock.
> First it needs /dev/rtc, so I compiled this in and added the /dev entry.
> But the ioctl reading the time fails. I have to study the NVRAM/RTC chip
> type and the implementation of rtc.c.

You want to use CONFIG_GENRTC - not CONFIG_RTC.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
