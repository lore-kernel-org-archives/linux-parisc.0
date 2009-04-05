From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/fixes
Date: Sun, 5 Apr 2009 03:01:19 GMT
Message-ID: <200904050301.n3531JsP010509@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 0037a0f677821cf81eb14c6bf70ce6d47100adba
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Sun Apr 5 02:53:47 2009 +0000

    parisc: kill WARN in free_initmem when DEBUG_KERNEL
    
    Doing an IPI with local interrupts off triggers a warning. We
    don't need to be quite so ridiculously paranoid. Also, clean up
    a bit of the code a little.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 5fbbf6620fedd54a96267c0b6da7349e62c8473b
Author: Bastian Blank <waldi@debian.org>
Date:   Sat Apr 4 20:54:26 2009 +0000

    parisc: Remove casts from atomic macros
    
    The atomic operations on parisc are defined as macros. The macros
    includes casts which disallows the use of some syntax elements and
    produces error like this:
    
    net/phonet/pep.c: In function 'pipe_rcv_status':
    net/phonet/pep.c:262: error: lvalue required as left operand of assignment
    
    The patch removes this superfluous casts.
    
    Signed-off-by: Bastian Blank <waldi@debian.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 010bbfe92ba9c90f2b7de770c575338056e9d798
Author: Alexander Beregalov <a.beregalov@gmail.com>
Date:   Fri Apr 3 01:49:22 2009 +0000

    parisc: remove CVS keywords
    
    Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
    Acked-by: Matthew Wilcox <willy@linux.intel.com>
    Acked-by: Grant Grundler <grundler@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

