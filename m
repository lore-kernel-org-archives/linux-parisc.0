Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA04317
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Dec 2000 18:43:51 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 12 Dec 2000 01:46:28 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA01912;
	Tue, 12 Dec 2000 12:43:30 +1100
Date: Tue, 12 Dec 2000 12:43:30 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: grundler@cup.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: gcc wchar patch for hppa64
In-Reply-To: <200012120006.TAA29936@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0012121218240.27939-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 11 Dec 2000, John David Anglin wrote:

> This patch fixes a problem with wide characters.  We need to override the
> defines in svr4.h.  With this, I get much further building a 64 bit glibc.
> Please review and install if ok.

Thanks!  Installed.

-- 
Linuxcare.  Support for the Revolution.
