Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3D39489E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 13:51:21 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9A115B00C; Mon, 24 Sep 2001 20:50:00 +0100 (BST)
Date: Mon, 24 Sep 2001 20:50:00 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Richard Allen <ra@hp.is>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Filesystem corruption
Message-ID: <20010924205000.H5051@linuxcare.com>
References: <20010924100251.B13826@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010924100251.B13826@hp.is>; from ra@hp.is on Mon, Sep 24, 2001 at 10:02:51AM +0000
List-ID: <linux-parisc.vger.kernel.org>

I have just installed a C360 from a new ISO I made, which uses a
2.4.9-pa25 kernel.  That installed ok; I built a kernel, rebooted
and forced an fsck.  Disk was clean.  I didn't leave the system up
all that long - couple of hours maybe.  It is just possible that
the -pa25 change made a difference.  You could perhaps repeat the
exercise, forcing an fsck at the end of install, and again at the
end of kernel build to see when (if) corruption occurs.  I force
an fsck by booting with init=/bin/sh and then e2fsck -f while the
partition is still read-only.

Richard


On Mon, Sep 24, 2001 at 10:02:51AM +0000, Richard Allen wrote:
> I installed the 0.92 system, upgraded everything with apt-get upgrade
> and then compiled the kernel (last fridays snapshot).
> 
> The system in question is a C360, 512K Ram and a 9 Gig HD.
> 
> bofh:~# uname -a
> Linux bofh 2.4.9-pa24 #2 Fri Sep 21 20:40:31 UTC 2001 parisc unknown
> 
> I then patted myself of the back and went home and had myself a good weekend.
> 
> When I returned to work this monday morning I noticed the following in
> my minicom (C360 Console) window:
> 
> bofh login: EXT2-fs error (device sd(8,4)): ext2_check_page: bad entry in directory #870061: directory entry across blocks - offset=0, inode=1701273973, rec_len=24864, name_len=115
> Remounting filesystem read-only
> EXT2-fs error (device sd(8,4)): ext2_check_page: bad entry in directory #837235: unaligned directory entry - offset=0, inode=1684107116, rec_len=28265, name_len=103
> Remounting filesystem read-only
> 
> After that all kinds of warnings and errors regarding a read only root.
> I opted for a reboot and I had to run fsck manually and there where lots
> of things fsck wanted me to say "Y" to.
> 
> bofh:/# du -s lost+found/
> 1796    lost+found
> bofh:/# ls -l lost+found | grep -c ^-
> 50
> bofh:/# ls -l lost+found | grep -c ^d
> 20
> 
> I would understand that "sh**" can happen when it crashes or something like
> that, but nothing happened during the weekend.
> 
> -- 
> Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
>                --  Solaris 7 Certified Systems and Network Administrator.
> Bell Labs Unix --  Reach out and grep someone.
> Those who do not understand Unix are condemned to reinvent it, poorly.
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
