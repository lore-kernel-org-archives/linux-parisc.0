From: Kyle McMartin <kyle@infradead.org>
Subject: commit mail stuff
Date: Wed, 21 Jan 2009 09:31:30 -0500
Message-ID: <20090121143130.GC27998@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dunno why it's broken, but this stuff is in git. Let me know if I missed
anything.

kyle@hera ~/git/parisc-2.6 $ git log
commit ac2565d69d7ef73b4e446f63759358e8a9996385
Author: Helge Deller <deller@gmx.de>
Date:   Sun Jan 18 19:30:18 2009 +0100

    parisc: use constants instead of numbers in assembly
    
    A few small fixups:
    * _PAGE_SIZE_ENCODING_DEFAULT is wrong here, as one might assume
    * that
      it's possible to define the page size that way. This is wrong. Use
0 inste
    * use constants instead of hardcoded numerical values in depi and
    * extru
      while building the PFN out of the pte entry
    * use SHRREG instead of extru (iitlba expects the PFN at bits
    * {7..26})
    
    Still wondering why we can use the same register (pte) as extru
source
    and target register, but it seems to work on PA1.1 and PA2.0...
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit cc1829ddc1c34b17ad8b56b6e4df134450a8c25a
Author: Helge Deller <deller@gmx.de>
Date:   Sun Jan 18 19:16:16 2009 +0100

    parisc: fix usage of 32bit PTE page table entries on 32bit kernels
    
    This patch fixes a long outstanding bug on 32bit parisc linux
kernels
    which prevented us from using 32bit PTE table entries (instead of
64bit
    entries of which 32bit were unused).
    
    The problem was caused by this assembler statement in the L2_ptep
    macro in arch/parisc/kernel/entry.S:447:
        EXTR \va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
    which expanded to
        extrw,u r8,9,11,r1
    and which has undefined behavior since the length value (11) extends
    beyond the leftmost bit (11-1 > 9).
    Interestingly PA2.0 processors seem to don't care and just
zero-extend
    the value, while PA1.1 processors don't.
    
    Fix this problem by detecting an address space overflow with
ASM_BITS_PER_PG
    and adjusting it accordingly. To prevent such problems in the
future,
    some compile time sanity checks in arch/parisc/mm/init.c were added.
    
    Since the page table now only consumes half of it's old size, we can
    use the freed memory to harmonize 32- and 64bit kernels and let both
    map 16MB for the initial page table.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 65aa3ffe7473eb9855b4d77d0e0198abe0892e7a
Author: Helge Deller <deller@gmx.de>
Date:   Sun Jan 18 18:13:53 2009 +0100

    parisc: add braces around arguments in assembler macros
    
    Add braces around the macro arguments, else for example
    "shl %r1, 5-3, %r2" would not expand to what you would assume.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit f152532beb6b32f10b480fc5552da9f3cf1acae2
Author: Helge Deller <deller@gmx.de>
Date:   Tue Jan 13 21:14:51 2009 +0100

    parisc: fix dev_printk() compile warnings for accessing a device
struct
    
    Fix compile warnings:
    drivers/scsi/zalon.c: In function `zalon_probe':
    drivers/scsi/zalon.c:140: warning: passing arg 1 of
`dev_driver_string' from
    drivers/scsi/zalon.c:140: warning: passing arg 1 of `dev_name' from
incompat
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 63371efefffc85af3f2535dc26827e720aa7103f
Author: Helge Deller <deller@gmx.de>
Date:   Tue Jan 13 20:54:25 2009 +0100

    parisc: remove unused local out_putf label
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit b81bf50a191ec8715beab1ac12a5ec8221693c53
Author: Helge Deller <deller@gmx.de>
Date:   Tue Jan 13 20:52:46 2009 +0100

    parisc: fix `struct pt_regs' declared inside parameter list warning
    
    Fix those compile warnings:
    uaccess.h:244: warning: `struct pt_regs' declared inside parameter
list
    uaccess.h:244: warning: its scope is only this definition or
declaration, wh
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 86377b69e291408e0e596cd1e8ca806e4f9d7790
Author: Helge Deller <deller@gmx.de>
Date:   Tue Jan 13 20:51:29 2009 +0100

    parisc: fix section mismatch warnings
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit a130bf34da4b64d7b289e2358530ef5d4ab27efd
Author: James Bottomley <James.Bottomley@HansenPartnership.com>
Date:   Fri Jan 9 18:57:06 2009 -0600

    parisc: remove klist iterators
    
    commit 11c3b5c3e08f4d855cbef52883c266b9ab9df879
    Author: Greg Kroah-Hartman <gregkh@suse.de>
    Date:   Tue Dec 16 12:24:56 2008 -0800
    
        driver core: move klist_children into private structure
    
    Broke our parisc build pretty badly because we touch the klists
directly
    in three cases (AGP, SBA and GSC).  Although GregKH will revert this
    patch, there's no reason we should be using the iterators directly,
we
    can just move to the standard device_for_each_child() API.
    
    Signed-off-by: James Bottomley
<James.Bottomley@HansenPartnership.com>
    Tested-by: Helge Deller <deller@gmx.de>
    Tested-by: Kyle McMartin <kyle@mcmartin.ca>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 1890e15142aa1318bb9775c4ea021aa022c506dc
Author: Helge Deller <deller@gmx.de>
Date:   Tue Jan 6 14:23:13 2009 +0100

    parisc: blink loadavg LEDs on Oops
    
    - blink loadavg LEDs only (not all LEDs) twice a second on Oops
    - cancel_rearming_delayed_workqueue() is obsolete,
      use cancel_delayed_work_sync() instead
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit dca7293875ccb012e521c02bc95463063ac0a693
Author: Helge Deller <deller@gmx.de>
Date:   Tue Jan 6 12:57:01 2009 +0100

    parisc: BUG_ON() cleanup
    
    - convert a few "if (xx) BUG();" to BUG_ON(xx)
    - remove a few printk()s, as we get a backtrace with BUG_ON() anyway
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 1de9e8e70f5acc441550ca75433563d91b269bbe
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri Jan 16 12:43:00 2009 -0800

    Linux 2.6.29-rc2

