Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailrx.uk.wmmercer.com (unknown [193.131.189.243])
	by dsl2.external.hp.com (Postfix) with ESMTP id 908A2482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 08:24:59 -0600 (MDT)
Received: from wlvpntec02.uk.wmmercer.com (unverified) by mailrx.uk.wmmercer.com
 (Content Technologies SMTPRS 4.1.5) with ESMTP id <Tac1902f3ba54d83111df@mailrx.uk.wmmercer.com> for <parisc-linux@lists.parisc-linux.org>;
 Thu, 19 Jul 2001 15:25:47 +0100
Message-ID: <99F41EF55D11D511818600D0B74749C496F41D@wchrntms01.uk.wmmercer.com>
From: "Scammell, David" <David.Scammell@uk.wmmercer.com>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Thu, 19 Jul 2001 15:22:18 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] 715/33 disk and kernel make dep problems
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I installed with 9.2, no problems, updated with apt-get.

I'd like to build my own kernel to test out a disk problem I have.

When I attempt anything which would fill the scsi disk queue with pending
writes
(e.g. tar xf kernel.tar), then machine hangs, I get some messages on the
serial
console which I've not got them written down yet, but these include a mount
read
only message. I'm using an old 2Gb disk (info not to hand, I'm at work), but
no so
old it shouldn't handle tagged writes. I'd like to change the queue depth
and bus
sync speed (looks like its set at 20Mhz, not 10Mhz) to see if this makes a
difference.

To compile a kernel, I've untarred it on an i686 and nfs mounted it on the
715,
make oldconfig works fine. Make dep hangs in some subdirectories (below
drivers/acpi... somewhere I can't remember). I can't figure out why. I'm
quite
familiar with recompilations on my intel box but can't figure out what could
be
wrong on the HP, any ideas?

Thanks

David Scammell


*************************** IMPORTANT NOTE **************************
The above information is confidential to the addressee and may be
privileged.  Unauthorised access and use is prohibited.  William M.
Mercer Limited is regulated by IMRO and the Personal Investment
Authority. Registered in London No. 984275 Registered Office: Telford
House, 14 Tothill Street, London SW1H 9NB
