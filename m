Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 871B5482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Jul 2002 00:54:00 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Date: Thu, 25 Jul 2002 00:54:00 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020725065400.871B5482B@dsl2.external.hp.com>
Subject: [parisc-linux] [PATCH] get_initiator for sym53c8xx_2
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

Hi all,
I've hacked up a patch to sym53c8xx_2 driver to query PDC
for SCSI ID and other operating parameters:

	ftp://ftp.parisc-linux.org/patches/sym2_pdc.diff

This patch really only matters for (a) C3000, (b) multi-initiator
SCSI clusters, (c) "fast" SE SCSI interfaces with more than 3m cable.
Any other boxes which have unnaturally crippled wide SCSI interface
chips connected to a 50-pin (narrow) SCSI port will need this too.
Using PDC compensates for not having access to NVRAM or BIOS
to set these parameters.

It's past my bedtime...I've not tested it.  If someone can
test it on C3000 in case I don't get to it tomorrow, that
would be great. It does compile/link cleanly though and
is nearly identical to what I implemented for sym1 driver.

thanks,
grant
