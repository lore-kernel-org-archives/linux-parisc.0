From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] 2.6.23-rc5 warnings
Date: Tue, 11 Sep 2007 13:55:21 +0000
Message-ID: <46E69E49.3020104__39032.6440487572$1416624439$gmane$org@scarlet.be>
References: <46E69C26.8060104@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org,
 John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Kyle McMartin <kyle@mcmartin.ca>
To: Helge Deller <deller@gmx.de>
Return-Path: <soete.joel@scarlet.be>
In-Reply-To: <46E69C26.8060104@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>

Hello Helge,

Helge Deller wrote:
> On Tuesday 04 September 2007, John David Anglin wrote:
>  > Some section mismatches in 64-bit kernel build:
>  >
>  > WARNING: vmlinux.o(.text+0xb0): Section mismatch: reference to 
> .init.text:start_
>  > kernel (between '$pgt_fill_loop' and 'common_stext')
>  > WARNING: vmlinux.o(.text+0xb4): Section mismatch: reference to 
> .init.text:start_
>  > kernel (between '$pgt_fill_loop' and 'common_stext')
>  > WARNING: vmlinux.o(.text+0x290): Section mismatch: reference to 
> .init.text:smp_c
>  > allin (between 'smp_slave_stext' and 'flush_tlb_all_local')
>  > WARNING: vmlinux.o(.text+0x294): Section mismatch: reference to 
> .init.text:smp_c
>  > allin (between 'smp_slave_stext' and 'flush_tlb_all_local')
>  > WARNING: vmlinux.o(.text.write_profile+0x19c): Section mismatch: 
> reference to .i
>  > nit.text:setup_profiling_timer (after 'write_profile')
>  >
>  > I think there was a warning about a missing syscall fallocate.
> 
> The first two warnings are valid for 32bit as well. Reason is:
> [head.S:122]        load32          start_kernel,%r11
> 
> fallocate() syscall is missing in 32bit too.
> 
> Helge
> 
> 
So is it what we would need (I am always in doubt when _COMP and _SAME have to be used):
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 2540786..117438e 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -403,6 +403,7 @@
         ENTRY_COMP(signalfd)
         ENTRY_COMP(timerfd)
         ENTRY_SAME(eventfd)
+       ENTRY_COMP(fallocate)           /* 305 */

         /* Nothing yet */

diff --git a/include/asm-parisc/unistd.h b/include/asm-parisc/unistd.h
index f74099b..081b4ae 100644
--- a/include/asm-parisc/unistd.h
+++ b/include/asm-parisc/unistd.h
@@ -797,8 +797,9 @@
  #define __NR_signalfd          (__NR_Linux + 302)
  #define __NR_timerfd           (__NR_Linux + 303)
  #define __NR_eventfd           (__NR_Linux + 304)
+#define __NR_fallocate         (__NR_Linux + 305)

-#define __NR_Linux_syscalls    (__NR_eventfd + 1)
+#define __NR_Linux_syscalls    (__NR_fallocate + 1)


  #define __IGNORE_select                /* newselect */
=== <> ===

Tx,
	J.
