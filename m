Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA07978
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 May 2000 19:27:58 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 4 May 2000 01:27:56 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA15695;
	Thu, 4 May 2000 11:27:37 +1000
Date: Thu, 4 May 2000 11:27:37 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Jeffrey A Law <law@cygnus.com>
cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] crti.S Nested procedures error 
In-Reply-To: <26706.957401664@upchuck>
Message-ID: <Pine.LNX.4.21.0005041123510.8334-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 3 May 2000, Jeffrey A Law wrote:

> '!' is the standard comment character for the PA assembly syntax.

sourceware.cygnus.com CVS gas/config/tc-hppa.c has

const char comment_chars[] = ";";
const char line_separator_chars[] = "!";

You're saying that it's a good idea to change the comment char then?

Regards, Alan Modra

-- 
Linuxcare.  Support for the Revolution.
