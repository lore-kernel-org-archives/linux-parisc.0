From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Mon, 8 Dec 2008 02:06:05 GMT
Message-ID: <200812080206.mB82655g028686@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 94b5339dbe820cf874e826c3c9bb62493bb4da7f
Author: Roel Kluin <roel.kluin@gmail.com>
Date:   Wed Dec 3 04:16:04 2008 +0000

    parisc: set_time() catch errors
    
    set_rtc_time returns negative on error, ret should be signed to catch those
    
    Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
    Reviewed-by: Grant Grundler <grundler@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit e4fdb8c6aae569fec4c68c76fc0cdaa23ba9c77d
Author: Harvey Harrison <harvey.harrison@gmail.com>
Date:   Tue Dec 2 03:28:17 2008 +0000

    parisc: use the new byteorder headers
    
    Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
    Cc: Matthew Wilcox <willy@debian.org>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

