From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 174/199] arch/parisc/lib/io.c: Checkpatch cleanup
Date: Sun, 23 May 2010 22:02:01 +0200
Message-ID: <1274644930-26600-17-git-send-email-andrea.gelmini@gelma.net>
References: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: andrea.gelmini@gelma.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

arch/parisc/lib/io.c:55: ERROR: trailing whitespace
arch/parisc/lib/io.c:68: ERROR: trailing statements should be on next line
arch/parisc/lib/io.c:117: WARNING: braces {} are not necessary for single statement blocks
arch/parisc/lib/io.c:126: WARNING: space prohibited between function name and open parenthesis '('
arch/parisc/lib/io.c:166: WARNING: space prohibited between function name and open parenthesis '('
arch/parisc/lib/io.c:172: ERROR: trailing whitespace
arch/parisc/lib/io.c:175: ERROR: trailing whitespace
arch/parisc/lib/io.c:176: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:179: ERROR: spaces required around that '>=' (ctx:VxV)
arch/parisc/lib/io.c:180: ERROR: trailing whitespace
arch/parisc/lib/io.c:187: WARNING: braces {} are not necessary for single statement blocks
arch/parisc/lib/io.c:191: ERROR: trailing whitespace
arch/parisc/lib/io.c:196: ERROR: spaces required around that '>=' (ctx:VxV)
arch/parisc/lib/io.c:197: ERROR: trailing whitespace
arch/parisc/lib/io.c:204: WARNING: braces {} are not necessary for single statement blocks
arch/parisc/lib/io.c:208: ERROR: trailing whitespace
arch/parisc/lib/io.c:214: ERROR: trailing whitespace
arch/parisc/lib/io.c:218: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:238: WARNING: space prohibited between function name and open parenthesis '('
arch/parisc/lib/io.c:244: ERROR: trailing whitespace
arch/parisc/lib/io.c:247: ERROR: trailing whitespace
arch/parisc/lib/io.c:248: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:251: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:257: ERROR: trailing whitespace
arch/parisc/lib/io.c:260: ERROR: trailing whitespace
arch/parisc/lib/io.c:264: ERROR: trailing whitespace
arch/parisc/lib/io.c:265: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:276: ERROR: trailing whitespace
arch/parisc/lib/io.c:282: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:293: ERROR: trailing whitespace
arch/parisc/lib/io.c:297: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:318: ERROR: "foo * bar" should be "foo *bar"
arch/parisc/lib/io.c:336: WARNING: space prohibited between function name and open parenthesis '('
arch/parisc/lib/io.c:342: ERROR: trailing whitespace
arch/parisc/lib/io.c:345: ERROR: trailing whitespace
arch/parisc/lib/io.c:346: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:349: ERROR: spaces required around that '>=' (ctx:VxV)
arch/parisc/lib/io.c:356: WARNING: braces {} are not necessary for single statement blocks
arch/parisc/lib/io.c:357: ERROR: "(foo*)" should be "(foo *)"
arch/parisc/lib/io.c:360: ERROR: trailing whitespace
arch/parisc/lib/io.c:362: ERROR: trailing whitespace
arch/parisc/lib/io.c:363: ERROR: "(foo*)" should be "(foo *)"
arch/parisc/lib/io.c:366: ERROR: trailing whitespace
arch/parisc/lib/io.c:367: ERROR: spaces required around that '>=' (ctx:VxV)
arch/parisc/lib/io.c:374: WARNING: braces {} are not necessary for single statement blocks
arch/parisc/lib/io.c:378: ERROR: trailing whitespace
arch/parisc/lib/io.c:379: ERROR: trailing whitespace
arch/parisc/lib/io.c:382: ERROR: trailing whitespace
arch/parisc/lib/io.c:386: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:392: ERROR: code indent should use tabs where possible
arch/parisc/lib/io.c:395: WARNING: space prohibited between function name and open parenthesis '('
arch/parisc/lib/io.c:397: ERROR: trailing whitespace
arch/parisc/lib/io.c:408: WARNING: space prohibited between function name and open parenthesis '('
arch/parisc/lib/io.c:414: ERROR: trailing whitespace
arch/parisc/lib/io.c:417: ERROR: trailing whitespace
arch/parisc/lib/io.c:418: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:421: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:427: ERROR: trailing whitespace
arch/parisc/lib/io.c:430: ERROR: trailing whitespace
arch/parisc/lib/io.c:433: ERROR: trailing whitespace
arch/parisc/lib/io.c:434: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:438: WARNING: space prohibited between function name and open parenthesis '('
arch/parisc/lib/io.c:442: WARNING: space prohibited between function name and open parenthesis '('
arch/parisc/lib/io.c:452: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:456: WARNING: space prohibited between function name and open parenthesis '('
arch/parisc/lib/io.c:460: WARNING: space prohibited between function name and open parenthesis '('
arch/parisc/lib/io.c:464: ERROR: trailing whitespace
arch/parisc/lib/io.c:468: ERROR: that open brace { should be on the previous line
arch/parisc/lib/io.c:472: WARNING: space prohibited between function name and open parenthesis '('
arch/parisc/lib/io.c:478: WARNING: space prohibited between function name and open parenthesis '('

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/lib/io.c |  155 ++++++++++++++++++++++----------------------------
 1 files changed, 68 insertions(+), 87 deletions(-)

diff --git a/arch/parisc/lib/io.c b/arch/parisc/lib/io.c
index 7c1406f..c6c9ddb 100644
--- a/arch/parisc/lib/io.c
+++ b/arch/parisc/lib/io.c
@@ -52,7 +52,7 @@ void memcpy_toio(volatile void __iomem *dst, const void *src, int count)
 */
 void memcpy_fromio(void *dst, const volatile void __iomem *src, int count)
 {
-	/* first compare alignment of src/dst */ 
+	/* first compare alignment of src/dst */
 	if ( (((unsigned long)dst ^ (unsigned long)src) & 1) || (count < 2) )
 		goto bytecopy;
 
@@ -114,16 +114,15 @@ void memset_io(volatile void __iomem *addr, unsigned char val, int count)
 		addr += 4;
 		count -= 4;
 	}
-	while (count--) {
+	while (count--)
 		writeb(val, addr++);
-	}
 }
 
 /*
  * Read COUNT 8-bit bytes from port PORT into memory starting at
  * SRC.
  */
-void insb (unsigned long port, void *dst, unsigned long count)
+void insb(unsigned long port, void *dst, unsigned long count)
 {
 	unsigned char *p;
 
@@ -163,60 +162,56 @@ void insb (unsigned long port, void *dst, unsigned long count)
  * the interfaces seems to be slow: just using the inlined version
  * of the inw() breaks things.
  */
-void insw (unsigned long port, void *dst, unsigned long count)
+void insw(unsigned long port, void *dst, unsigned long count)
 {
 	unsigned int l = 0, l2;
 	unsigned char *p;
 
 	p = (unsigned char *)dst;
-	
+
 	if (!count)
 		return;
-	
-	switch (((unsigned long)p) & 0x3)
-	{
+
+	switch (((unsigned long)p) & 0x3) {
 	 case 0x00:			/* Buffer 32-bit aligned */
-		while (count>=2) {
-			
+		while (count >= 2) {
+
 			count -= 2;
 			l = cpu_to_le16(inw(port)) << 16;
 			l |= cpu_to_le16(inw(port));
 			*(unsigned int *)p = l;
 			p += 4;
 		}
-		if (count) {
+		if (count)
 			*(unsigned short *)p = cpu_to_le16(inw(port));
-		}
 		break;
-	
+
 	 case 0x02:			/* Buffer 16-bit aligned */
 		*(unsigned short *)p = cpu_to_le16(inw(port));
 		p += 2;
 		count--;
 		while (count>=2) {
-			
+
 			count -= 2;
 			l = cpu_to_le16(inw(port)) << 16;
 			l |= cpu_to_le16(inw(port));
 			*(unsigned int *)p = l;
 			p += 4;
 		}
-		if (count) {
+		if (count)
 			*(unsigned short *)p = cpu_to_le16(inw(port));
-		}
 		break;
-		
+
 	 case 0x01:			/* Buffer 8-bit aligned */
 	 case 0x03:
 		/* I don't bother with 32bit transfers
 		 * in this case, 16bit will have to do -- DE */
 		--count;
-		
+
 		l = cpu_to_le16(inw(port));
 		*p = l >> 8;
 		p++;
-		while (count--)
-		{
+		while (count--) {
 			l2 = cpu_to_le16(inw(port));
 			*(unsigned short *)p = (l & 0xff) << 8 | (l2 >> 8);
 			p += 2;
@@ -235,35 +230,32 @@ void insw (unsigned long port, void *dst, unsigned long count)
  * but the interfaces seems to be slow: just using the inlined version
  * of the inl() breaks things.
  */
-void insl (unsigned long port, void *dst, unsigned long count)
+void insl(unsigned long port, void *dst, unsigned long count)
 {
 	unsigned int l = 0, l2;
 	unsigned char *p;
 
 	p = (unsigned char *)dst;
-	
+
 	if (!count)
 		return;
-	
-	switch (((unsigned long) dst) & 0x3)
-	{
+
+	switch (((unsigned long) dst) & 0x3) {
 	 case 0x00:			/* Buffer 32-bit aligned */
-		while (count--)
-		{
+		while (count--) {
 			*(unsigned int *)p = cpu_to_le32(inl(port));
 			p += 4;
 		}
 		break;
-	
+
 	 case 0x02:			/* Buffer 16-bit aligned */
 		--count;
-		
+
 		l = cpu_to_le32(inl(port));
 		*(unsigned short *)p = l >> 16;
 		p += 2;
-		
-		while (count--)
-		{
+
+		while (count--) {
 			l2 = cpu_to_le32(inl(port));
 			*(unsigned int *)p = (l & 0xffff) << 16 | (l2 >> 16);
 			p += 4;
@@ -273,14 +265,13 @@ void insl (unsigned long port, void *dst, unsigned long count)
 		break;
 	 case 0x01:			/* Buffer 8-bit aligned */
 		--count;
-		
+
 		l = cpu_to_le32(inl(port));
 		*(unsigned char *)p = l >> 24;
 		p++;
 		*(unsigned short *)p = (l >> 8) & 0xffff;
 		p += 2;
-		while (count--)
-		{
+		while (count--) {
 			l2 = cpu_to_le32(inl(port));
 			*(unsigned int *)p = (l & 0xff) << 24 | (l2 >> 8);
 			p += 4;
@@ -290,12 +281,11 @@ void insl (unsigned long port, void *dst, unsigned long count)
 		break;
 	 case 0x03:			/* Buffer 8-bit aligned */
 		--count;
-		
+
 		l = cpu_to_le32(inl(port));
 		*p = l >> 24;
 		p++;
-		while (count--)
-		{
+		while (count--) {
 			l2 = cpu_to_le32(inl(port));
 			*(unsigned int *)p = (l & 0xffffff) << 8 | l2 >> 24;
 			p += 4;
@@ -315,7 +305,7 @@ void insl (unsigned long port, void *dst, unsigned long count)
  * doing byte reads the "slow" way isn't nearly as slow as
  * doing byte writes the slow way (no r-m-w cycle).
  */
-void outsb(unsigned long port, const void * src, unsigned long count)
+void outsb(unsigned long port, const void *src, unsigned long count)
 {
 	const unsigned char *p;
 
@@ -333,68 +323,64 @@ void outsb(unsigned long port, const void * src, unsigned long count)
  * interfaces seems to be slow: just using the inlined version of the
  * outw() breaks things.
  */
-void outsw (unsigned long port, const void *src, unsigned long count)
+void outsw(unsigned long port, const void *src, unsigned long count)
 {
 	unsigned int l = 0, l2;
 	const unsigned char *p;
 
 	p = (const unsigned char *)src;
-	
+
 	if (!count)
 		return;
-	
-	switch (((unsigned long)p) & 0x3)
-	{
+
+	switch (((unsigned long)p) & 0x3) {
 	 case 0x00:			/* Buffer 32-bit aligned */
-		while (count>=2) {
+		while (count >= 2) {
 			count -= 2;
 			l = *(unsigned int *)p;
 			p += 4;
 			outw(le16_to_cpu(l >> 16), port);
 			outw(le16_to_cpu(l & 0xffff), port);
 		}
-		if (count) {
-			outw(le16_to_cpu(*(unsigned short*)p), port);
-		}
+		if (count)
+			outw(le16_to_cpu(*(unsigned short *)p), port);
 		break;
-	
+
 	 case 0x02:			/* Buffer 16-bit aligned */
-		
-		outw(le16_to_cpu(*(unsigned short*)p), port);
+
+		outw(le16_to_cpu(*(unsigned short *)p), port);
 		p += 2;
 		count--;
-		
-		while (count>=2) {
+
+		while (count >= 2) {
 			count -= 2;
 			l = *(unsigned int *)p;
 			p += 4;
 			outw(le16_to_cpu(l >> 16), port);
 			outw(le16_to_cpu(l & 0xffff), port);
 		}
-		if (count) {
+		if (count)
 			outw(le16_to_cpu(*(unsigned short *)p), port);
-		}
 		break;
-		
-	 case 0x01:			/* Buffer 8-bit aligned */	
+
+	 case 0x01:			/* Buffer 8-bit aligned */
 		/* I don't bother with 32bit transfers
 		 * in this case, 16bit will have to do -- DE */
-		
+
 		l  = *p << 8;
 		p++;
 		count--;
-		while (count)
-		{
+		while (count) {
 			count--;
 			l2 = *(unsigned short *)p;
 			p += 2;
 			outw(le16_to_cpu(l | l2 >> 8), port);
-		        l = l2 << 8;
+			l = l2 << 8;
 		}
 		l2 = *(unsigned char *)p;
-		outw (le16_to_cpu(l | l2>>8), port);
+		outw(le16_to_cpu(l | l2>>8), port);
 		break;
-	
+
 	}
 }
 
@@ -405,41 +391,38 @@ void outsw (unsigned long port, const void *src, unsigned long count)
  *  Performance is important, but the interfaces seems to be slow:
  * just using the inlined version of the outl() breaks things.
  */
-void outsl (unsigned long port, const void *src, unsigned long count)
+void outsl(unsigned long port, const void *src, unsigned long count)
 {
 	unsigned int l = 0, l2;
 	const unsigned char *p;
 
 	p = (const unsigned char *)src;
-	
+
 	if (!count)
 		return;
-	
-	switch (((unsigned long)p) & 0x3)
-	{
+
+	switch (((unsigned long)p) & 0x3) {
 	 case 0x00:			/* Buffer 32-bit aligned */
-		while (count--)
-		{
+		while (count--) {
 			outl(le32_to_cpu(*(unsigned int *)p), port);
 			p += 4;
 		}
 		break;
-	
+
 	 case 0x02:			/* Buffer 16-bit aligned */
 		--count;
-		
+
 		l = *(unsigned short *)p;
 		p += 2;
-		
-		while (count--)
-		{
+
+		while (count--) {
 			l2 = *(unsigned int *)p;
 			p += 4;
-			outl (le32_to_cpu(l << 16 | l2 >> 16), port);
+			outl(le32_to_cpu(l << 16 | l2 >> 16), port);
 			l = l2;
 		}
 		l2 = *(unsigned short *)p;
-		outl (le32_to_cpu(l << 16 | l2), port);
+		outl(le32_to_cpu(l << 16 | l2), port);
 		break;
 	 case 0x01:			/* Buffer 8-bit aligned */
 		--count;
@@ -449,33 +432,31 @@ void outsl (unsigned long port, const void *src, unsigned long count)
 		l |= *(unsigned short *)p << 8;
 		p += 2;
 
-		while (count--)
-		{
+		while (count--) {
 			l2 = *(unsigned int *)p;
 			p += 4;
-			outl (le32_to_cpu(l | l2 >> 24), port);
+			outl(le32_to_cpu(l | l2 >> 24), port);
 			l = l2 << 8;
 		}
 		l2 = *p;
-		outl (le32_to_cpu(l | l2), port);
+		outl(le32_to_cpu(l | l2), port);
 		break;
 	 case 0x03:			/* Buffer 8-bit aligned */
 		--count;
-		
+
 		l = *p << 24;
 		p++;
 
-		while (count--)
-		{
+		while (count--) {
 			l2 = *(unsigned int *)p;
 			p += 4;
-			outl (le32_to_cpu(l | l2 >> 8), port);
+			outl(le32_to_cpu(l | l2 >> 8), port);
 			l = l2 << 24;
 		}
 		l2 = *(unsigned short *)p << 16;
 		p += 2;
 		l2 |= *p;
-		outl (le32_to_cpu(l | l2), port);
+		outl(le32_to_cpu(l | l2), port);
 		break;
 	}
 }
-- 
1.7.1.251.gf80a2

