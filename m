Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover.mkp.net (rover.mkp.net [209.217.122.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 893E14868
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Jul 2002 06:33:05 -0600 (MDT)
To: <dlorin@univ-rennes1.fr>
Cc: debian-hppa@lists.debian.org,
	<parisc-linux@lists.parisc-linux.org>
From: "Martin K. Petersen" <mkp@mkp.net>
References: <200207080705.JAA06652@mailimailo.univ-rennes1.fr>
Date: 08 Jul 2002 08:32:54 -0400
In-Reply-To: <200207080705.JAA06652@mailimailo.univ-rennes1.fr>
Message-ID: <yq1sn2ummbt.fsf@austin.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: How to mount HFS 6.0 ?
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

>>>>> "DL" == dlorin  <dlorin@univ-rennes1.fr> writes:

DL> I took a disk SCSCI-1 out of a station 425t running with
DL> BASIC-UX. On this one, there are several files (data and programs
DL> written in HP-BASIC) I want to reach in reading with my 715/50
DL> running with Woody. How to do that?

If there is only one partition on the drive,

        mount -t hfs /dev/sdX /mnt

should work.

HP/UX's partitioning scheme is not supported, unfortunately, so if you
have several partitions you need to hack a bit.  

I suggest writing a program to scan for the UFS magic field on the
disk and print the offsets.  Move 8K back from the start of each
superblock and write down that number.

Then use the loopback mount facility and pass the offset you found to
losetup's -o option.  So - say -

        losetup -o <found offset> /dev/loop0 /dev/sda
        mount -t hfs /dev/loop0 /mnt

With a bit of tinkering, you should be able to mount your hfs
filesystems that way.

-- 
Martin K. Petersen      Cereal Bowl Engineer, Linuxcare, Inc.
http://mkp.net/         SGI XFS, Linux/PA-RISC, Linux/IA-64
