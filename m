Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA01536
	for <parisc-linux@puffin.external.hp.com>; Wed, 14 Jun 2000 18:45:55 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 15 Jun 2000 00:46:44 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA13506;
	Thu, 15 Jun 2000 10:46:29 +1000
Date: Thu, 15 Jun 2000 10:46:29 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "D'Angelo, James" <James.D'Angelo@icn.siemens.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linux make dep scsi error
In-Reply-To: <2FF13E24F61AD41193130008C791A76031F0FA@boca215a.boca.ssc.siemens.com>
Message-ID: <Pine.LNX.4.21.0006151039270.11751-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 14 Jun 2000, D'Angelo, James wrote:

> I've been fairly successful with building the compile environment, except
> for this error message I seem not to be able to get past.  Any ideas?
>[snip]
> 	drivers/scsi/scsi.a: could not read symbols: Malformed archive

I'm a bit confused by your subject line.  "make dep" shouldn't be doing
any linking!  Assuming the subject is wrong...

What does "ls -l drivers/scsi/scsi.a" tell you?  Is it a zero length file
by any chance?  "hppa1.1-linux-objdump --headers drivers/scsi/scsi.a"
might show something useful too.

Also, try a "make distclean", then re-make if you haven't already tried
this.

-- 
Linuxcare.  Support for the Revolution.
