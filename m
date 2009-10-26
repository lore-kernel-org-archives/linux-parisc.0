From: Helge Deller <deller@gmx.de>
Subject: Out of order unwind entry warning
Date: Mon, 26 Oct 2009 23:21:20 +0100
Message-ID: <4AE620E0.9040809@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Randolph Chung <randolph@tausq.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I started to look into the problem why we get the
> WARNING: Out of order unwind entry!
warning messages at kernel bootup in dmesg.

It's related to a binutils/linker bug, that ld does not correctly
removes unlink information for unused weak symbols, which have been
replaced by their non-weak ones.

In my kernel I could track it down to 2 symbols:
- arch_mod_section_prepend()  from kernel/module.c, and
- save_stack_trace_tsk().

Here is the extract of the readelf output on vmlinux:
...
<inb>: [0x1011fbd4-0x1011fc48]
         Entry_GR=1 Save_SP Save_RP Total_frame_size=8
<arch_mod_section_prepend>: [0x1011fc4c-0x1011fc74]
         Entry_GR=1 Save_SP Total_frame_size=8
<arch_mod_section_prepend>: [0x1011fc4c-0x10167cf4]
         Entry_GR=1 Save_SP Total_frame_size=8
<module_arch_cleanup>: [0x1011fc78-0x1011fcb8]
         Entry_GR=2 Save_SP Save_RP Total_frame_size=8
...

same for "save_stack_trace_tsk":

<dump_trace>: [0x10120834-0x10120950]
         Entry_GR=7 Save_SP Save_RP Total_frame_size=80
<save_stack_trace_tsk>: [0x10120954-0x101209a4]
         Entry_GR=2 Save_SP Save_RP Total_frame_size=8
<save_stack_trace_tsk>: [0x10120954-0x1015c7a8]
         Entry_GR=2 Save_SP Save_RP Total_frame_size=8
<save_stack_trace>: [0x101209a8-0x10120a04]
         Entry_GR=2 Save_SP Save_RP Total_frame_size=8

as you can see, both functions (weak and non-weak) are in the
unwind section, although the functions were only linked
once each into the vmlinux binary.

That said, maybe someone of you with binutils/ld knowledge have
some idea or hint how to fix this (aka drop the weak entry completely
from the unwind section) ?
If not, I'll continue to dig into the binutils sources (although
this takes time, as I'm just starting with this)...

Helge
