Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA21374
	for <parisc-linux@puffin.external.hp.com>; Thu, 4 Jan 2001 00:00:21 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 4 Jan 2001 07:03:42 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA31284;
	Thu, 4 Jan 2001 18:03:25 +1100
Date: Thu, 4 Jan 2001 18:03:25 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: law@redhat.com, bame@fc.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli?
In-Reply-To: <200101040618.BAA05609@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0101041753580.15554-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 4 Jan 2001, John David Anglin wrote:

>[about $$dyncall]
> Could this and maybe some of the other short milli routines be compiler
> "builtins"?  This would allow inlining.

I don't see why not.  It could be done by expanding all the $$dyncall
references in pa.c and pa.md

-- 
Linuxcare.  Support for the Revolution.
