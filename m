Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from chirp.Stanford.EDU (chirp.Stanford.EDU [171.64.90.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 42EC9482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 20:16:36 -0700 (MST)
Date: Fri, 22 Nov 2002 19:16:23 -0800 (PST)
From: Leif Harcke <lharcke@Stanford.EDU>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Tulip driver fails to advertise 100baseTx media
 capability
In-Reply-To: <20021122220937.29082482B@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0211221747260.29185-100000@chirp.Stanford.EDU>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 22 Nov 2002, Grant Grundler wrote:
> Is the tulip comminucating on the wire at all?  (Sounds like it is)

Sure, at 10 Mbps after boot, and at 100 Mbps full duplex once I use
mii-tool to corretly set the autonegotiation advertising register.

> It's possible this is a problem/interaction with your switch/hub.

I don't think this is a possibility.  The kernel/Tulip have to decide what
to advertise on the link long before autonegotiation is attempted, right?
The switch has absolutely no effect on what the kernel/Tulip decide to
advertise prior to the start of negotiation.

> >sar2:~# dmesg | grep ulip
> >Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
> >tulip0: no phy info, aborting mtable build
> >tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
                                                       ^^^^^^^^^^^^^^^^
This is the smoking gun.  According to the chart at
  http://www.scyld.com/diag/mii-status.html#anar
the number 0061 (it is base 16 despite the lack of 0x) means the
kernel/Tulip have decided to only advertise the 10mbps capabilities of the
chipset prior to when negotiaton with the switch begins.  From reading
kernel source it appears that the Tulip driver sets some default state if
it can't build the mtable.  Perhaps this is where the error comes from.

> I committed a tulip "phy reset" issue fix in later kernels that I don't
> think is part of the 2.4.18 Debian 3.0 kernel.

Thanks much,

- --
Leif Harcke
lharcke@stanford.edu

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE93vMOFW+DB6BX7gwRAh1uAJ4yoZ9ITUm0Qrs8hOVP1FW2UqVNbQCglXQ8
zGu046IWmnJzSp4Jvr08HlM=
=JMip
-----END PGP SIGNATURE-----
