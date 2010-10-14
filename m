From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/parisc
Date: Thu, 14 Oct 2010 05:31:27 +0000
Message-ID: <201010140531.o9E5VRYK010123@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Rebased ref, commits from common ancestor:
commit 7da1272547ebe96982a42292dfc833457708f4da
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Thu Oct 14 01:02:23 2010 -0400

    parisc: kill __do_IRQ
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit 8ed5c00d7c166f505eb2e8ff47748bfa73824130
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Thu Oct 14 01:00:51 2010 -0400

    parisc: convert eisa interrupts to flow handlers
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit 7998b3bd156478c35de685f90d4d0dda57916c60
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Thu Oct 14 00:58:53 2010 -0400

    parisc: convert gsc and dino pci interrupts to flow handlers
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit 14ff626a64f1c6848b303254be00b1b2ff33a655
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Thu Oct 14 00:53:17 2010 -0400

    parisc: convert suckyio interrupts to flow handlers
    
    No big deal, just need to convert the suckyio interrupts to be
    a nested handler instead of request_irq the suckyio device in the
    future.
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit f3d4605977f9f30993c670a85f75d8f3853144c5
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Thu Oct 14 00:38:27 2010 -0400

    parisc: convert iosapic interrupts to proper flow handlers
    
    Shift the ->end call (cpu eoi) from __do_IRQ into our
    unmask handler. Also nuke some redundant code.
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit 4d4f681dc43a06167763ec698f5de4f2b3119ad6
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Thu Oct 14 00:12:23 2010 -0400

    parisc: convert cpu interrupts to proper flow handlers
    
    Only major change is renaming functions to match the conventions
    expected by the generic irq code.
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit ba20085c20f1c9e8af546dea6ad0efa421bdef32
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Wed Oct 13 21:00:55 2010 -0400

    parisc: lay groundwork for killing __do_IRQ
    
    Use proper accessors and handlers for generic irq cleanups. We just
    call back into __do_IRQ through desc->handler now, and remove the
    explicit calls.
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

