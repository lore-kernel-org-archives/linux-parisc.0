Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA04344
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Sep 2000 13:34:08 -0600
Received: (from andrew@localhost)
	by guinness.neep.com.au (8.9.3/8.9.3/Debian/GNU) id DAA16794
	for parisc-linux@thepuffingroup.com; Sun, 17 Sep 2000 03:34:23 +0800
Date: Sun, 17 Sep 2000 03:34:19 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Netbooting a 710 : IPX ?
Message-ID: <20000917033416.A16536@neep.com.au>
References: <39C37F48.E9481800@club-internet.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <39C37F48.E9481800@club-internet.fr>; from dolbeaur@club-internet.fr on Sat, Sep 16, 2000 at 03:10:16PM +0100
List-ID: <linux-parisc.vger.kernel.org>

Romain Dolbeau said:
> I've trouble netbboting my 710 : it seems that it doesn't
> broadcast bootp request, but some IPX Service Advertisement
> Protocol stuff...

I think you will need 'rbootd' running to answer the initial request,
which then hands over to bootpd.

 The rbootd daemon is used for booting some HP workstations
 over the network (such as the 9000/300 and 9000/400 series).
 It can also boot PA RISC workstations.  It handles the first
 stage of the boot sequence and can be used to start booting
 Linux, NetBSD or HPUX.

(Debian GNU/Linux rbootd package description.)

There is a build on ftp://puffin.external.hp.com/pub/parisc/binaries/tgz/
but I don't know for which architecture and OS.  =)  You shouldn't have
any trouble finding a package or the source to build for your platform.

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                http://www.neep.com.au/

  "Just remember Basil, there's always someone worse off than yourself."
  "Oh, really?  I'd like to meet him ... I could do with a good laugh."
                 [ Sybil and Basil Fawlty, "Fawlty Towers" ]
