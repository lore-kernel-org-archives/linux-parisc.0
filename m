From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Status of 2.6.22-rc3
Date: Tue, 29 May 2007 17:34:50 +0200
Message-ID: <JIT7A2$DBBD069B2D6747164554FD17CA1B6184__32456.2882924967$1416624377$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Helge, Kyle,

I just noticed the same pb you mentioned but with 2.6.22-rc2 rebuild with=

gcc-4.1.3 20070518 (debian pkg) ro run 32bit up kernel only:
patst004 login: Backtrace:
[<10111500>] unwind_once+0x154/0x38c
[<10110aa0>] get_wchan+0x3c/0x80
[<101a939c>] do_task_stat+0x69c/0x6a4
[<101a6b88>] proc_info_read+0xc4/0x104
[<1016d724>] vfs_read+0xb4/0x164
[<1016dbec>] sys_read+0x4c/0x90
[<1010b080>] syscall_exit+0x0/0x14
Backtrace:
[<10111500>] unwind_once+0x154/0x38c
[<101068cc>] do_show_stack+0x28/0xb0
[<10106df0>] parisc_terminate+0x7c/0xd4
[<10107274>] handle_interruption+0x24c/0x690
[<1010a080>] intr_check_sig+0x0/0x34

[snip]

[<10111500>] unwind_once+0x154/0x38c
[<101068cc>] do_show_stack+0x28/0xb0
[<10106df0>] parisc_terminate+0x7c/0xd4
[<10107274>] handle_interruption+0x24c/0x690
[<1010a080>] intr_check_sig+0x0/0x34

(this last loops for ever).

These occure after a simple 'top' on a b2k as well as on a b180.

(sorry if I couldn't any more spent more time to help to debug ;-);
The best I can do is to attempt to build same stuff with gcc-4.2? )

Joel

PS: grabing latest git tree I still got follwing WARNINGs:
WARNING: arch/parisc/kernel/built-in.o(.text.alloc_pa_dev+0x150): Section=

mismatch: reference to .init.text:parisc_hardware_description (after
'alloc_pa_dev')
WARNING: drivers/built-in.o(.text.lba_fixup_bus+0x3c): Section mismatch:
reference to .init.text:pci_read_bridge_bases (after 'lba_fixup_bus')

=0A---=0Ahttp://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
