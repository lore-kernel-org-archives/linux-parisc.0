Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id BCFFE4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 23:24:20 -0600 (MDT)
Date: Wed, 4 Sep 2002 22:28:13 -0700
From: Randolph Chung <randolph@tausq.org>
To: Stefan Pfetzing <dreamind@dreamind.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] XFS - blkgetsize64
Message-ID: <20020905052813.GD8310@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020904143013.GC4386@dreamind.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020904143013.GC4386@dreamind.de>
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

> I just tried to get XFS working on my C200 (I've got a new IBM SCSI disk.) and
> mkfs.xfs always got the size of the Device (/dev/sda5) wrong. (it complained
> about not getting with lseek64 to that position...)

64-bit kernel:
tausq@gsyprf11:~$ ls -l tst
-r-x--xr--    1 tausq    tausq    1099511627777 Sep  4 22:18 tst*
tausq@gsyprf11:~$ ./tt tst
lseek64(3,0,SEEK_END) = 1048576M


on my gecko (32-bit)
randolph@frodo:~$ sudo ./t /dev/sda3
lseek64(3,0,SEEK_END) = 1949M

seems to work ok?

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
