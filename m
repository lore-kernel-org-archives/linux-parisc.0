Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA19064
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 10:24:51 -0700
Message-Id: <200101151729.JAA10108@milano.cup.hp.com>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100 
In-reply-to: Your message of "Mon, 15 Jan 2001 10:44:13 PST."
             <Pine.LNX.4.21.0101151002470.23020-100000@maestro.symsys.com>
Date: Mon, 15 Jan 2001 09:29:52 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Greg Ingram wrote:
> I was trying vmlinux-20001018 from the FTP site.

Did you read the FAQ? (Hint: question 5)

Step 2 says: Use a lifimage (not vmlinux)


Unfortunately, mkp's answer is now horribly stale.
Claims which are no longer accurate include:
o HPUX is required to build a lifimage (XC and native builds work on occasion)
o mongoose (HPUX) boot loader is an option (PALO required)
o Serial console required (can use STI now)
o mkp is working on superio ;^)

Any volunteers to write up a new version? 
(ESIEE team?)

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
