Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA24836
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Aug 2000 20:32:55 -0600
Received: from guinness.neep.com.au (reggae-10-62.nv.iinet.net.au [203.59.94.62])
	by filk.iinet.net.au (8.8.7/8.8.7) with ESMTP id FAA21442
	for <parisc-linux@thepuffingroup.com>; Sat, 12 Aug 2000 05:33:43 +0800
Received: (from andrew@localhost)
	by guinness.neep.com.au (8.9.3/8.9.3/Debian/GNU) id EAA17965
	for parisc-linux@thepuffingroup.com; Sat, 12 Aug 2000 04:32:59 +0800
Date: Sat, 12 Aug 2000 04:32:56 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] merge with 2.4.0-testN?
Message-ID: <20000812043253.A17896@neep.com.au>
References: <200008100423.VAA04954@milano.cup.hp.com> <39923147.1140E9AE@uswest.net> <20000811141417.T10843@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000811141417.T10843@vodka.thepuffingroup.com>; from matthew@wil.cx on Fri, Aug 11, 2000 at 02:14:17PM -0400
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox said:
> > Will the port name change from parisc to hppa at this time too?
> > 
> > ie... Will the following directories change?
> > 
> > Documentation/parisc
> > arch/parisc
> > arch/parisc64
> > include/asm-parisc
> > include/asm-parisc64
> 
> I don't plan to.  Does anyone really really want this to change?

While I don't think renaming anything with 'parisc' in its name will
help anything, I do think that to avoid confusion some symbolic links
should be created.  eg hppa/ -> parisc/

Just to avoid any confusion ... presumably the README.hppa would explain
what is going on.

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                http://www.neep.com.au/

  "Just remember Basil, there's always someone worse off than yourself."
  "Oh, really?  I'd like to meet him ... I could do with a good laugh."
                 [ Sybil and Basil Fawlty, "Fawlty Towers" ]
