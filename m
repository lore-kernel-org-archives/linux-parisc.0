From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/parisc
Date: Tue, 23 Jun 2009 17:27:07 GMT
Message-ID: <200906231727.n5NHR7Fe005011@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit d754f0124d47a7a3bed83d292cb8400be7d75397
Author: Kyle McMartin <kyle@shortfin.cabal.ca>
Date:   Tue Jun 23 13:11:22 2009 -0400

    parisc: inventory.c, fix bloated stack frame
    
    The pa_pdc_cell struct can be kmalloc'd, so do that
    instead.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 7c871d1ce0cf1713926171ef49dfe42f7fa4b1f0
Author: Kyle McMartin <kyle@shortfin.cabal.ca>
Date:   Tue Jun 23 13:10:03 2009 -0400

    parisc: processor.c, fix bloated stack frame
    
    The pa_pdc_cell struct can be kmalloc'd, so do that instead.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

