Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA26241
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Jan 2001 03:29:37 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 26 Jan 2001 10:33:31 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id CB1C3B005; Fri, 26 Jan 2001 10:23:28 +0000 (GMT)
Date: Fri, 26 Jan 2001 10:23:28 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] linux-2.4.0
Message-ID: <20010126102328.E3571@linuxcare.com>
References: <20010126004831.A8137@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010126004831.A8137@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Fri, Jan 26, 2001 at 12:48:31AM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jan 26, 2001 at 12:48:31AM +0000, Matthew Wilcox wrote:
> we have large outstanding diffs in the scsi directory -- richard
> volunteered to take care of this.  some other drivers need submitting
> / updating.

We have a new driver sim700.c that drives 53c700 and 53c710; Linus has a
driver sim710.c that drives just 53c710 (also written by me).  I want to
merge those two before submitting, but havn't managed yet.  sim710.c is
used on older Compaq x86 boxes with on-board scsi controllers.  I have
such a machine, but my merged driver had some problems on it.  I plan on
having another go at that.

The other area is ncr53c8xx.c, which I modified to support 53c720 on
Zalon.  I have sent patches to the maintainer and he has agreed to
integrate them - but nothing has happened for a while.  I'll prod
him again.

I see drivers/net/lasi_82596.c got integrated.  I had planned on
merging that with 82596.c sometime, but I guess there is no urgency
now.  82596.c is mostly used on m68k VME boards.

Richard
