Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA03923
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 16:37:59 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 30 Nov 2000 23:37:50 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 30 Nov 2000 23:37:50 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A26E541.C6A24350@linuxcare.com>
Date: Thu, 30 Nov 2000 18:39:45 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: "Jorge L. deLyra" <delyra@latt.if.usp.br>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP 9000/735-125
References: <200011302245.OAA29965@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> "Jorge L. deLyra" wrote:
> > It is on the nfsroot howto linked from the home page of the project:
> > http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/02-Feb/0069.html
> 
> Ok. I'm not going to touch the archives.
> I can update the link if someone provides the content.
> Any volunteers to rewrite the NFS root howto and bring it up to date?

Yes!  I'm redoing the FAQ, and will make sure it all gets a review.

However, I don't actually know that NFS Root needs to be included in the
parisc-linux specific documentation, since we don't have to use nfsroot
anymore.  There's a generic NFSROOT HOWTO we can refer to.

We really only put that in there for when we couldn't write to our local
disks.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
