Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel11.hp.com (palrel11.hp.com [156.153.255.246])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A0FF482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Jul 2002 11:51:40 -0600 (MDT)
Message-ID: <B9957F974955D411829400D0B74FF27A08F18977@xtor01.canada.hp.com>
From: "CARSON,KEVIN (HP-Canada,ex1)" <kevin_carson@hp.com>
To: 'Rick Vernam' <rickvernam@hotmail.com>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] i dont know jack
Date: Thu, 25 Jul 2002 10:51:30 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

There are a couple of methods (assuming /dev/sda is the SCSI disk you wish
to erase):

1) dd if=/dev/zero of=/dev/sda bs=1M count=1

2) script parted or sfdisk to discover partitions and erase them

3) wipe -f -q /dev/sda

1 is the fastest.  Does little to none data protection.  2 is probably just
too fiddly and error prone.  3 is slow but does a reasonable four pass data
scrub of the whole disk as well as erasing the partitions.

Slow is relative.  It took 10.5 minutes to do an older 2GB drive on a 20
MB/s SCSI channel.  However, one could do these in parallel.  A rule of
thumb (based upon the assumption that recycling depots get old disks on old
SCSI channels) is about four disks in parallel per SCSI channel.  Of course,
this is really slow compared to the dd -- under a second on the same setup.

I can see three strategies for the setup:

A) Boot from a scsi disk to an external connector.

B) Boot from a network connector.

C) Remove the disks from the unit and access them through a testbed.

A is pretty straightforward but it assumes an external connector with
compatible SCSI (SE or differential, etc).  Adding a SCSI adapter is not
always an option as PA-RISC Linux doesn't drive HP-PB cards.

B is more effort to get the environment setup but may result in a simpler
process.  It still suffers from the lack of accessibility for anything
connected to HP-PB for instance.

C is more physical work but should probably always work.  A testbed unit
choice might be an older workstation with both differential and SE SCSI
connectors.  There would be the physical hassle of getting different
connector types hooked up but that is solved with various (custom) cables.

Hope this helps!

Kevin
