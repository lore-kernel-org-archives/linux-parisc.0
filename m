Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF9534829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 May 2003 12:03:15 -0600 (MDT)
Date: Mon, 19 May 2003 18:02:18 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Inconsistency detected by ld.so:.. / do_page_fault()
In-Reply-To: <200305191705.h4JH5YPo020750@hiauly1.hia.nrc.ca>
Message-ID: <Pine.BSF.4.53.0305191732240.86062@e0-0.zab2.int.zabbadoz.net>
References: <200305191705.h4JH5YPo020750@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 19 May 2003, John David Anglin wrote:

Hi,

> You probably should try downgrading glibc and hope that completes
> without a seg fault.
>
> Carlos had mentioned problems with -17 about a month ago.  Don't
> know if they have been fixed.

Thanks; I found the thread in my mbox'es.

What is this patch for ?
	glibc23-hppa-Rminkernel.dpatch


Further more it seems I need to read a bit more on debian package
building process in the howtos ;-(

...
make[4]: Target `tests' not remade because of errors.
make[4]: Leaving directory `/u1/src/glibc/glibc-2.3.1/glibc-2.3.1/elf'
make[3]: *** [elf/tests] Error 2
make[3]: Target `check' not remade because of errors.
make[3]: Leaving directory `/u1/src/glibc/glibc-2.3.1/glibc-2.3.1'
make[2]: *** [check] Error 2
make[2]: Leaving directory `/u1/src/glibc/glibc-2.3.1/hppa-linux/obj'
date >>/u1/src/glibc/glibc-2.3.1/log-test-hppa-linux
make[1]: Leaving directory `/u1/src/glibc/glibc-2.3.1'
touch /u1/src/glibc/glibc-2.3.1/hppa-linux/compiled-source
 debian/rules binary
Need root privileges
make: *** [/u1/src/glibc/glibc-2.3.1/hppa-linux/installed-binaries] Error 1




PS: again from building time (2.5.69-pa1) :

kernel BUG at include/linux/swapops.h:68!
Kernel addresses on the stack:
 [<1012414c>] printk+0x17c/0x1bc
 [<101059e8>] dump_stack+0x10/0x1c
 [<1014dbfc>] try_to_unmap_one+0x264/0x328
 [<1013e324>] __set_page_dirty_nobuffers+0x9c/0xac
 [<1014de24>] try_to_unmap+0x164/0x208
 [<10150fa0>] swap_writepage+0xac/0x10c
 [<10143f6c>] shrink_list+0x288/0x558
 [<101429d4>] __pagevec_release+0x20/0x30
 [<101443e4>] shrink_cache+0x1a8/0x3b8
 [<101450c4>] balance_pgdat+0x17c/0x1cc
 [<10145238>] kswapd+0x124/0x140
 [<10109c5c>] ret_from_kernel_thread+0x1c/0x24

kernel BUG at mm/rmap.c:343!
Kernel addresses on the stack:
 [<1012414c>] printk+0x17c/0x1bc
 [<101059e8>] dump_stack+0x10/0x1c
 [<1014dbdc>] try_to_unmap_one+0x244/0x328
 [<1013e324>] __set_page_dirty_nobuffers+0x9c/0xac
 [<1014de24>] try_to_unmap+0x164/0x208
 [<10150fa0>] swap_writepage+0xac/0x10c
 [<10143f6c>] shrink_list+0x288/0x558
 [<101429d4>] __pagevec_release+0x20/0x30
 [<101443e4>] shrink_cache+0x1a8/0x3b8
 [<101450c4>] balance_pgdat+0x17c/0x1cc
 [<10145238>] kswapd+0x124/0x140
 [<10109c5c>] ret_from_kernel_thread+0x1c/0x24

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
