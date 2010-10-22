From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/next
Date: Fri, 22 Oct 2010 01:27:38 +0000
Message-ID: <201010220127.o9M1Rcp4021152@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 650a35f868f809aade56ef960d8a465f57ac74e2
Author: Guy Martin <gmsoft@tuxicoman.be>
Date:   Mon Jun 14 19:24:41 2010 +0200

    parisc: add tty driver to PDC console
    
    This patch adds a tty driver to the PDC console. It allows the use
    of ports not supported by linux as a console (e.g. serial port on
    C8000.) The tty driver will not register the ttyB device if PDC console
    driver has been unregistered. This happens when the early printk
    console is disabled as it has not been selected as the primary console.
    
    Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit f8301041d7bdca3197d718518242eeba0c75352f
Author: Joe Perches <joe@perches.com>
Date:   Mon May 31 20:23:16 2010 -0700

    drivers/parisc/iosapic.c: Remove unnecessary kzalloc cast
    
    Convert kzalloc to kcalloc
    
    Signed-off-by: Joe Perches <joe@perches.com>
    Reviewed-by: Grant Grundler <grundler@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit b97680c419b75b0c2cf6837a9f268e2ecbaf50f6
Author: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Date:   Tue Jun 29 16:29:04 2010 +0900

    parisc: remove homegrown L1_CACHE_ALIGN macro
    
    Let's use the standard L1_CACHE_ALIGN macro instead.
    
    Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit 2da83b90bbbac586fca2735f7da21966a31ec33f
Author: Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de>
Date:   Mon Sep 6 16:36:06 2010 +0200

    arch/parisc: Removing undead ifdef CONFIG_PA20
    
    The CONFIG_PA20 ifdef isn't necessary at this point, because it is
    checked in an outer ifdef level already and has no effect here.
    
    Signed-off-by: Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de>
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit b1b1d4a6f244eb9513f006a188f7ed30d5014de5
Author: Phil Carmody <ext-phil.2.carmody@nokia.com>
Date:   Fri Sep 10 13:47:59 2010 +0300

    parisc: unwind - optimise linked-list searches for modules
    
    Having many dozens of modules, the searches down the linked
    list of sections would dominate the lookup time, dwarfing
    any savings from the binary search within the section.
    
    A simple move-to-front optimisation exploits the commonality
    of the code paths taken, and in simple real-world tests
    on other architectures reduced the number of steps in the
    search to barely more than 1.
    
    Signed-off-by: Phil Carmody <ext-phil.2.carmody@nokia.com>
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

commit f720817700de48a57f54535a5dd9783cca2d2d6b
Author: matt mooney <mfm@muteddisk.com>
Date:   Wed Sep 22 23:51:05 2010 -0700

    parisc: change to new flag variable
    
    Replace EXTRA_CFLAGS with ccflags-y.
    
    Signed-off-by: matt mooney <mfm@muteddisk.com>
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

