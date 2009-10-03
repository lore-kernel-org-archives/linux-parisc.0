From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/parisc
Date: Sat, 3 Oct 2009 05:29:52 GMT
Message-ID: <200910030529.n935Tqgj022900@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 4ef8774cb45c3cf78c7a2d7a1a42f6aee7eda3b2
Author: Helge Deller <deller@gmx.de>
Date:   Sun Sep 27 21:13:04 2009 +0000

    agp: parisc-agp.c - use correct page_mask function
    
    This commit:
    
    Commit 2a4ceb6d3e6a566cb4a9dc8f974177f031d27cd7
    Author: David Woodhouse <David.Woodhouse@intel.com>
    Date:   Mon Jul 27 10:27:29 2009 +0100
         agp: Switch mask_memory() method to take address argument again, not page
    
    broke the parisc AGP driver (again). This patch fixes it.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Acked-by: Dave Airlie <airlied@redhat.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

