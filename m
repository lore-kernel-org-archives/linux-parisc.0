From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [parisc-linux] [PATCH] parisc: unbreak setup.c re command_line
Date: Sat, 24 Feb 2007 02:32:26 +0300
Message-ID: <20070223233226.GC5599__37026.9650164575$1416624637$gmane$org@martell.zuzino.mipt.ru>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: akpm@osdl.org
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

What compiler is supposed to do upon seeing

	char __attribute__((__section__ (".init.data")))	command_line[1024]
	     __attribute__((__section__(".data.read_mostly")));

?

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/parisc/kernel/setup.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -45,7 +45,7 @@ #include <asm/pdc_chassis.h>
 #include <asm/io.h>
 #include <asm/setup.h>
 
-char	__initdata command_line[COMMAND_LINE_SIZE] __read_mostly;
+static char __initdata command_line[COMMAND_LINE_SIZE];
 
 /* Intended for ccio/sba/cpu statistics under /proc/bus/{runway|gsc} */
 struct proc_dir_entry * proc_runway_root __read_mostly = NULL;

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
