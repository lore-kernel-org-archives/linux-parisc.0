From: Ivar <orskaug@stud.ntnu.no>
Subject: Re: [parisc-linux] Firefox/Mozilla patches
Date: Sat, 18 Dec 2004 00:58:40 +0100 (MET)
Message-ID: <Pine.GSO.4.58.0412180034280.1196@panter.stud.ntnu.no>
References: <200412172238.iBHMc3sL017678@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412172238.iBHMc3sL017678@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Ok, here it comes - the patches are against firefox 1.0 (release),
although I believe any recent release will work.

apply executing

patch -d ./mozilla/xpcom/reflect/xptcall/src/md/unix/ < <whatever filename of the patch>

in the directory you extracted the Firefox tarball.

You will also need a .mozconfig file before building. Mine contains the
following (might not work for you, these are not "normal" parameters):

export MOZ_PHOENIX=1
mk_add_options MOZ_PHOENIX=1

ac_add_options --disable-ldap
ac_add_options --disable-mailnews
ac_add_options --enable-extensions=cookie,xml-rpc,xmlextras,pref,transformiix,universalchardet,webservices,inspector,gnomevfs,negotiateauth
ac_add_options --enable-crypto
ac_add_options --disable-composer
ac_add_options --enable-single-profile
ac_add_options --disable-profilesharing
ac_add_options --enable-optimize=-O2
ac_add_options --disable-debug
ac_add_options --enable-static
ac_add_options --disable-shared
ac_add_options --disable-tests

ac_add_options --enable-default-toolkit=gtk2
ac_add_options --enable-freetype2

mk_add_options MOZ_OBJDIR=/usr/tmp

Remeber to export MOZCONFIG=<path to your .mozconfig file> before
executing

make -f client.mk build

in the mozilla directory

More information on builing Firefox is available on the mozilla.org
site.

Please note that this patch is VERY preliminary - thus, any feedbak is
welcome,


diff -N -u ./mozilla/xpcom/reflect/xptcall/src/md/unix/Makefile.in /home/user/mozilla/xpcom/reflect/xptcall/src/md/unix/Makefile.in
--- ./mozilla/xpcom/reflect/xptcall/src/md/unix/Makefile.in	2004-04-22 22:50:05.000000000 +0200
+++ /home/user/mozilla/xpcom/reflect/xptcall/src/md/unix/Makefile.in	2004-12-18 00:00:29.807917680 +0100
@@ -167,6 +167,19 @@
 endif
 endif

+#
+# Linux/HPPA/GCC
+#
+ifeq ($(OS_ARCH),Linux)
+ifeq ($(OS_TEST), parisc)
+ifeq ($(CC),gcc)
+CPPSRCS		:= xptcinvoke_pa32.cpp xptcstubs_pa32.cpp
+ASFILES		:= xptcstubs_asm_parisc_linux.s
xptcinvoke_asm_parisc_linux.s
+endif
+endif
+endif
+
+
 ######################################################################
 # M68k
 ######################################################################
diff -N -u ./mozilla/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_asm_parisc_linux.s home/user/mozilla/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_asm_parisc_linux.s
--- ./mozilla/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_asm_parisc_linux.s	1970-01-01 01:00:00.000000000 +0100
+++ /home/user/mozilla/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_asm_parisc_linux.s	2004-12-17 00:00:10.000000000 +0100
@@ -0,0 +1,128 @@
+
+	.LEVEL 1.1
+	.text
+	.align 4
+
+framesz:
+	.equ 128
+
+; XPTC_InvokeByIndex(nsISuppots* that, PRUint32 methodIndex,
+;   PRUint32 paramCount, nsXPTCVariant* params);
+
+.globl XPTC_InvokeByIndex
+	.type XPTC_InvokeByIndex, @function
+
+
+XPTC_InvokeByIndex:
+  	.PROC
+	.CALLINFO FRAME=72, CALLER,SAVE_RP, SAVE_SP, ENTRY_GR=3
+	.ENTRY
+
+ ; frame marker takes 48 bytes,
+ ; register spill area takes 8 bytes,
+ ; local stack area takes 72 bytes result in 128 bytes total
+
+        STW          %rp,-20(%sp)
+        STW,MA       %r3,128(%sp)
+
+        LDO     -framesz(%r30),%r28
+        STW     %r28,-4(%r30)       ; save previous sp
+        STW     %r19,-32(%r30)
+
+        STW     %r26,-36-framesz(%r30)  ; save argument registers in
+        STW     %r25,-40-framesz(%r30)  ; in PREVIOUS frame
+        STW     %r24,-44-framesz(%r30)  ;
+        STW     %r23,-48-framesz(%r30)  ;
+
+;	B,L     .+8,%r2
+;	ADDIL   L'invoke_count_bytes-$PIC_pcrel$1+4,%r2,%r1
+;    ;    LDO     R'invoke_count_bytes-$PIC_pcrel$2+8(%r1),%r1
+;$PIC_pcrel$1
+;        LDSID   (%r1),%r31
+;$PIC_pcrel$2
+;        MTSP    %r31,%sr0
+
+	.CALL   ARGW0=GR,ARGW1=GR,ARGW2=GR ;in=24,25,26;out=28
+        BL    invoke_count_bytes,%r31
+        COPY    %r31,%r2
+
+        CMPIB,>=        0,%r28, .+76
+        COPY    %r30,%r3            ; copy stack ptr to saved stack ptr
+        ADD     %r30,%r28,%r30      ; extend stack frame
+        LDW     -4(%r3),%r28        ; move frame
+        STW     %r28,-4(%r30)
+        LDW     -8(%r3),%r28
+        STW     %r28,-8(%r30)
+        LDW     -12(%r3),%r28
+        STW     %r28,-12(%r30)
+        LDW     -16(%r3),%r28
+        STW     %r28,-16(%r30)
+        LDW     -20(%r3),%r28
+        STW     %r28,-20(%r30)
+        LDW     -24(%r3),%r28
+        STW     %r28,-24(%r30)
+        LDW     -28(%r3),%r28
+        STW     %r28,-28(%r30)
+        LDW     -32(%r3),%r28
+        STW     %r28,-32(%r30)
+
+        LDO     -40(%r30),%r26         ; load copy address
+        LDW     -44-framesz(%r3),%r25  ; load rest of 2 arguments
+        LDW     -48-framesz(%r3),%r24  ;
+
+        LDW     -32(%r30),%r19 ; shared lib call destroys r19; reload
+;        B,L     .+8,%r2
+;        ADDIL   L'invoke_copy_to_stack-$PIC_pcrel$3+4,%r2,%r1
+;        LDO     R'invoke_copy_to_stack-$PIC_pcrel$4+8(%r1),%r1
+;$PIC_pcrel$3
+;        LDSID   (%r1),%r31
+;$PIC_pcrel$4
+;        MTSP    %r31,%sr0
+        .CALL   ARGW0=GR,ARGW1=GR,ARGW2=GR ;in=24,25,26
+        BL    invoke_copy_to_stack,%r31
+        COPY    %r31,%r2
+
+        LDO     -48(%r30),%r20
+        EXTRW,U,= %r28,31,1,%r22
+        FLDD    0(%r20),%fr7  ; load double arg 1
+        EXTRW,U,= %r28,30,1,%r22
+        FLDW    8(%r20),%fr5L ; load float arg 1
+        EXTRW,U,= %r28,29,1,%r22
+        FLDW    4(%r20),%fr6L ; load float arg 2
+        EXTRW,U,= %r28,28,1,%r22
+        FLDW    0(%r20),%fr7L ; load float arg 3
+
+        LDW     -36-framesz(%r3),%r26  ; load ptr to 'that'
+        LDW     -40(%r30),%r25  ; load the rest of dispatch argument registers
+        LDW     -44(%r30),%r24
+        LDW     -48(%r30),%r23
+
+        LDW     -36-framesz(%r3),%r20  ; load vtable addr
+        LDW     -40-framesz(%r3),%r28  ; load index
+        LDW     0(%r20),%r20    ; follow vtable
+;        LDO     0(%r20),%r20   ; offset vtable by 16 bytes (g++: 8, aCC: 16)
+        SH2ADDL %r28,%r20,%r28  ; add 4*index to vtable entry
+        LDW     0(%r28),%r22    ; load vtable entry
+
+;        B,L     .+8,%r2
+;        ADDIL   L'$$dyncall_external-$PIC_pcrel$5+4,%r2,%r1
+;        LDO     R'$$dyncall_external-$PIC_pcrel$6+8(%r1),%r1
+;$PIC_pcrel$5
+;        LDSID   (%r1),%r31
+;$PIC_pcrel$6
+;        MTSP    %r31,%sr0
+        .CALL ARGW0=GR,ARGW1=GR,ARGW2=GR,ARGW3=GR,RTNVAL=GR ;in=22-26;out=28;
+        BL    $$dyncall,%r31
+        COPY    %r31,%r2
+
+        LDW     -32(%r30),%r19
+        COPY    %r3,%r30              ; restore saved stack ptr
+
+        LDW          -148(%sp),%rp
+        LDWM       -128(%sp),%r3
+	BV,N             (%rp)
+	NOP
+   .EXIT
+  .PROCEND  ;in=23,24,25,26;
+  .SIZE XPTC_InvokeByIndex, .-XPTC_InvokeByIndex
+
diff -N -u ./mozilla/xpcom/reflect/xptcall/src/md/unix/xptcstubs_asm_parisc_linux.s /home/user/mozilla/xpcom/reflect/xptcall/src/md/unix/xptcstubs_asm_parisc_linux.s
--- mozilla/xpcom/reflect/xptcall/src/md/unix/xptcstubs_asm_parisc_linux.s	1970-01-01 01:00:00.000000000 +0100
+++ /home/user/mozilla/xpcom/reflect/xptcall/src/md/unix/xptcstubs_asm_parisc_linux.s	2004-12-16 23:59:59.000000000 +0100
@@ -0,0 +1,73 @@
+        .LEVEL  1.1
+	.TEXT
+	.ALIGN 4
+
+curframesz:
+	.EQU 128
+
+
+; SharedStub has stack size of 128 bytes
+
+lastframesz:
+	.EQU 64
+
+; the StubN C++ function has a small stack size of 64 bytes
+
+
+.globl SharedStub
+	.type SharedStub, @function
+
+SharedStub:
+        .PROC
+        .CALLINFO CALLER,FRAME=80,SAVE_RP
+
+  .ENTRY
+        STW     %rp,-20(%sp)
+        LDO     128(%sp),%sp
+
+        STW     %r19,-32(%r30)
+        STW     %r26,-36-curframesz(%r30) ; save arg0 in previous frame
+
+        LDO     -80(%r30),%r28
+        FSTD,MA %fr5,8(%r28)   ; save darg0
+        FSTD,MA %fr7,8(%r28)   ; save darg1
+        FSTW,MA %fr4L,4(%r28)  ; save farg0
+        FSTW,MA %fr5L,4(%r28)  ; save farg1
+        FSTW,MA %fr6L,4(%r28)  ; save farg2
+        FSTW,MA %fr7L,4(%r28)  ; save farg3
+
+        ; Former value of register 26 is already properly saved by StubN,
+        ; but register 25-23 are not because of the arguments mismatch
+        STW     %r25,-40-curframesz-lastframesz(%r30) ; save r25
+        STW     %r24,-44-curframesz-lastframesz(%r30) ; save r24
+        STW     %r23,-48-curframesz-lastframesz(%r30) ; save r23
+        COPY    %r26,%r25                             ; method index is arg1
+        LDW     -36-curframesz-lastframesz(%r30),%r26 ; self is arg0
+        LDO     -40-curframesz-lastframesz(%r30),%r24 ; normal args is arg2
+        LDO     -80(%r30),%r23                        ; floating args is arg3
+
+;       BL      .+8,%r2
+;       ADDIL   L'PrepareAndDispatch-$PIC_pcrel$0+4,%r2
+;        LDO     R'PrepareAndDispatch-$PIC_pcrel$1+8(%r1),%r1
+;$PIC_pcrel$0
+;        LDSID   (%r1),%r31
+;$PIC_pcrel$1
+;        MTSP    %r31,%sr0
+        .CALL   ARGW0=GR,ARGW1=GR,ARGW2=GR,ARGW3=GR,RTNVAL=GR ;in=23-26;out=28;
+        BL     PrepareAndDispatch, %r31
+        COPY    %r31,%r2
+
+        LDW     -32(%r30),%r19
+
+        LDW     -148(%sp),%rp
+        LDO     -128(%sp),%sp
+
+
+	BV,N     (%rp)
+	NOP
+	NOP
+
+	.EXIT
+        .PROCEND        ;in=26;out=28;
+
+	.SIZE SharedStub, .-SharedStub




On Fri, 17 Dec 2004, John David Anglin wrote:

> > Anyway, after applying these modifications Firefox 1.0 runs nicely on my
> > C3000. If  these issues are not resolved in the apt versions of
> > mozilla/firefox, I will submit my patches,
>
> Awesome!  Could you post your patch.
>
> Dave
> --
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
