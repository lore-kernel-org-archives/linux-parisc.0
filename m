Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA13059
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Dec 2000 11:47:14 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 27 Dec 2000 18:50:18 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 27 Dec 2000 18:50:19 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A4A3ABA.4EC6D5A7@linuxcare.com>
Date: Wed, 27 Dec 2000 13:53:46 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] performance
References: <E14BL04-0002Zj-00@the-village.bc.nu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> > http://www.spec.org/osg/web99/results/res2000q4/
> >
> > This shows some PA-RISC machines running HPUX performing reasonably
> > well.
> 
> Specweb is basically a con. Its not a materially valuable benchmark. It benches
> how fast your irq handler path is, how fast your memory cache is, how good
> your DMA transfers are. It has almost nothing to do with how good a web
> server the box is.

I agree that specweb might not actually be functionally practical.

This might not be the case with specweb, but sometimes specifications do
have the ability to influence customers regardless of their validity.

That's interesting for one reason: if the marketing helps make potential
customers think that parisc-linux is fast, they'll buy parisc boxes, and
HP is more likely to allocate developer time on this project.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
