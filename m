From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Thu, 2 Apr 2009 01:34:58 GMT
Message-ID: <200904020134.n321Yw2A008380@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 91400ac365da35b18036b46bdda27ddbcee4a663
Author: Helge Deller <deller@gmx.de>
Date:   Wed Feb 18 22:12:21 2009 +0000

    parisc: fix "make tar-pkg"
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit c18b4608958ff42ce9a1a55b0a6f40b714f47286
Author: Alexander Beregalov <a.beregalov@gmail.com>
Date:   Thu Mar 19 10:54:07 2009 +0000

    parisc: drivers: fix warnings
    
    ccio-dma.c:456: warning: overflow in implicit constant conversion
    ccio-dma.c:459: warning: overflow in implicit constant conversion
    ccio-dma.c:1032: warning: unused variable 'j'
    ccio-dma.c:1031: warning: unused variable 'max'
    ccio-dma.c:1031: warning: unused variable 'min'
    ccio-dma.c:1031: warning: unused variable 'avg'
    ccio-dma.c:1403: warning: format '%08lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
    ccio-dma.c:1403: warning: format '%08lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'
    ccio-dma.c:1554: warning: format '%lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
    dino.c:822: warning: format '%lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'
    dino.c:822: warning: format '%lx' expects type 'long unsigned int', but argument 5 has type 'resource_size_t'
    dino.c:902: warning: format '%lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
    dino.c:902: warning: format '%lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'
    asp.c:84: warning: format '%lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'
    eisa.c:317: warning: format '%08lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
    eisa_enumerator.c:101: warning: format '%lx' expects type 'long unsigned int', but argument 2 has type 'resource_size_t'
    eisa_enumerator.c:101: warning: format '%lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
    eisa_enumerator.c:191: warning: format '%lx' expects type 'long unsigned int', but argument 2 has type 'resource_size_t'
    eisa_enumerator.c:191: warning: format '%lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
    
    Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit f67d3c83f3f1e6523325628434bf19e5166b39b3
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Wed Mar 25 14:09:10 2009 +0000

    parisc: select BUG always
    
    On Wed, Mar 25, 2009 at 05:02:21PM +0300, Alexander Beregalov wrote:
    > arch/parisc/kernel/traps.c:321: error: 'PARISC_BUG_BREAK_INSN'
    > undeclared (first use in this function)
    >
    > # CONFIG_BUG is not set
    > CONFIG_EMBEDDED=y
    >
    > Is it a reasonable config?
    
    imho, no.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

