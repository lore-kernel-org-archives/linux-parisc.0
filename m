Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA17331
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Oct 1999 22:40:26 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id VAA22932
	for <parisc-linux@thepuffingroup.com>; Sun, 17 Oct 1999 21:41:15 -0700 (PDT)
Message-Id: <199910180441.VAA26016@milano.cup.hp.com>
To: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ld: Unsatisfied symbols: csum_partial (code) 
In-reply-to: Your message of "Mon, 18 Oct 1999 00:34:58 PDT."
             <99101800363200.14826@P100>
Date: Sun, 17 Oct 1999 21:41:07 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Helge Deller wrote:
> Hi Grant,
> 
> serial_console_init was my fault.
> This should now be corrected in the CVS, but I can´t verify the csum_partial
> error here.

Thanks Helge.
I can't reproduce csum_partial error either after doing "make dep". :^)
I've cc'd parisc-linux as a reminder for others...

grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
