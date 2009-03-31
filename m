From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Tue, 31 Mar 2009 02:52:37 GMT
Message-ID: <200903310252.n2V2qbHY009757@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 2d6d79bbe589b74c0a6612fc88e4d150f8dfa1e1
Author: Alexander Beregalov <a.beregalov@gmail.com>
Date:   Fri Mar 20 13:00:11 2009 +0300

    parisc: iosapic: fix build breakage
    
    drivers/parisc/iosapic.c:717: error: incompatible types in assignment
    
    irq_desc::affinity was changed from cpumask_t to cpumask_var_t in
    7f7ace0cda (cpumask: update irq_desc to use cpumask_var_t)
    
    Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit c48faf86b0d59cc43ff4eede59c4af7afbd7c0ff
Author: Helge Deller <deller@gmx.de>
Date:   Mon Feb 16 03:03:11 2009 +0000

    parisc: oops_enter()/oops_exit() in die()
    
    As pointed out by Russell in http://marc.info/?l=linux-arch&m=118208089204630&w=2
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit c84c3a698f17ae5d55a6ecc76298fb894e106336
Author: Helge Deller <deller@gmx.de>
Date:   Tue Dec 30 02:47:38 2008 +0000

    parisc: document light weight syscall ABI
    
    Document the LWS ABI including implementation notes for
    userspace, and comment cleanup.
    
    Remove extraneous .align 16 after lws_lock_start.
    
    Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 8a1def457bab9f9654bd4dbb1e3eea6fedd26afa
Author: Helge Deller <deller@gmx.de>
Date:   Tue Jan 6 14:23:13 2009 +0100

    parisc: blink all or loadavg LEDs on oops
    
    - depending on machine type, blink all leds or just the loadavg
      leds twice a second on oops.
    - cancel_rearming_delayed_workqueue() is obsolete,
      use cancel_delayed_work_sync() instead
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit d75f054a2cf0614ff63d534ff21ca8eaab41e713
Author: Helge Deller <deller@gmx.de>
Date:   Mon Feb 9 00:43:36 2009 +0100

    parisc: add ftrace (function and graph tracer) functionality
    
    This patch adds the ftrace debugging functionality to the parisc kernel.
    It will currently only work with 64bit kernels, because the gcc options -pg
    and -ffunction-sections can't be enabled at the same time and -ffunction-sections
    is still needed to be able to link 32bit kernels.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 803094f480aa5b7dd5187a17e6e60ff24721c212
Author: Helge Deller <deller@gmx.de>
Date:   Fri Feb 13 23:58:29 2009 +0100

    parisc: simplify sys_clone()
    
    No need to test clone_flags here and set parent_tidptr and child_tidptr
    accordingly. The same check will be done in do_fork() and copy_process() anyway.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 548f1176f0ac637eff895defb715ce6fde7c460a
Author: Helge Deller <deller@gmx.de>
Date:   Fri Feb 6 21:50:39 2009 +0100

    parisc: add LATENCYTOP_SUPPORT and CONFIG_STACKTRACE_SUPPORT
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit afca2523876301cc6130fc3cc402173eeeb89830
Author: Helge Deller <deller@gmx.de>
Date:   Thu Feb 5 00:06:00 2009 +0100

    parisc: allow to build with 16k default kernel page size
    
    Introduce new convert_for_tlb_insert20 macro and use it to replace assembler
    statements with hardcoded constants.
    This change allows the parisc64 kernel to boot with 16kb default kernel page size,
    aka CONFIG_PARISC_PAGE_SIZE_16KB=y.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 445c088f88d63db49598390be3525252d211688f
Author: Colin Watson <cjwatson@canonical.com>
Date:   Fri Jan 30 01:03:50 2009 +0000

    parisc: expose 32/64-bit capabilities in cpuinfo
    
    It'd be rather useful for debian-installer if we could get hold of
    accurate firmware information on whether only 32-bit kernels are
    supported, only 64-bit kernels, or both; this would allow us to present
    an accurate menu of kernel packages if more than one is available,
    rather than the user having to guess. This patch attempts to expose it
    in cpuinfo.
    
    I adjusted pdc_model_capabilities to cope with a potential
    PDC_INVALID_ARG return as the firmware manual instructs, by assuming
    32-bit only. This may be the wrong place for it.
    
    I made up user-visible capability names by total fiat and for the moment
    ignored the other bits that may appear in the capabilities word.
    
    I have no PA-RISC machine myself to test on, and no PA experience
    either, so I rather hope that somebody will kind-heartedly take this and
    fix it up if needed. I ran it past Dann Frazier on IRC and he said
    "looks good to me", but I think without testing.
    
    Also, this is against the Ubuntu 2.6.28 kernel tree since that's what I
    had handy and I was a bit tight on disk space to slurp down another
    tree. Sorry if it's skewed in any relevant way; I'll be happy to adjust
    if necessary.
    
    Thanks in advance!
    
    Signed-off-by: Colin Watson <cjwatson@canonical.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 1152a68c4226ce48c95241b6ffc543850b4b3a97
Author: Helge Deller <deller@gmx.de>
Date:   Sun Jan 18 19:30:18 2009 +0100

    parisc: use constants instead of numbers in assembly
    
    A few small fixups:
    * _PAGE_SIZE_ENCODING_DEFAULT is wrong here, as one might assume that
      it's possible to define the page size that way. This is wrong. Use 0 instead.
    * use constants instead of hardcoded numerical values in depi and extru
      while building the PFN out of the pte entry
    * use SHRREG instead of extru (iitlba expects the PFN at bits {7..26})
    
    Still wondering why we can use the same register (pte) as extru source
    and target register, but it seems to work on PA1.1 and PA2.0...
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 48d27cb2299c0b2fc4d551bddb6a1005828dc0c6
Author: Helge Deller <deller@gmx.de>
Date:   Sun Jan 18 19:16:16 2009 +0100

    parisc: fix usage of 32bit PTE page table entries on 32bit kernels
    
    This patch fixes a long outstanding bug on 32bit parisc linux kernels
    which prevented us from using 32bit PTE table entries (instead of 64bit
    entries of which 32bit were unused).
    
    The problem was caused by this assembler statement in the L2_ptep
    macro in arch/parisc/kernel/entry.S:447:
    	EXTR \va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
    which expanded to
    	extrw,u r8,9,11,r1
    and which has undefined behavior since the length value (11) extends
    beyond the leftmost bit (11-1 > 9).
    Interestingly PA2.0 processors seem to don't care and just zero-extend
    the value, while PA1.1 processors don't.
    
    Fix this problem by detecting an address space overflow with ASM_BITS_PER_PGD
    and adjusting it accordingly. To prevent such problems in the future,
    some compile time sanity checks in arch/parisc/mm/init.c were added.
    
    Since the page table now only consumes half of it's old size, we can
    use the freed memory to harmonize 32- and 64bit kernels and let both
    map 16MB for the initial page table.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

