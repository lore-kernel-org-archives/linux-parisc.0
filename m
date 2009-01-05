From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Mon, 5 Jan 2009 19:19:11 GMT
Message-ID: <200901051919.n05JJBEQ002191@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit ae16489eb1175066c8f3008fc3c0396c525e1906
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Sat Jan 3 06:35:40 2009 +0000

    parisc: export length of os_hpmc vector
    
    and use this instead of dealing with exporting start/end and
    toying with function descriptors.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit c61c25eb02757ecf697015ef4ae3675c5e114e2e
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Sat Dec 20 02:29:06 2008 +0000

    parisc: fix kernel crash (protection id trap) when compiling ruby1.9
    
    On Wed, Dec 17, 2008 at 11:46:05PM +0100, Helge Deller wrote:
    >
    
    Honestly, I can't decide whether to apply this. It really should never
    happen in the kernel, since the kernel can guarantee it won't get the
    access rights failure (highest privilege level, and can set %sr and
    %protid to whatever it wants.)
    
    It really genuinely is a bug that probably should panic the kernel. The
    only precedent I can easily see is x86 fixing up a bad iret with a
    general protection fault, which is more or less analogous to code 27
    here.
    
    On the other hand, taking the exception on a userspace access really
    isn't all that critical, and there's fundamentally little reason for the
    kernel not to SIGSEGV the process, and continue...
    
    Argh.
    
    (btw, I've instrumented my do_sys_poll with a pile of assertions that
     %cr8 << 1 == %sr3 == current->mm.context... let's see if where we're
     getting corrupted is deterministic, though, I would guess that it won't
     be.)
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit aefa8b6bf48fdcc904de4f166e59ab37fb750dec
Author: Julia Lawall <julia@diku.dk>
Date:   Thu Dec 25 19:33:11 2008 +0000

    parisc: Use DEFINE_SPINLOCK
    
    SPIN_LOCK_UNLOCKED is deprecated.  The following makes the change suggested
    in Documentation/spinlocks.txt
    
    The semantic patch that makes this change is as follows:
    (http://www.emn.fr/x-info/coccinelle/)
    
    // <smpl>
    @@
    declarer name DEFINE_SPINLOCK;
    identifier xxx_lock;
    @@
    
    - spinlock_t xxx_lock = SPIN_LOCK_UNLOCKED;
    + DEFINE_SPINLOCK(xxx_lock);
    // </smpl>
    
    Signed-off-by: Julia Lawall <julia@diku.dk>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 7246c31e45021bc68688c4a8fd2bbb70b485d1ef
Author: Helge Deller <deller@gmx.de>
Date:   Thu Dec 25 20:04:00 2008 +0000

    parisc: add uevent helper for parisc bus
    
    parisc: add uevent helper for parisc bus
    
    udev device-driver auto detection was failing to work on the GSC bus, since
    udev didn't knew wich driver to load due to a missing MODALIAS environment
    variable from kernel.
    
    This patch fixes this by adding the MODALIAS environment variable to the
    uevent kernel notifications.
    Since modalias_show() generated the modalias string already, I splitted this
    out and created a new static function make_modalias() which is now used by
    modalias_show() and the new parisc_uevent() function.
    
    Tested on 715/64 and c3000.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 5fbf6635a951a75870be9874580c55da538fb025
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Mon Dec 8 05:15:51 2008 +0000

    parisc: fix ipv6 checksum
    
    ipv6 recently started exhibiting the same symptoms as ipv4 was, add
    a memory clobber around inline checksum assembly that fribbles memory
    to ensure gcc doesn't erroneously cache across it.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 6525ee55bbfd35bf3aff8c59562d6a3d8559a4f0
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Mon Dec 8 09:43:08 2008 +0000

    parisc: quiet palo not-found message from "which"
    
    Reduces moaning when building on a machine without palo installed.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit ef017bebd01c1b4e075d649eee0c8c1c79f9ceb9
Author: Helge Deller <deller@gmx.de>
Date:   Wed Dec 31 03:12:10 2008 +0000

    parisc: Replace NR_CPUS in parisc code
    
    parisc: Replace most arrays sized by NR_CPUS with percpu variables.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 7f2347a44d2d5c8edf04d6950f4fb21ac868d256
Author: Helge Deller <deller@gmx.de>
Date:   Wed Dec 31 03:11:31 2008 +0000

    parisc: trivial fixes
    
    trivial fixes:
    - use KERN_WARNING for printk()
    - use BUG_ON() instead of "if (xx) BUG();"
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
    
    --
    To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
    the body of a message to majordomo@vger.kernel.org
    More majordomo info at  http://vger.kernel.org/majordomo-info.html

