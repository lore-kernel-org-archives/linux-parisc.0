From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] bitops.h: fls(unsigned long )
Date: Mon, 23 Aug 2004 18:50:28 +0000
Message-ID: <412A3C74.9000903@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
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

Hi all,

As promised (a year ago now; shame on me :( ), here is a first draft of fls(unsigned long) thanks to help of "Michael S. Zick":
--- linux-2.6.8.1-pa7/include/asm-parisc/bitops.h.Orig  2004-08-15 20:27:42.000000000 +0200
+++ linux-2.6.8.1-pa7/include/asm-parisc/bitops.h       2004-08-23 17:09:12.190000000 +0200
@@ -273,31 +273,38 @@
   * fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
   */

-static __inline__ int fls(int x)
+static __inline__ int fls(unsigned long x)
  {
-       int ret;
-       if (!x)
-               return 0;
+       unsigned long ret;

         __asm__(
-       "       ldi             1,%1\n"
-       "       extru,<>        %0,15,16,%%r0\n"
-       "       zdep,TR         %0,15,16,%0\n"          /* xxxx0000 */
-       "       addi            16,%1,%1\n"
-       "       extru,<>        %0,7,8,%%r0\n"
-       "       zdep,TR         %0,23,24,%0\n"          /* xx000000 */
-       "       addi            8,%1,%1\n"
-       "       extru,<>        %0,3,4,%%r0\n"
-       "       zdep,TR         %0,27,28,%0\n"          /* x0000000 */
-       "       addi            4,%1,%1\n"
-       "       extru,<>        %0,1,2,%%r0\n"
-       "       zdep,TR         %0,29,30,%0\n"          /* y0000000 (y&3 = 0) */
-       "       addi            2,%1,%1\n"
-       "       extru,=         %0,0,1,%%r0\n"
-       "       addi            1,%1,%1\n"              /* if y & 8, add 1 */
+#ifdef __LP64__
+               " ldi           64,%1\n"
+               " extrd,u,*=    %0,31,32,%%r0\n"
+               " extrd,u,*TR   %0,31,32,%0\n"  /* move top 32-bits down */
+               " addi          -32,%1,%1\n"
+#else
+               " ldi           32,%1\n"
+#endif
+               " extru,=       %0,15,16,%%r0\n"
+               " extru,TR      %0,15,16,%0\n"  /* xxxx0000 -> 0000xxxx */
+               " addi          -16,%1,%1\n"
+               " extru,=       %0,23,8,%%r0\n"
+               " extru,TR      %0,23,8,%0\n"   /* 0000xx00 -> 000000xx */
+               " addi          -8,%1,%1\n"
+               " extru,=       %0,27,4,%%r0\n"
+               " extru,TR      %0,27,4,%0\n"   /* 000000x0 -> 0000000x */
+               " addi          -4,%1,%1\n"
+               " extru,=       %0,29,2,%%r0\n"
+               " extru,TR      %0,29,2,%0\n"   /* 0000000y, 1100b -> 0011b */
+               " addi          -2,%1,%1\n"
+               " extru,=       %0,30,1,%%r0\n"
+               " extru,TR      %0,30,1,%0\n"   /* 0000000z, 10b -> 01b */
+               " addi          -1,%1,%1\n"
+               " extru,<>      %0,31,1,%%r0\n" /* check last bit */
+               " addi          -1,%1,%1\n"
                 : "+r" (x), "=r" (ret) );
