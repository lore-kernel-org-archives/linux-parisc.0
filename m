Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24413482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Jun 2001 18:32:24 -0600 (MDT)
From: "David S. Miller" <davem@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <15155.58253.350788.177036@pizda.ninka.net>
Date: Fri, 22 Jun 2001 17:32:13 -0700 (PDT)
To: Keith Owens <kaos@ocs.com.au>
Cc: sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <2105.993214803@ocs3.ocs-net>
References: <2105.993214803@ocs3.ocs-net>
Subject: [parisc-linux] Re: SCSI in arch/{m68k,parisc,sparc*}/config.in
List-ID: <linux-parisc.vger.kernel.org>

Keith Owens writes:
 > arch/{m68k,parisc,sparc*}/config.in have their own SCSI list instead of
 > using drivers/scsi/Config.in.  Cleaning up the SCSI config file is on
 > my 2.5 TODO list, can you tell me why these architectures have their
 > own list of SCSI devices?
 > 
 > If it is because only some SCSI drivers work on these architectures, do
 > you really need to be this specific?

If I can forward every "How come I can compile ISA SCSI device X and
it doesn't work on my UltraSPARC" email to you, I'll more than happily
start including drivers/scsi/Config.in :-)

Jeff Garzik and I just did all the necessary dep_tristate'ing for
drivers/net/Config.in and at least in my tree I include in on sparc64.

Being able to do this on every platform is certainly a goal, and for
all the PCI drivers to be portable enough to work on every platform is
the next step.  I think Jeff and I can do it for the networking
drivers, but I have no idea who would go about working on this for
the scsi stuff.

Later,
David S. Miller
davem@redhat.com
