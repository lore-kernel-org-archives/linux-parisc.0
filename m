From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/parisc
Date: Wed, 24 Jun 2009 01:39:57 GMT
Message-ID: <200906240139.n5O1dvSH013997@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit dafba938247a83a3df0fb74f5b002199fb78a467
Author: Kyle McMartin <kyle@shortfin.cabal.ca>
Date:   Tue Jun 23 21:38:49 2009 -0400

    perf: wire up sys_perf_counter_open
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit b3808c0a514ff39298a1f1d17e45e0e224c47a95
Author: Kyle McMartin <kyle@shortfin.cabal.ca>
Date:   Tue Jun 23 21:32:18 2009 -0400

    parisc: add task_pt_regs macro
    
    needed for perf_counters.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 9a76595b135d99c3132403929f1a5ea0575c65c4
Author: Kyle McMartin <kyle@shortfin.cabal.ca>
Date:   Tue Jun 23 20:22:06 2009 -0400

    parisc: wire sys_perf_counter_open to sys_ni_syscall
    
    Reserves a syscall slot for it, until it gets a proper compat
    wrapper it's pretty useless though.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

