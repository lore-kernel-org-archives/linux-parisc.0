From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Why wasn't rbrad cc'd on mux patch?
Date: Mon, 2 Oct 2006 05:26:11 -0600
Message-ID: <20061002112611.GJ16272@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Amol Lad <amol@verismonetworks.com>,
 Andrew Morton <akpm@osdl.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


I don't see anyone who knows anything about this driver on the CC list
for this patch which is already in Linus' tree.  That's poor form.
You need to check MODULE_AUTHOR next time.

commit af907dc8cd4157d629e48533b3400786467340d5
Author: Amol Lad <amol@verismonetworks.com>
Date:   Sat Sep 30 23:29:25 2006 -0700

    [PATCH] ioremap balanced with iounmap for drivers/serial/mux.c
    
    ioremap must be balanced by an iounmap and failing to do so can result
    in a memory leak.
    
    Signed-off-by: Amol Lad <amol@verismonetworks.com>
    Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
    Signed-off-by: Andrew Morton <akpm@osdl.org>
    Signed-off-by: Linus Torvalds <torvalds@osdl.org>


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
