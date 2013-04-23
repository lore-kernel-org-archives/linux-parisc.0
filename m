From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] PARISC: Change kunmap macro to static inline function
Date: Mon, 22 Apr 2013 20:23:50 -0400
Message-ID: <BLU0-SMTP8431D8E2DE5CEDDFC64BF697B40@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-8--325109570"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-8--325109570
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Change kunmap macro to static inline function to fix build error  
compiling drivers/base/dma-buf.c.

Without the change, the following error can occur:

   CC      drivers/base/dma-buf.o
/home/dave/debian/linux/linux-3.8.5/drivers/base/dma-buf.c: In  
function 'dma_buf_kunmap':
/home/dave/debian/linux/linux-3.8.5/drivers/base/dma-buf.c:427:46:  
error: macro "kunmap" passed 3 arguments, but takes just 1
/home/dave/debian/linux/linux-3.8.5/drivers/base/dma-buf.c:427:3:  
warning: statement with no effect [-Wunused-value]
make[7]: *** [drivers/base/dma-buf.o] Error 1
make[6]: *** [drivers/base] Error 2
make[5]: *** [drivers] Error 2
make[4]: *** [sub-make] Error 2
make[3]: *** [all] Error 2
make[3]: Leaving directory `/home/dave/debian/linux/linux-3.8.5/debian/ 
build/build_hppa_none_parisc64'

I believe parisc is the only arch to implement kunmap using a macro.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
---


--Apple-Mail-8--325109570
Content-Disposition: attachment; filename="cacheflush.h.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="cacheflush.h.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index 79f694f..f0e2784 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -140,7 +140,10 @@ static inline void *kmap(struct page *page)
 	return page_address(page);
 }
 
-#define kunmap(page)			kunmap_parisc(page_address(page))
+static inline void kunmap(struct page *page)
+{
+	kunmap_parisc(page_address(page));
+}
 
 static inline void *kmap_atomic(struct page *page)
 {

--Apple-Mail-8--325109570
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-8--325109570--
