Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6CA33485C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 04:02:53 -0600 (MDT)
Received: (from ra@localhost)
	by xo.hp.is (8.11.6/RA-8.11.6) id f8OA2q429080
	for parisc-linux@lists.parisc-linux.org; Mon, 24 Sep 2001 10:02:52 GMT
Date: Mon, 24 Sep 2001 10:02:51 +0000
From: Richard Allen <ra@hp.is>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010924100251.B13826@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Filesystem corruption
List-ID: <linux-parisc.vger.kernel.org>

I installed the 0.92 system, upgraded everything with apt-get upgrade
and then compiled the kernel (last fridays snapshot).

The system in question is a C360, 512K Ram and a 9 Gig HD.

bofh:~# uname -a
Linux bofh 2.4.9-pa24 #2 Fri Sep 21 20:40:31 UTC 2001 parisc unknown

I then patted myself of the back and went home and had myself a good weekend.

When I returned to work this monday morning I noticed the following in
my minicom (C360 Console) window:

bofh login: EXT2-fs error (device sd(8,4)): ext2_check_page: bad entry in directory #870061: directory entry across blocks - offset=0, inode=1701273973, rec_len=24864, name_len=115
Remounting filesystem read-only
EXT2-fs error (device sd(8,4)): ext2_check_page: bad entry in directory #837235: unaligned directory entry - offset=0, inode=1684107116, rec_len=28265, name_len=103
Remounting filesystem read-only

After that all kinds of warnings and errors regarding a read only root.
I opted for a reboot and I had to run fsck manually and there where lots
of things fsck wanted me to say "Y" to.

bofh:/# du -s lost+found/
1796    lost+found
bofh:/# ls -l lost+found | grep -c ^-
50
bofh:/# ls -l lost+found | grep -c ^d
20

I would understand that "sh**" can happen when it crashes or something like
that, but nothing happened during the weekend.

-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
