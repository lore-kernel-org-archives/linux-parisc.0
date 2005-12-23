From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [parisc-linux] [PATCH] include/asm-parisc/processor.h: C99
	initializers
Date: Sat, 24 Dec 2005 02:39:01 +0300
Message-ID: <20051223233901.GB23618@mipter.zuzino.mipt.ru>
References: <20051222101523.GP27946@ftp.linux.org.uk>
	<20051223093146.GT27946@ftp.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Al Viro <viro@ftp.linux.org.uk>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051223093146.GT27946@ftp.linux.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 include/asm-parisc/processor.h |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

--- a/include/asm-parisc/processor.h
+++ b/include/asm-parisc/processor.h
@@ -144,16 +144,16 @@ struct thread_struct {
         })
 
 #define INIT_THREAD { \
-	regs:	{	gr: { 0, }, \
-			fr: { 0, }, \
-			sr: { 0, }, \
-			iasq: { 0, }, \
-			iaoq: { 0, }, \
-			cr27: 0, \
+	.regs = {	.gr	= { 0, }, \
+			.fr	= { 0, }, \
+			.sr	= { 0, }, \
+			.iasq	= { 0, }, \
+			.iaoq	= { 0, }, \
+			.cr27	= 0, \
 		}, \
-	task_size:      DEFAULT_TASK_SIZE, \
-	map_base:       DEFAULT_MAP_BASE, \
-	flags:          0 \
+	.task_size	= DEFAULT_TASK_SIZE, \
+	.map_base	= DEFAULT_MAP_BASE, \
+	.flags		= 0 \
 	}
 
 /*

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
