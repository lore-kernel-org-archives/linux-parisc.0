Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50FC44845
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Dec 2003 00:17:09 -0700 (MST)
Date: Thu, 4 Dec 2003 08:13:25 +0100
Message-ID: <3FB25B960000D7FF@ocpmta1.freegates.net>
In-Reply-To: <20031204040026.GB17292@systemhalted>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] shmem 2.6 kernel bug?
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

hmm I didn't mentioned till now because of some non cvs stuff in my kernel
but I got same messages (ie only "BUG at mm/shmem.c:585!") with k-2.4.23
64bits on my b2k build with latest gcc-3.3.2.

hth,
    Joel

>-- Original Message --
>From: Carlos O'Donell <carlos@baldric.uwo.ca>
>To: parisc-linux@lists.parisc-linux.org
>Date: Wed, 3 Dec 2003 23:00:26 -0500
>Subject: [parisc-linux] shmem 2.6 kernel bug?
>
>
>
pa,

When I ssh into my box I see:
---
kernel BUG at mm/shmem.c:585!
Kernel addresses on the stack:
 [<000000001016f338>] unmap_page_range+0xa0/0x290
 [<0000000010126e78>] sys32_rt_sigaction+0x90/0x118
 [<000000001011313c>] sys_mmap2+0x14/0x2
>
 [<000000001010ce4c>] syscall_exit+0x0/0x14
 [<000000001010c094>] intr_check_sig+0x0/0xc
---

    571 static void shmem_delete_inode(struct inode *inode)
    572 {
    573         struct shmem_sb_info *sbinfo = SHMEM_SB(inode->i_sb);
    574  
>      struct shmem_inode_info *info = SHMEM_I(inode);
    575 
    576         if (inode->i_op->truncate == shmem_truncate) {
    577                 spin_lock(&shmem_ilock);
    578                 list_del(&info->list);
    579                 s
>in_unlock(&shmem_ilock);
    580                 if (info->flags & VM_ACCOUNT)
    581			vm_unacct_memory(VM_ACCT(inode->i_size));
    582                 inode->i_size = 0;
    583                 shmem_truncate(inode);
    584         }
==> 585
>        BUG_ON(inode->i_blocks);
    586         spin_lock(&sbinfo->stat_lock);
    587         sbinfo->free_inodes++;
    588         spin_unlock(&sbinfo->stat_lock);
    589         clear_inode(inode);
    590 }

*Carlos shrugs*

Linux firin
>2.6.0-test11-pa0 #1 Wed Dec 3 14:51:57 EST 2003 parisc64 GNU/Linux

Reading specs from
/home/carlos/src/toolchain-build/install/lib/gcc-lib/hppa64-linux/3.3.1/specs
Configured with: ../gcc-cvs/configure --host=hppa-linux
--prefix=/home/carlos/src/
>oolchain-build/install --target=hppa64-linux
--build=hppa-linux
--with-gnu-ld=/home/carlos/src/toolchain-build/install/bin/ld
--with-gnu-as=/home/carlos/src/toolchain-build/install/bin/as
--enable-languages=c
Thread model: posix
gcc version 3.3.1
>

GNU ld version 2.14.90 20031106

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
