Return-Path: <wichert@levante.wiggy.net>
Received: from mx1.wiggy.net (levante.wiggy.net [195.85.225.139])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE56248AF
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  2 Mar 2004 06:41:39 -0700 (MST)
Received: from wichert by mx1.wiggy.net with local (Exim 4.30)
	id 1AyA9S-000585-P5
	for parisc-linux@lists.parisc-linux.org; Tue, 02 Mar 2004 14:41:38 +0100
Date: Tue, 2 Mar 2004 14:41:38 +0100
From: Wichert Akkerman <wichert@wiggy.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040302134138.GA19692@wiggy.net>
References: <20040302100622.GL2502@wiggy.net>
	<20040302130323.GA17623@wiggy.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040302130323.GA17623@wiggy.net>
Sender: Wichert Akkerman <wichert@levante.wiggy.net>
Subject: [parisc-linux] Re: another kernel oops
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

And another one. 2.6.4-rc1-pa kernel compiled by tausq to rule out
problems in my toolchain.

syslogd (pid 198): Illegal instruction (code 8) at 000000004004c47f
kernel BUG at include/linux/mm.h:275!
Kernel addresses on the stack:
 [<0000000010105680>] show_trace+0x40/0x108
 [<00000000101054cc>] dump_stack+0x24/0x38
 [<0000000010182948>] free_page_and_swap_cache+0xd0/0x130
 [<0000000010172358>] zap_pte_range+0x220/0x288
 [<0000000010189778>] get_empty_filp+0x80/0x180
 [<00000000101724a8>] zap_pmd_range+0xe8/0x108
 [<0000000010172580>] unmap_page_range+0xb8/0x298
 [<00000000101728d0>] unmap_vmas+0x170/0x3a8
 [<0000000010178abc>] exit_mmap+0x8c/0x2d0
 [<0000000010279b90>] put_io_context+0xc8/0xd8
 [<000000001013b8b4>] mmput+0xa4/0xe0
 [<00000000101415b8>] do_exit+0x250/0x580
 [<0000000010199ab8>] do_coredump+0x178/0x248
 [<0000000010141a40>] do_group_exit+0xe8/0x110
 [<000000001014d620>] get_signal_to_deliver+0x1b0/0x530
 [<0000000010112d6c>] do_signal+0x3c/0x324
 [<0000000010139174>] schedule+0x3f4/0x7c8
 [<000000001010c2c8>] intr_do_signal+0x2c/0x34

swap_free: Bad swap file entry 008f0844
swap_free: Bad swap file entry 00000005
kernel BUG at include/linux/mm.h:275!
Kernel addresses on the stack:
 [<0000000010105680>] show_trace+0x40/0x108
 [<00000000101054cc>] dump_stack+0x24/0x38
 [<0000000010182948>] free_page_and_swap_cache+0xd0/0x130
 [<0000000010172358>] zap_pte_range+0x220/0x288
 [<0000000010189778>] get_empty_filp+0x80/0x180
 [<00000000101724a8>] zap_pmd_range+0xe8/0x108
 [<0000000010172580>] unmap_page_range+0xb8/0x298
 [<00000000101728d0>] unmap_vmas+0x170/0x3a8
 [<0000000010178abc>] exit_mmap+0x8c/0x2d0
 [<0000000010279b90>] put_io_context+0xc8/0xd8
 [<000000001013b8b4>] mmput+0xa4/0xe0
 [<00000000101415b8>] do_exit+0x250/0x580
 [<0000000010199ab8>] do_coredump+0x178/0x248
 [<0000000010141a40>] do_group_exit+0xe8/0x110
 [<000000001014d620>] get_signal_to_deliver+0x1b0/0x530
 [<0000000010112d6c>] do_signal+0x3c/0x324
 [<0000000010139174>] schedule+0x3f4/0x7c8
 [<000000001010c2c8>] intr_do_signal+0x2c/0x34

kernel BUG at include/linux/mm.h:275!
Kernel addresses on the stack:
 [<0000000010105680>] show_trace+0x40/0x108
 [<00000000101054cc>] dump_stack+0x24/0x38
 [<0000000010182948>] free_page_and_swap_cache+0xd0/0x130
 [<0000000010172358>] zap_pte_range+0x220/0x288
 [<0000000010189778>] get_empty_filp+0x80/0x180
 [<00000000101724a8>] zap_pmd_range+0xe8/0x108
 [<0000000010172580>] unmap_page_range+0xb8/0x298
 [<00000000101728d0>] unmap_vmas+0x170/0x3a8
 [<0000000010178abc>] exit_mmap+0x8c/0x2d0
 [<0000000010279b90>] put_io_context+0xc8/0xd8
 [<000000001013b8b4>] mmput+0xa4/0xe0
 [<00000000101415b8>] do_exit+0x250/0x580
 [<0000000010199ab8>] do_coredump+0x178/0x248
 [<0000000010141a40>] do_group_exit+0xe8/0x110
 [<000000001014d620>] get_signal_to_deliver+0x1b0/0x530
 [<0000000010112d6c>] do_signal+0x3c/0x324
 [<0000000010139174>] schedule+0x3f4/0x7c8
 [<000000001010c2c8>] intr_do_signal+0x2c/0x34

kernel BUG at include/linux/mm.h:275!
Kernel addresses on the stack:
 [<0000000010105680>] show_trace+0x40/0x108
 [<00000000101054cc>] dump_stack+0x24/0x38
 [<0000000010182948>] free_page_and_swap_cache+0xd0/0x130
 [<0000000010172358>] zap_pte_range+0x220/0x288
 [<0000000010189778>] get_empty_filp+0x80/0x180
 [<00000000101724a8>] zap_pmd_range+0xe8/0x108
 [<0000000010172580>] unmap_page_range+0xb8/0x298
 [<00000000101728d0>] unmap_vmas+0x170/0x3a8
 [<0000000010178abc>] exit_mmap+0x8c/0x2d0
 [<0000000010279b90>] put_io_context+0xc8/0xd8
 [<000000001013b8b4>] mmput+0xa4/0xe0
 [<00000000101415b8>] do_exit+0x250/0x580
 [<0000000010199ab8>] do_coredump+0x178/0x248
 [<0000000010141a40>] do_group_exit+0xe8/0x110
 [<000000001014d620>] get_signal_to_deliver+0x1b0/0x530
 [<0000000010112d6c>] do_signal+0x3c/0x324
 [<0000000010139174>] schedule+0x3f4/0x7c8
 [<000000001010c2c8>] intr_do_signal+0x2c/0x34

swap_free: Bad swap file entry 003ccbf0
swap_free: Bad swap file entry 0000026d
swap_free: Bad swap file entry fe000000000000
kernel BUG at include/linux/mm.h:275!
Kernel addresses on the stack:
 [<0000000010105680>] show_trace+0x40/0x108
 [<00000000101054cc>] dump_stack+0x24/0x38
 [<0000000010182948>] free_page_and_swap_cache+0xd0/0x130
 [<0000000010172358>] zap_pte_range+0x220/0x288
 [<0000000010189778>] get_empty_filp+0x80/0x180
 [<00000000101724a8>] zap_pmd_range+0xe8/0x108
 [<0000000010172580>] unmap_page_range+0xb8/0x298
 [<00000000101728d0>] unmap_vmas+0x170/0x3a8
 [<0000000010178abc>] exit_mmap+0x8c/0x2d0
 [<0000000010279b90>] put_io_context+0xc8/0xd8
 [<000000001013b8b4>] mmput+0xa4/0xe0
 [<00000000101415b8>] do_exit+0x250/0x580
 [<0000000010199ab8>] do_coredump+0x178/0x248
 [<0000000010141a40>] do_group_exit+0xe8/0x110
 [<000000001014d620>] get_signal_to_deliver+0x1b0/0x530
 [<0000000010112d6c>] do_signal+0x3c/0x324
 [<0000000010139174>] schedule+0x3f4/0x7c8
 [<000000001010c2c8>] intr_do_signal+0x2c/0x34

swap_free: Bad swap file entry fe000000000000
kernel BUG at include/linux/mm.h:275!
Kernel addresses on the stack:
 [<0000000010105680>] show_trace+0x40/0x108
 [<00000000101054cc>] dump_stack+0x24/0x38
 [<0000000010182948>] free_page_and_swap_cache+0xd0/0x130
 [<0000000010172358>] zap_pte_range+0x220/0x288
 [<0000000010189778>] get_empty_filp+0x80/0x180
 [<00000000101724a8>] zap_pmd_range+0xe8/0x108
 [<0000000010172580>] unmap_page_range+0xb8/0x298
 [<00000000101728d0>] unmap_vmas+0x170/0x3a8
 [<0000000010178abc>] exit_mmap+0x8c/0x2d0
 [<0000000010279b90>] put_io_context+0xc8/0xd8
 [<000000001013b8b4>] mmput+0xa4/0xe0
 [<00000000101415b8>] do_exit+0x250/0x580
 [<0000000010199ab8>] do_coredump+0x178/0x248
 [<0000000010141a40>] do_group_exit+0xe8/0x110
 [<000000001014d620>] get_signal_to_deliver+0x1b0/0x530
 [<0000000010112d6c>] do_signal+0x3c/0x324
 [<0000000010139174>] schedule+0x3f4/0x7c8
 [<000000001010c2c8>] intr_do_signal+0x2c/0x34

swap_free: Bad swap file entry 2800000000000001
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 00132760
swap_free: Bad swap file entry 1000000000000008
kernel BUG at include/linux/mm.h:275!
Kernel addresses on the stack:
 [<0000000010105680>] show_trace+0x40/0x108
 [<00000000101054cc>] dump_stack+0x24/0x38
 [<0000000010182948>] free_page_and_swap_cache+0xd0/0x130
 [<0000000010172358>] zap_pte_range+0x220/0x288
 [<00000000101724a8>] zap_pmd_range+0xe8/0x108
 [<0000000010172580>] unmap_page_range+0xb8/0x298
 [<000000001013a97c>] __cond_resched+0x2c/0x48
 [<00000000101728d0>] unmap_vmas+0x170/0x3a8
 [<0000000010178abc>] exit_mmap+0x8c/0x2d0
 [<0000000010279b90>] put_io_context+0xc8/0xd8
 [<000000001013b8b4>] mmput+0xa4/0xe0
 [<00000000101415b8>] do_exit+0x250/0x580
 [<0000000010199ab8>] do_coredump+0x178/0x248
 [<0000000010141a40>] do_group_exit+0xe8/0x110
 [<000000001014d620>] get_signal_to_deliver+0x1b0/0x530
 [<0000000010112d6c>] do_signal+0x3c/0x324
 [<0000000010139174>] schedule+0x3f4/0x7c8
 [<000000001010c2c8>] intr_do_signal+0x2c/0x34

swap_free: Bad swap file entry 00132510
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 8800000000000000
swap_free: Bad swap file entry 000001b8
swap_free: Bad swap file entry 000001b8
swap_free: Bad swap file entry 000001b4
swap_free: Bad swap file entry 800000000000000
kernel BUG at include/linux/mm.h:275!
Kernel addresses on the stack:
 [<0000000010105680>] show_trace+0x40/0x108
 [<00000000101054cc>] dump_stack+0x24/0x38
 [<0000000010182948>] free_page_and_swap_cache+0xd0/0x130
 [<0000000010172358>] zap_pte_range+0x220/0x288
 [<00000000101724a8>] zap_pmd_range+0xe8/0x108
 [<0000000010172580>] unmap_page_range+0xb8/0x298
 [<000000001013a97c>] __cond_resched+0x2c/0x48
 [<00000000101728d0>] unmap_vmas+0x170/0x3a8
 [<0000000010178abc>] exit_mmap+0x8c/0x2d0
 [<0000000010279b90>] put_io_context+0xc8/0xd8
 [<000000001013b8b4>] mmput+0xa4/0xe0
 [<00000000101415b8>] do_exit+0x250/0x580
 [<0000000010199ab8>] do_coredump+0x178/0x248
 [<0000000010141a40>] do_group_exit+0xe8/0x110
 [<000000001014d620>] get_signal_to_deliver+0x1b0/0x530
 [<0000000010112d6c>] do_signal+0x3c/0x324
 [<0000000010139174>] schedule+0x3f4/0x7c8
 [<000000001010c2c8>] intr_do_signal+0x2c/0x34

swap_free: Bad swap file entry 6000000000000000
swap_free: Bad swap file entry 7000000000080000
swap_free: Bad swap file entry 00132b20
swap_free: Bad swap file entry 00000002
swap_free: Bad swap file entry 7000000000080000
swap_free: Bad swap file entry 800000000000000
swap_free: Bad swap file entry 008f0844
swap_free: Bad swap file entry 00000005
swap_free: Bad swap file entry 003ccbf0
swap_free: Bad swap file entry 008f0890
swap_free: Bad swap file entry 0000026d
swap_free: Bad swap file entry fe000000000000
swap_free: Bad swap file entry fe000000000000
swap_free: Bad swap file entry 008f0890
swap_free: Bad swap file entry 2800000000000001
swap_free: Bad swap file entry 800000000000000
kernel BUG at include/linux/mm.h:275!
Kernel addresses on the stack:
 [<0000000010105680>] show_trace+0x40/0x108
 [<00000000101054cc>] dump_stack+0x24/0x38
 [<0000000010182948>] free_page_and_swap_cache+0xd0/0x130
 [<0000000010172358>] zap_pte_range+0x220/0x288
 [<00000000101724a8>] zap_pmd_range+0xe8/0x108
 [<0000000010172580>] unmap_page_range+0xb8/0x298
 [<000000001013a97c>] __cond_resched+0x2c/0x48
 [<00000000101728d0>] unmap_vmas+0x170/0x3a8
 [<0000000010178abc>] exit_mmap+0x8c/0x2d0
 [<0000000010279b90>] put_io_context+0xc8/0xd8
 [<000000001013b8b4>] mmput+0xa4/0xe0
 [<00000000101415b8>] do_exit+0x250/0x580
 [<0000000010199ab8>] do_coredump+0x178/0x248
 [<0000000010141a40>] do_group_exit+0xe8/0x110
 [<000000001014d620>] get_signal_to_deliver+0x1b0/0x530
 [<0000000010112d6c>] do_signal+0x3c/0x324
 [<0000000010139174>] schedule+0x3f4/0x7c8
 [<000000001010c2c8>] intr_do_signal+0x2c/0x34

swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 00132760
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 00132510
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 8800000000000000
swap_free: Bad swap file entry 000001b8
swap_free: Bad swap file entry 000001b8
swap_free: Bad swap file entr001b4
swap_free: Bad swap file entry 800000000000000
swap_free: Bad swap file entry 008f0890
swap_free: Bad swap file entry 6000000000000000
swap_free: Bad swap file entry 7000000000080000
swap_free: Bad swap file entry 00132b20
swap_free: Bad swap file entry 00000002
swap_free: Bad swap file entry 7000000000080000
swap_free: Bad swap file entry 7800000000080000
swap_free: Bad swap file entry 00132b20
swap_free: Bad swap file entry 008f0890
swap_free: Bad swap file entry 008f0844
swap_free: Bad swap file entry 00000005
swap_free: Bad swap file entry 003ccbf0
swap_free: Bad swap file entry 0000026d
swap_free: Bad swap file entry fe000000000000
swap_free: Bad swap file entry fe000000000000
swap_free: Bad swap file entry 2800000000000001
swap_free: Bad swap file entry 800000000000000
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 10000000008
swap_free: Bad swap file entry 00132760
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 00132510
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 8800000000000000
swap_free: Bad swap file entry 000001b8
swap_free: Bad swap file entry 000001b8
swap_free: Bad swap file entry 000001b4
swap_free: Bad swap file entry 800000000000000
swap_free: Bad swap file entry 6000000000000000
swap_free: Bad swap file entry 7000000000080000
swap_free: Bad swap file entry 00132b20
swap_free: Bad swap file entry 008f089b
swap_free: Bad swap file entry 00000002
swap_free: Bad swap file entry 7000000000080000
swap_free: Bad swap file entry 800000000000000
swap_free: Bad swap file entry 008f0844
swap_free: Bad swap file entry 00000005
swap_free: Bad swap file entry 003ccbf0
swap_free: Bad swap file entry 0000026d
swap_free: Badp file entry fe000000000000
swap_free: Bad swap file entry fe000000000000
swap_free: Bad swap file entry 2800000000000001
swap_free: Bad swap file entry 800000000000000
swap_free: Bad swap file entry 008f089f
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 00132760
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 00132510
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 8800000000000000
swap_free: Bad swap file entry 000001b8
swap_free: Bad swap file entry 000001b8
swap_free: Bad swap file entry 000001b4
swap_free: Bad swap file entry 800000000000000
swap_free: Bad swap file entry 6000000000000000
swap_free: Bad swap file entry 7000000000080000
swap_free: Bad swap file entry 00132b20
swap_free: Bad swap file entry 00000002
swap_free: Bad swap file entry 7000000000080000
swap_free: Bad swap file entry 7800000000080000
swap_free: Bad swap file entry 00132e60
swap_free: Bad swap file entry 008f0844
swap_free: Bad swap file entry 00000005
swap_free: Bad swle entry 003ccbf0
swap_free: Bad swap file entry 008f089f
swap_free: Bad swap file entry 0000026d
swap_free: Bad swap file entry fe000000000000
swap_free: Bad swap file entry fe000000000000
swap_free: Bad swap file entry 008f089f
swap_free: Bad swap file entry 2800000000000001
swap_free: Bad swap file entry 800000000000000
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 00132760
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 00132510
swap_free: Bad swap file entry 1000000000000008
swap_free: Bad swap file entry 8800000000000000
swap_free: Bad swap file entry 000001b8
swap_free: Bad swap file entry 000001b8
swap_freed swap file entry 000001b4
swap_free: Bad swap file entry 800000000000000
swap_free: Bad swap file entry 008f089f
swap_free: Bad swap file entry 6000000000000000
swap_free: Bad swap file entry 7000000000080000
swap_free: Bad swap file entry 00132b20
swap_free: Bad swap file entry 00000002
swap_free: Bad swap file entry 7000000000080000

Wichert.

-- 
Wichert Akkerman <wichert@wiggy.net>    It is simple to make things.
http://www.wiggy.net/                   It is hard to make things simple.
