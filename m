Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA00726
	for <parisc-linux@puffin.external.hp.com>; Sun, 21 Jan 2001 18:29:03 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 22 Jan 2001 01:32:42 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA18230;
	Mon, 22 Jan 2001 12:30:17 +1100
Date: Mon, 22 Jan 2001 12:30:17 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] New XC available (was Re: glibc build failing)
In-Reply-To: <20010117233700.B324F38D85@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0101221228460.13332-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 17 Jan 2001, Matt Taggart wrote:

> Up till this merge we were still running bits from September 25th which didn't 
> have a "stable" number. So someone needs to make our glibc -O2 clean.

No, someone needs to fix gcc.  Investigating...

-- 
Linuxcare.  Support for the Revolution.
