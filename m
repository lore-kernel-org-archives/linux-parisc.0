Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA06804
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Sep 2000 03:50:37 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 1 Sep 2000 09:50:43 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA14450;
	Fri, 1 Sep 2000 20:47:11 +1100
Date: Fri, 1 Sep 2000 20:47:11 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
cc: "'Paul Bame'" <bame@noam.fc.hp.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] FW: hpux 11.00 near success 
In-Reply-To: <A4A5E4C468B5D11190220001FA6835DD04DD86BA@epixch003>
Message-ID: <Pine.LNX.4.21.0009012014240.7013-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 1 Sep 2000, [iso-8859-1] SOETE Joël wrote:

> The tool chain which I just reach to rebuild successfully was date 20000829
> as well as palo?

I broke the linker on 2000-08-27, in a way that might be affecting shared
library builds.  Your problems may be totally unrelated, but just in case,
I thought I'd better own up.  The linker should be fixed now.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
