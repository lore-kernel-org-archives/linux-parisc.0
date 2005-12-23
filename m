From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [parisc-linux] [PATCH] parisc: add __iomem to __raw_check_addr()
Date: Sat, 24 Dec 2005 02:36:20 +0300
Message-ID: <20051223233620.GA23618@mipter.zuzino.mipt.ru>
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

Nukes ~13809 sparse warnings on allmodconfig.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 include/asm-parisc/io.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/include/asm-parisc/io.h
+++ b/include/asm-parisc/io.h
@@ -41,7 +41,7 @@ extern void __raw_bad_addr(const volatil
 #define __raw_check_addr(addr)					\
 	if (((unsigned long)addr >> NYBBLE_SHIFT) != 0xe)	\
 		__raw_bad_addr(addr);			\
-	addr = (void *)((unsigned long)addr | (0xfUL << NYBBLE_SHIFT));
+	addr = (void __iomem *)((unsigned long)addr | (0xfUL << NYBBLE_SHIFT));
 #else
 #define gsc_check_addr(addr)
 #define __raw_check_addr(addr)

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
