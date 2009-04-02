From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Thu, 2 Apr 2009 02:46:11 GMT
Message-ID: <200904020246.n322kBwg000562@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit bb7350194130ae6bd3fdec16fe1b7597c1c0bb8d
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Thu Apr 2 02:40:41 2009 +0000

    parisc: fix build when ARCH_HAS_KMAP
    
    When we build for PA8X00, we define ARCH_HAS_KMAP, which results in
    the kmap_types.h include in highmem.h getting skipped...
    
    In file included from include/linux/pagemap.h:10,
                     from include/linux/mempolicy.h:62,
                     from init/main.c:52:
    include/linux/highmem.h:196: warning: 'enum km_type' declared inside parameter list
    include/linux/highmem.h:196: warning: its scope is only this definition or declaration, which is probably not what you want
    include/linux/highmem.h:196: error: parameter 1 ('type') has incomplete type
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

