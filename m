Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from eightythree.valleybikes.com (valleybikes.com [24.123.22.113])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5190482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 15:00:00 -0700 (MST)
Received: from localhost.localdomain (root@seventy.compusmithllc.com [192.168.194.70])
	by eightythree.valleybikes.com (8.12.5/8.12.5/Debian-1) with ESMTP id gAMLTK34021369
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 16:29:21 -0500
From: James Smith <james@compusmithllc.com>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Date: 22 Nov 2002 16:29:19 -0500
Message-Id: <1038000560.444.9.camel@seventy>
Mime-Version: 1.0
Subject: [parisc-linux] Disk problems
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

I just got a pile of 712/60's - $80 for 10 of em :)


i've set one up & now i'm going through the disks one at a time &
cloning them as its quicker than going through the install each time


i've hit one disk that gives me this whenever i try to fdisk it 


sixty:~# fdisk /dev/sdb

Unable to read /dev/sdb


when i tried to zero the disk, i got this....

sixty:~# dd if=/dev/zero of=/dev/sdb count=1 bs=512 
dd: writing `/dev/sdb': Input/output error
1+0 records in
0+0 records out

the console sees the disk when i use search 

does this indicate a dead disk?

the disk was ok until i put it into a mac......

James S
