Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 89E2A487E
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 22 Jan 2004 14:38:50 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id EEE71298097
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 22 Jan 2004 14:38:49 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 17491-06 for <parisc-linux@lists.parisc-linux.org>;
	Thu, 22 Jan 2004 14:38:49 -0700 (MST)
Date: Thu, 22 Jan 2004 14:38:49 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040122213849.GG13354@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] kernel BUG at mm/shmem.c:585!
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Just booted 2.6.1-pa9 (-pa8 + SBA change) and got:

kernel BUG at mm/shmem.c:585!
Kernel addresses on the stack:
 [<000000001016dc30>]  [<0000000010125cd8>]  [<0000000010111cd4>]  [<000000001010be4c>] 
 [<000000001010b094>]

those correspond to:
	0x1016dc30 unmap_page_range+a0
	0x10125cd8 sys32_rt_sigaction+90
	0x10111cd4 sys_mmap2+14
	0x1010be4c syscall_exit+0
	0x1010b094 intr_check_sig+0

This is on a500 (hppa64) with:
grundler <509>df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/md2               1539008   1257752    265624  83% /
/dev/md3               6683304   3688352   2927052  56% /home
/dev/md0              52507076   3455824  46384048   7% /usr/src
grundler <510>mount
/dev/md2 on / type ext3 (rw,errors=remount-ro)
proc on /proc type proc (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
/dev/md3 on /home type ext3 (rw,errors=remount-ro)
/dev/md0 on /usr/src type ext3 (rw,errors=remount-ro)


grant
