Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e146.dhcp212-198-142.noos.fr [212.198.142.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90E154829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 13:13:15 -0700 (MST)
Received: from Tatooine (varenet@Tatoine [192.168.69.3])
	by mail.zigoo.net (8.12.5/8.12.1) with SMTP id h0AKDDiL000938
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 21:13:14 +0100
Date: Fri, 10 Jan 2003 23:13:13 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] unaligned accesses
Message-Id: <20030110231313.1215dc79.varenet@esiee.fr>
In-Reply-To: <3E1AA8D500000AF7@ocpmta8.freegates.net>
References: <20030110170813.X26554@parcelfarce.linux.theplanet.co.uk>
	<3E1AA8D500000AF7@ocpmta8.freegates.net>
Mime-Version: 1.0
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

On Fri, 10 Jan 2003 19:47:52 +0100
jsoe0708@tiscali.be wrote:

> 
> >-- Original Message --
> >Date: Fri, 10 Jan 2003 17:08:13 +0000
> >From: Matthew Wilcox <willy@debian.org>
> >To: jsoe0708@tiscali.be
> >Cc: Randolph Chung <randolph@tausq.org>,
> >	parisc-linux@lists.parisc-linux.org
> >Subject: Re: [parisc-linux] unaligned accesses
> >
> >
> >On Fri, Jan 10, 2003 at 11:51:41AM +0100, jsoe0708@tiscali.be wrote:
> >> PS:  with ext3 (which I use) problem I hesitate to install 2.4.20 and
> waiting
> >> for 2.4.21 and evms, jfs, xfs support for this system)
> >
> >um, you use the data=ordered mount option (or whatever it was)?
it was data=journal
see http://developers.slashdot.org/developers/02/12/02/0128206.shtml?tid=106

FWIW, the default option (used by most people) is data=journal, and is not affected by that bug. We've been using 2.4.20 with ext3 for weeks pretty safely here.


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
