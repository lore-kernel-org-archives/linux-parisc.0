From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Same pb on b2k 64bit + 2.6.11-rc2-pa0 [Was: [parisc-linux]
	2.6.11-rc3-pa3 smp "Segmentation fault" but not up]
Date: Tue, 25 Jan 2005 14:56:22 +0100
Message-ID: <41DE61B8000059BA@mail-8-bnl.mail.tiscali.sys>
References: <41E9B61A.5060204@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: Matthew Wilcox <matthew@wil.cx>,
 List Parisc <parisc-linux@parisc-linux.org>
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41E9B61A.5060204@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Grant,
> 
[...]
> > My suspicion is the prefetching might be causing problems since it's
going
> > past the end of the page. The kernel tmp alias pages might be causing=

problems
> > since we don't flush past the end of those. (Or something like that).=

> > 
> sorry I didn't have yet understand all details of prefetching
> 
> > Can you remove only the prefetching in that algorithm?
> > 
> Yes, I did and already run one occurence of the loop without pb, .. so
we
> have to be patient to see if first mentioned pb (failures 
> after some loop occurence: about 50 last time) :-)
> 
mmm, I was ongoing to forget why the n was looping on a kernel's build wh=
en
the b2k panic due to the same pb with lastest 2.6.11-rc2-pa0 (+workaround=
):
patst005 login: Backtrace:
 [<000000001017cd00>] do_wp_page+0x250/0x950
 [<000000001017ee14>] handle_mm_fault+0x1b4/0x1e0
 [<0000000010110ec4>] do_page_fault+0x2bc/0x360
 [<000000001011299c>] handle_interruption+0x34c/0x748
 [<0000000010107094>] intr_check_sig+0x0/0xc


Kernel Fault: Code=3D15 regs=3D000000001d68c540 (Addr=3D0000000020000000)=

      
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001110011100001111 Not tainted
r00-03  0000000000000000 0000000000000000 000000001017cd00 0000000010a0df=
c8
r04-07  00000000105e2020 000000001d874000 0000000010983960 000000000007e2=
b0
r08-11  000000001d71cad0 000000001e7e9c00 000000000ffffb25 000000001d4043=
f0
r12-15  0000000010983960 000000001d8dc000 0000000000000001 000000000006a4=
04
r16-19  000000001d432740 000000000006a404 000000000006b404 00000000000000=
00
r20-23  0000000000000000 0000000000000000 0000000000000000 00000000000000=
00
r24-27  00000000000000d2 0000000020000000 000000001d875000 00000000105e20=
20
r28-31  0000000010983960 000000001d68c510 000000001d68c540 00000000000000=
20
sr0-3   0000000000429800 0000000000000000 0000000000000000 00000000004298=
00
sr4-7   0000000000000000 0000000000000000 0000000000000000 00000000000000=
00

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000101012c4 0000000010=
1012c8
 IIR: 0f2010d3    ISR: 0000000000000000  IOR: 0000000020000000
 CPU:        0   CR30: 000000001d68c000 CR31: 00000000105a0000
 ORIG_R28: 00000000103e3e68
 IAOQ[0]: copy_user_page_asm+0xa4/0xb0
 IAOQ[1]: copy_user_page_asm+0xa8/0xb0
 RP(r2): do_wp_page+0x250/0x950
Kernel panic - not syncing: Kernel Fault

I so applied the same work around:
--- arch/parisc/kernel/pacache.S.Orig   2005-01-25 13:44:26.000000000 +01=
00
+++ arch/parisc/kernel/pacache.S        2005-01-25 13:44:55.000000000 +01=
00
@@ -306,13 +306,18 @@
 
        ldd             0(%r25), %r19           /* bundle 1 */
        ldi             32, %r1                 /* PAGE_SIZE/128 =3D=3D 3=
2 */
+
+#if    0       /* Comment out prefetching awaiting better fix */
        ldw             64(%r25), %r0           /* prefetch 1 cacheline a=
head
*/
        ldw             128(%r25), %r0          /* prefetch 2 */
+#endif
 
 1:     ldd             8(%r25), %r20
+#if    0       /* Comment out prefetching awaiting better fix */
        ldw             192(%r25), %r0          /* prefetch 3 */
        ldw             256(%r25), %r0          /* prefetch 4 */
        nop     /* pad to preserve alignment */
+#endif
 
        ldd             16(%r25), %r21          /* bundle 2 */
        ldd             24(%r25), %r22
=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=3D=3D=3D=3D

which help too

(I ran the build kernel loop on the smp n4k during a week: 612 runs amoun=
g
111 failed because of various page_fault :-)

Thanks,
Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
