Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA29633
	for <parisc-linux@puffin.external.hp.com>; Sat, 3 Jul 1999 00:18:54 -0600
Sender: adevries@feather.thepuffingroup.com
Message-ID: <377DACB9.64FE3EF2@thepuffingroup.com>
Date: Sat, 03 Jul 1999 02:24:57 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Mike Hibler <mike@fast.cs.utah.edu>
CC: J.S.Peatfield@damtp.cam.ac.uk, alex@assyst-intl.com, deller@gmx.de,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting the kernel
References: <199907030440.WAA28078@fast.cs.utah.edu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Mike Hibler wrote:
> 
> > Date: Sat, 3 Jul 1999 03:24:37 +0100
> > From: Jon Peatfield <J.S.Peatfield@damtp.cam.ac.uk>
> > To: alex@assyst-intl.com, deller@gmx.de
> > Subject: Re: [parisc-linux] Booting the kernel
> >
> > This reminds me, does anyone have a working rbootd which runs on anything
> > other than HP-UX?  If we turn all our HPs into Linux boxes it would be nice to
> > still be able to boot them.  Of course looking at the rboot packets on the wire
> > shows that they are not anything I recognise...
> >
> 
> There is an rboot daemon that comes with all the BSDs and I believe the
> same daemon will work on Linux as well.  There were some endian problems
> once, but I think they were all solved so it should work on x86 boxes.
> It requires BPF.


I fixed up rbootd to run on Linux awhile ago... you should be able to
find it on ftp://puffin.external.hp.com.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
