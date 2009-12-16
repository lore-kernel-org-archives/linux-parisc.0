From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/next
Date: Wed, 16 Dec 2009 03:49:25 +0000
Message-ID: <200912160349.nBG3nPeK031725@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Rebased ref, commits from common ancestor:
commit d0608b54740c82b08056b7611e38a3fd73be3564
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Tue Nov 17 22:50:59 2009 +0000

    parisc: Fixup last users of irq_chip->typename
    
    The typename member of struct irq_chip was kept for migration purposes
    and is obsolete since more than 2 years. Fix up the leftovers.
    
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 217bfb5190813d97e6003f7692f8014655ffc02a
Author: Alexey Dobriyan <adobriyan@gmail.com>
Date:   Fri Nov 27 06:51:12 2009 +0000

    parisc: convert /proc/pdc/{lcd,led} to seq_file
    
    Convert code away from ->read_proc/->write_proc interfaces.
    Switch to proc_create()/proc_create_data() which make addition of
    proc entries reliable wrt NULL ->proc_fops, NULL ->data and so on.
    
    Problem with ->read_proc et al is described here
    commit 786d7e1612f0b0adb6046f19b906609e4fe8b1ba
    "Fix rmmod/read/write races in /proc entries"
    
    Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
    Reviewed-by: Grant Grundler <grundler@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 05920797ca4c55b3c0629bc0eeb6fe634c196952
Author: David Daney <ddaney@caviumnetworks.com>
Date:   Thu Dec 10 17:28:18 2009 +0000

    parisc: Convert BUG() to use unreachable()
    
    Use the new unreachable() macro instead of for(;;);
    
    Signed-off-by: David Daney <ddaney@caviumnetworks.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 6ad6c4245e4ed0b88f5ee379c04c834b52b272a6
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Fri Nov 6 22:41:51 2009 +0000

    parisc: Replace old style lock init in smp.c
    
    SPIN_LOCK_UNLOCKED is deprecated. Init the per cpu locks at runtime
    instead.
    
    (Also kills the unused smp_lock --kyle)
    
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 8f78df872d463ac43315916663b3e688ebb2422f
Author: Helge Deller <deller@gmx.de>
Date:   Fri Nov 6 23:07:42 2009 +0000

    parisc: use sort() instead of home-made implementation (v2)
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Randolph Chung <tausq@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 11e178091f6a9c5ca479f8a276b9dd0dfacf8fc4
Author: Helge Deller <deller@gmx.de>
Date:   Sun Oct 25 21:48:36 2009 +0000

    parisc: add CALLER_ADDR{0-6} macros
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit b29f90379eb5def21ca3fdf576079c285b815e6a
Author: Helge Deller <deller@gmx.de>
Date:   Sat Oct 10 11:01:30 2009 +0000

    parisc: remove unused IRQSTAT_SIRQ_PEND and IRQSTAT_SZ defines
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 5aea0fac0fb295b0f2528cd03f93541bcd5c78e3
Author: Huang Weiyi <weiyi.huang@gmail.com>
Date:   Sat Oct 10 06:56:45 2009 +0000

    parisc: remove duplicated #include
    
    Remove duplicated #include('s) in
      arch/parisc/kernel/signal.c
    
    Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

