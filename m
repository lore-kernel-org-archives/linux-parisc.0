From: "Michael S. Zick" <mszick@goquest.com>
Subject: Re: [parisc-linux] uninline in bitops.c as ia64 or sparc64?
Date: Mon, 9 Aug 2004 09:54:08 -0500
Message-ID: <200408090954.08340.mszick@goquest.com>
References: <40C36EFD.6040002@tiscali.be>
	<200407310929.29022.mszick@goquest.com>
	<1091293141.1920.34.camel@mulgrave>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_QA5FBDkgj6Nfe4p"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1091293141.1920.34.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--Boundary-00=_QA5FBDkgj6Nfe4p
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat July 31 2004 11:58, James Bottomley wrote:
> On Sat, 2004-07-31 at 10:29, Michael S. Zick wrote:
> > How about a different algorithm?
> > Say:: 3 * Log_2 (Register Size)
> 
> This algorithm is a more complex form of generic_ffz() in linux/bitops.h
> 
> perhaps we should use generic_ffz as the basis for this?
> 
generic_ffz is defined as integer - is 'integer' the same size
cpu32 and cpu64?  If not, that routine needs a size-conditional
test for the other 32 bits on cpu64.

Here is a suggested fix for include/asm-parisc/bitops.h -

NOTE 1: I have no way to test this - some needs to check my
work.

NOTE 2: I did try to do this on (electronic) pencil and paper -
You can get the pictures at: <www.goquest.com/~mszick>
as: hpbitfinder.ps.bz2

NOTE 3: Same diff is attached as in-lined, just in case my
mail agent trashes it.

Mike

Index: include/asm-parisc/bitops.h
===================================================================
RCS file: /opt/lib/cvs/parisc/include/asm-parisc/bitops.h,v
retrieving revision 1.1.1.1
diff -u -3 -p -r1.1.1.1 bitops.h
--- a/include/asm-parisc/bitops.h	13 Jul 2004 05:40:29 -0000	1.1.1.1
+++ b/include/asm-parisc/bitops.h	9 Aug 2004 14:33:03 -0000
@@ -217,11 +217,16 @@ static __inline__ int test_bit(int nr, c
  *
  * This algorithm avoids branches by making use of nullification.
  * One side effect of "extr" instructions is it sets PSW[N] bit.
- * How PSW[N] (nullify next insn) gets set is determined by the
+ * How PSW[N] (nullify next insn) gets set is determined by the
  * "condition" field (eg "<>" or "TR" below) in the extr* insn.
  * Only the 1st and one of either the 2cd or 3rd insn will get executed.
  * Each set of 3 insn will get executed in 2 cycles on PA8x00 vs 16 or so
  * cycles for each mispredicted branch.
+ *
+ * Provide either a u64 or u32 version based on cpu register size.
+ * Note that the hard coded field indexes depend on cpu register size;
+ * and the extract instruction generates a right-justified result.
+ * The index numbers are hp-bit-position not radix 2 numbers. <msz>
  */

 static __inline__ unsigned long __ffs(unsigned long x)
@@ -229,14 +234,27 @@ static __inline__ unsigned long __ffs(un
 	unsigned long ret;

 	__asm__(
-#if BITS_PER_LONG > 32
+#ifdef __LP64__
 		" ldi       63,%1\n"
 		" extrd,u,*<>  %0,63,32,%%r0\n"
 		" extrd,u,*TR  %0,31,32,%0\n"	/* move top 32-bits down */
 		" addi    -32,%1,%1\n"
+		" extrd,u,*<>  %0,63,16,%%r0\n"
+		" extrd,u,*TR  %0,47,16,%0\n"   /* xxxx0000 -> 0000xxxx */
+		" addi    -16,%1,%1\n"
+		" extrd,u,*<>  %0,63,8,%%r0\n"
+		" extrd,u,*TR  %0,55,8,%0\n"    /* 0000xx00 -> 000000xx */
+		" addi    -8,%1,%1\n"
+		" extrd,u,*<>  %0,63,4,%%r0\n"
+		" extrd,u,*TR  %0,59,4,%0\n"    /* 000000x0 -> 0000000x */
+		" addi    -4,%1,%1\n"
+		" extrd,u,*<>  %0,63,2,%%r0\n"
+		" extrd,u,*TR  %0,61,2,%0\n"    /* 0000000y, 1100b -> 0011b */
+		" addi    -2,%1,%1\n"
+		" extrd,u,*=  %0,63,1,%%r0\n"   /* check last bit */
+		" addi    -1,%1,%1\n"
 #else
 		" ldi       31,%1\n"
-#endif
 		" extru,<>  %0,31,16,%%r0\n"
 		" extru,TR  %0,15,16,%0\n"	/* xxxx0000 -> 0000xxxx */
 		" addi    -16,%1,%1\n"
@@ -251,6 +269,7 @@ static __inline__ unsigned long __ffs(un
 		" addi    -2,%1,%1\n"
 		" extru,=  %0,31,1,%%r0\n"	/* check last bit */
 		" addi    -1,%1,%1\n"
+#endif
 			: "+r" (x), "=r" (ret) );
 	return ret;
 }



--Boundary-00=_QA5FBDkgj6Nfe4p
Content-Type: application/x-bzip2;
  name="bitops.h.diff.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="bitops.h.diff.bz2"

QlpoOTFBWSZTWRqrqgEAAnPfgFgwWn////r13I6//9/yUASeqWTobmM5i52bhiQpiNBo9TTSeU0Q
0zSNPUZDQD0CaHp6JqCUjQmEmpkBo0PUADQAAAAAASg1JT01NkRMDSYQyMNCYAmTCDAIxxkyaMQx
NMBAwJpgjBMTTTQAYQSJJkTEhjVPSj8CmyagaaaT9UzIgB6hgBkPmMrBQQiBj5G2NsG02DRWIWJU
/gc86I79bDxUwch2fiiWTXDgNX803ZppyHECSVSqD9Gh7q8xhqqv8tnzziVSSYJd6CiYz2+fNCIh
FAKHV38mzLZJICf33i+Mb/QgtKYIJIW08bN48oq6NXTq+J2zDoF2FtOEV1WBIJYMdbbdL428T55r
/FzfmrrGeWgxRw7hQ4wwrsCrHt6EEttkfTovpQ37umwZqtIsI65hj0GS4gvSSXrVPNNYqIN0FXKZ
MsZThaUPwcQQ/d+LSyN3TxlLCuaUZbqQ2R2fWz8kXaqX0wptudio+dHvdPISu9hkLkFaoCsO5B2M
SlKDq86W/gPcBISYhfqByyytc6eqV55JVB2piGPkhQgtSOYEXsbktm/RZ4vw8J+/RKdJTLp5SlRr
wMfNmHjHj1YS/MxNlGmXqlpdlEqVrekcMutjeY4iYNNH5c2qXoCIMWst8czblQNHBBeum1jrDsDj
5XFs8XOC3vxCTSIGkeAvKAZjln1sq07bRiabq4lb4FxMDW2eF7KCz33W2yunKTGwuOQvSK53MZRu
kNyI4Nt1ctk7YRWxE64oug0gspUWUycSMIrB7LsnEWOAZRglPiDlAY3CfthQr07q6cWG9JVzKS/w
kacrncnWYb+4GJErQ6gZC85kOlm2IeEG6h5bi61BJ6A2k3Nmy8XxiRG2Ydh+i1rpbbEwaaMy5RYO
mzSHqt3NKmxpQp4dUkDriBnF+tHH9Axf0UruD1Ys2bvksYy3hF42RAph60Pr7TumPA/YgJa2TnXx
ILpmElmZEQLEZYiSINkgSJB7+E0inUgUJKa7JwnevhIYlxlTmX/TfqC414TiWcZJ5FrUJ1rW+Xso
0eZ31aw842TGVtKjKhXZRNt4wNDWDxJFrouHvmjIBQzst4zoIl502goCaBaFbNRhIdi7rDEO9MIG
OSB4icOBmK6gvlkw5qllmZx2WMqsRTvLjWNsoHQX/9nCaWp2l6NEljRZiyGkm1zlMWSoTg3Zzbpy
lpaM0UKYUWkJlirRYRYE8lyKTOQg7pHPouYqRWfVAqoHfAILYI3nkockjZrCtKAh3Ckk32EwTnCF
2hgKoMkEA5shDs4OV4sQwenNqsp3CeyyNjAYMzRgDkCD0gkvt3RGLvAEzo8Ym4dcCQ1Nw1oez4Nc
UEMSRn8zUghaxtuDLUUc3GVqlqQuoRghgpcsQog+u5FGKMRT7otQIrqFqI0mkxnxgqiMmpWQtSLn
wosYrvXyRF61graAVUkwpYvjNU7VES7YrD6EigyhC+B2+dBvIViQ8DVO30CeL1iGR0HlgsgHgsK5
3fafwmkiAl7oBlDdsGZ7sZhjK/uLuSKcKEgNVdUAgA==

--Boundary-00=_QA5FBDkgj6Nfe4p
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_QA5FBDkgj6Nfe4p--
