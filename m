From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Thu, 2 Apr 2009 00:20:32 GMT
Message-ID: <200904020020.n320KWsK013000@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit d845e1fbf2d48f6556fbfae7ec04adf67ab14bca
Author: Alexander Beregalov <a.beregalov@gmail.com>
Date:   Wed Apr 1 15:43:40 2009 +0000

    parisc: asm/pdc.h should include asm/page.h
    
    Fixes this build error:
    arch/parisc/kernel/pdc_cons.c:117: error: '__PAGE_OFFSET' undeclared
    
    Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

