Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5407F4868
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Dec 2003 21:06:48 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1ARkfC-0004WD-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 03 Dec 2003 23:00:26 -0500
Date: Wed, 3 Dec 2003 23:00:26 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031204040026.GB17292@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] shmem 2.6 kernel bug?
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

pa,

When I ssh into my box I see:
---
kernel BUG at mm/shmem.c:585!
Kernel addresses on the stack:
 [<000000001016f338>] unmap_page_range+0xa0/0x290
 [<0000000010126e78>] sys32_rt_sigaction+0x90/0x118
 [<000000001011313c>] sys_mmap2+0x14/0x20
 [<000000001010ce4c>] syscall_exit+0x0/0x14
 [<000000001010c094>] intr_check_sig+0x0/0xc
---

    571 static void shmem_delete_inode(struct inode *inode)
    572 {
    573         struct shmem_sb_info *sbinfo = SHMEM_SB(inode->i_sb);
    574         struct shmem_inode_info *info = SHMEM_I(inode);
    575 
    576         if (inode->i_op->truncate == shmem_truncate) {
    577                 spin_lock(&shmem_ilock);
    578                 list_del(&info->list);
    579                 spin_unlock(&shmem_ilock);
    580                 if (info->flags & VM_ACCOUNT)
    581			vm_unacct_memory(VM_ACCT(inode->i_size));
    582                 inode->i_size = 0;
    583                 shmem_truncate(inode);
    584         }
==> 585         BUG_ON(inode->i_blocks);
    586         spin_lock(&sbinfo->stat_lock);
    587         sbinfo->free_inodes++;
    588         spin_unlock(&sbinfo->stat_lock);
    589         clear_inode(inode);
    590 }

*Carlos shrugs*

Linux firin 2.6.0-test11-pa0 #1 Wed Dec 3 14:51:57 EST 2003 parisc64 GNU/Linux

Reading specs from
/home/carlos/src/toolchain-build/install/lib/gcc-lib/hppa64-linux/3.3.1/specs
Configured with: ../gcc-cvs/configure --host=hppa-linux
--prefix=/home/carlos/src/toolchain-build/install --target=hppa64-linux
--build=hppa-linux
--with-gnu-ld=/home/carlos/src/toolchain-build/install/bin/ld
--with-gnu-as=/home/carlos/src/toolchain-build/install/bin/as
--enable-languages=c
Thread model: posix
gcc version 3.3.1

GNU ld version 2.14.90 20031106

c.
