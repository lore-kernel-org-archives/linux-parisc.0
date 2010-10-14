From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/parisc
Date: Thu, 14 Oct 2010 05:24:57 +0000
Message-ID: <201010140524.o9E5Ovo1001233@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Rebased ref, commits from common ancestor:
commit 051d044fcbbd363c6896d2a364bdbd5b2559bab7
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Thu Oct 14 01:02:23 2010 -0400

    parisc: kill __do_IRQ
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit 5912de5b24d683c9259264bf417f3e89bc49d95b
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Thu Oct 14 01:00:51 2010 -0400

    parisc: convert eisa interrupts to flow handlers
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit 81fc1dc038973832eef253457836a205009a4fd4
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Thu Oct 14 00:58:53 2010 -0400

    parisc: convert gsc and dino pci interrupts to flow handlers
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit 19a6c0da8c9b415f4029198548de1a8d99d1dd54
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Thu Oct 14 00:53:17 2010 -0400

    parisc: convert suckyio interrupts to flow handlers
    
    No big deal, just need to convert the suckyio interrupts to be
    a nested handler instead of request_irq the suckyio device in the
    future.
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit 77c7d196f53a55133bb1b45d1fdb311035a9a9e8
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Thu Oct 14 00:38:27 2010 -0400

    parisc: convert iosapic interrupts to proper flow handlers
    
    Shift the ->end call (cpu eoi) from __do_IRQ into our
    unmask handler. Also nuke some redundant code.
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit 88da47ae5dc9def0213e9403355b20a71dae0b08
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Thu Oct 14 00:12:23 2010 -0400

    parisc: convert cpu interrupts to proper flow handlers
    
    Only major change is renaming functions to match the conventions
    expected by the generic irq code.
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit 274106f4ed5a118c12e005b79713101ff927ee01
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Wed Oct 13 21:00:55 2010 -0400

    parisc: lay groundwork for killing __do_IRQ
    
    Use proper accessors and handlers for generic irq cleanups. We just
    call back into __do_IRQ through desc->handler now, and remove the
    explicit calls.
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

