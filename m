From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: Yet another inline asm worry: mtsp() macro (and may be other)?
Date: Fri, 20 Jun 2008 15:01:43 +0100
Message-ID: <K2RLMV$5D6B8CC1910705073A720C99B9A05EBA@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "linux-parisc" <linux-parisc@vger.kernel.org>,
	"deller" <deller@gmx.de>, "grundler" <grundler@parisc-linux.org>,
	"kyle" <kyle@mcmartin.ca>
To: "grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Thu, Jun 19, 2008 at 12:40:30PM +0100, Joel Soete wrote:
> > Hello all,
> > 
[snip]
> > And the wonder is that my system d380 is even booting and running despite this
> > lake???
> > 
> > That said with gcc-4.3, I find well this code iin the 2 functions.
> > And here commes my worry about mtsp() macro: here is the resulting code with
> > gcc-4.3:

Well I was hopping that would be the fix of my perf test but not ;_(
(after a bit less then an hour of tar/rm test the fs became again corrupted)

> > 00000000 <ccio_map_sg>:
> > [snip]
> > __ 1a0:   34 1a 00 00     ldi 0,r26__
> >  1a4:   20 a0 02 00     ldil L%10000000,r5
> >  1a8:   8e 80 61 28     cmpib,> 0,r20,244 <ccio_map_sg+0x244>
> >  1ac:   20 40 0e 01     ldil L%-10000000,rp
> >  1b0:   86 c0 21 88     cmpib,= 0,r22,27c <ccio_map_sg+0x27c>
> >  1b4:   34 19 00 00     ldi 0,r25
> >  1b8:   0f e0 10 9c     ldw 0(r31),ret0
> >  1bc:   0d 80 10 94     ldw 0(r12),r20
> >  1c0:   d7 80 1c 1e     depwi 0,31,2,ret0
> >  1c4:   4b b3 00 20     ldw 10(ret1),r19
> >  1c8:   0a 9c 04 1c     sub ret0,r20,ret0
> >  1cc:   0f f0 10 95     ldw 8(r31),r21
> >  1d0:   d3 9c 1f 45     extrw,s ret0,26,27,ret0
> >  1d4:   0a b3 0a 13     add,l r19,r21,r19
> >  1d8:   d7 9c 09 8c     depw,z ret0,19,20,ret0
> >  1dc:   0f e8 10 94     ldw 4(r31),r20
> >  1e0:   08 bc 0a 1c     add,l ret0,r5,ret0
> >  1e4:   6b b3 00 20     stw r19,10(ret1)
> >  1e8:   0a b9 0a 15     add,l r25,r21,r21
> >  1ec:   0a 9c 0a 14     add,l ret0,r20,r20
> > __ 1f0:   00 1a 58 20     mtsp r26,sr1  __
> >  1f4:   08 54 0a 1c     add,l r20,rp,ret0
> >  1f8:   d7 8e 0c 14     depw r14,31,12,ret0
> >  1fc:   0e dc 12 88     stw ret0,4(r22)
> >  200:   06 80 53 13     lci r0(sr1,r20),r19
> >  204:   d2 73 1a 74     extrw,u r19,19,12,r19
> >  208:   08 1a 02 5c     copy r26,ret0
> >  20c:   d7 93 0e 14     depw r19,15,12,ret0
> >  210:   0e dc 12 80     stw ret0,0(r22)
> >  214:   06 c0 12 80     fdc r0(r22)
> >  218:   00 00 04 00     sync
> > [snip]
> > 
> > My worry is the number of insn between the ldi 0,r26 and the mtsp r26,sr1.
> > 
> > Here, I supposed it's harmless but may be different in other critical path?
> > 
> > Wouldn't it be interesting (if possible) to insure that the load of the reg
> > and mtsp stay close together? (or may be simply detect the case of a const
== 0?)
> > 
Well I tried something:
@@ -103,10 +108,23 @@
 	cr;				\
 })
 
-#define mtsp(gr, cr) \
-	__asm__ __volatile__("mtsp %0,%1" \
-		: /* no outputs */ \
-		: "r" (gr), "i" (cr) : "memory")
+#define mtsp(lval, i_sr)					\
+{								\
+	if (lval) {						\
+		unsigned long reg = (unsigned long)(lval);	\
+		__asm__ __volatile__(				\
+			"mtsp %0, %%sr%1"			\
+			: /* no outputs */			\
+			: "r" (reg), "i" (i_sr)			\
+			: "memory");				\
+	} else {						\
+		__asm__ __volatile__(				\
+			"mtsp %%r0, %%sr%0"			\
+			: /* no outputs */			\
+			: "i" (i_sr)				\
+			: "memory");				\
+	};							\
+}
 
that does well the drill for ccio-dma driver but else where (memcpy or cache)
it looks worse then the original, so get rid of this idea.

I will go back to sleep on this issue some more month ;<)

Tx again to all for help,
    J.




