Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from nexus.dmsc.k12.ar.us (nexus.dmsc.k12.ar.us [170.211.33.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8B864829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 11:11:52 -0700 (MST)
Received: from nexus.dmsc.k12.ar.us (nexus.dmsc.k12.ar.us [170.211.33.4])
	by nexus.dmsc.k12.ar.us (8.11.6/8.9.3) with ESMTP id h2IIjtk02125
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 12:45:56 -0600
Date: Tue, 18 Mar 2003 12:45:55 -0600 (CST)
From: Brian Beaver <beaverb@nexus.dmsc.k12.ar.us>
To: PA RISC Linux mailing list <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.10.10303181243080.2119-100000@nexus.dmsc.k12.ar.us>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Problem with CDROM
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

One of the schools I serve has been donated a HP 9000 DE 220.  I've
figured out the serial console, but I can't find out how to add the CDROM
drive as a boot drive.  The IPL shows the removable media and the Lan
module as bootable.

P0  8/16/5.6  removable media (IPL)
P1  8/16/6.0  LAN module

I don't know how to find the CDROM drive in the SCSI chain.  Looking at
the mailing list archives, I found that it needed to be a HP SCSI CDROM
(it is).  I just don't know how to set up the machine to look for a
bootable CDROM in the drive (I'm planning installing Debian hppa).

Thanks,

Brian Beaver, M.Ed. Technology Coordinator "For every complex problem
DeQueen-Mena Educational Cooperative        there is an answer that is 
305 S. Hornberg Ave., Gillham, AR 71841     clear, simple, and wrong."
870.386.2251  FAX:  870.386.7731            -- H. L. Mencken
