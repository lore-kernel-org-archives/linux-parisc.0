Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 765C2483E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Jun 2002 12:38:15 -0600 (MDT)
Message-Id: <200206271837.g5RIbmO5016284@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.2 failed to compile kernel
To: joel.soete@freebel.net
Date: Thu, 27 Jun 2002 14:37:48 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jeremyd@apptechsys.com, grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <1025201506.3d1b5563048ad@webmail.tiscalinet.be> from "joel.soete@freebel.net" at Jun 27, 2002 08:11:47 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > > > 1->linux) but gcc -dM -E ... SegFault :((
> > > > 
> > > > # gcc -dM -E -D__ASSEMBLY__ -traditional -D__KERNEL__
> > > > -I/Develop/parisc-linux/src/linux/include  -c -o pacache.CPP
> > pacache.S

I don't think gcc (cc1) should segfault even if the cvs is messed up.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
