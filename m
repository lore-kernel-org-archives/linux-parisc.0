Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.rz.uni-ulm.de (gemini.rz.uni-ulm.de [134.60.246.16])
	by dsl2.external.hp.com (Postfix) with ESMTP id 384F0482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Mar 2003 01:00:50 -0700 (MST)
Date: Tue, 25 Mar 2003 09:00:45 +0100
From: Markus Schaber <markus.schaber@student.uni-ulm.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Out of memory problem
Message-Id: <20030325090045.528bdbc8.markus.schaber@student.uni-ulm.de>
In-Reply-To: <20030325000539.90F6049C0B@mail.esiee.fr>
References: <20030325002917.37f386fa.markus.schaber@student.uni-ulm.de>
	<20030325000539.90F6049C0B@mail.esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hello,

Thibaut VARENE <varenet@esiee.fr> schrieb:

> > And the NetInst procedure for Debian/i386 uses a RAM-Disk, too, so I
> > thought those were using a initrd just as the one I got from
> > ftp://ftp.parisc-linux.org/kernels/. And so I just put it out of my
> > scope when searching for non-ramdisk images.
> I don't think there's any: indeed, if you have read the boot howto,
> you'd have noticed that nfs-root images are very specific to your
> network configuration, since you have to specify the server's IP.
> therefore I don't see the point of releasing NFS-root images nobody
> could possibly use.

That's not correct this way, as I saw in 4.3.2 of the HOWTO, the nfs
root is specified via kernel boot parameters, and as I saw in 4.4.1, one
can interact with palo to provide run-time boot parameters.

> So follow the cookbook in the HOWTO and prepare your own one ;P

I'll do so, at least in case I'm unable to find cheap extension RAM, but
I just found a promising part at EBAY (32MB for 5 EUR, that's cheap
enough to take the risk).


Gru=DF,
Markus

--=20
Schabi's Flohmarkt: http://schabi.de/flohmarkt/

Der Dienstweg ist die Verbindung der Sackgasse mit dem Holzweg!
[DoLi in unibwm.studium]
