From: maximilian attems <max@stro.at>
Subject: [parisc-linux] [patch] ccio kill old cvstree ref
Date: Thu, 5 Jul 2007 10:06:23 +0200
Message-ID: <20070705080623.GI5108__38181.9150331014$1416624639$gmane$org@stro.at>
References: <20070704153917.GN13523@stro.at>
	<20070705001953.GB16764@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070705001953.GB16764@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

this cvs tree is long defunct, rm co instructions.
text changes revised by Grant Grundler.

Signed-off-by: maximilian attems <max@stro.at>
Signed-off-by: Grant Grundler <grundler@parisc-linux.org>

---

 drivers/parisc/ccio-dma.c    |    5 +----
 drivers/parisc/ccio-rm-dma.c |    4 ----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index b3c4dbf..41756b5 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -17,10 +17,7 @@
 **  U2/Uturn were designed to perform coherency checks w/o using
 **  the I/O MMU - basically what x86 does.
 **
-**  Philipp Rumpf has a "Real Mode" driver for PCX-W machines at:
-**      CVSROOT=:pserver:anonymous@198.186.203.37:/cvsroot/linux-parisc
-**      cvs -z3 co linux/arch/parisc/kernel/dma-rm.c
-**
+**  Philipp Rumpf wrote a "Real Mode" driver for PCX-W machines.
 **  I've rewritten his code to work under TPG's tree. See ccio-rm-dma.c.
 **
 **  Drawbacks of using Real Mode are:
diff --git a/drivers/parisc/ccio-rm-dma.c b/drivers/parisc/ccio-rm-dma.c
index 356b835..b5d5bae 100644
--- a/drivers/parisc/ccio-rm-dma.c
+++ b/drivers/parisc/ccio-rm-dma.c
@@ -21,10 +21,6 @@
  * (at your option) any later version.
  *
  *
- * Original version/author:
- *      CVSROOT=:pserver:anonymous@198.186.203.37:/cvsroot/linux-parisc
- *      cvs -z3 co linux/arch/parisc/kernel/dma-rm.c
- *
  *	(C) Copyright 2000 Philipp Rumpf <prumpf@tux.org>
  *
  *

-- 
maks
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
