Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA17060
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Sep 2000 20:23:40 -0600
Received: from home.com ([24.3.245.88]) by mail.rdc1.ne.home.com
          (InterMail vM.4.01.03.00 201-229-121) with ESMTP
          id <20000902022337.NEBU5134.mail.rdc1.ne.home.com@home.com>
          for <parisc-linux@thepuffingroup.com>;
          Fri, 1 Sep 2000 19:23:37 -0700
Message-ID: <39B065B8.90A2C038@home.com>
Date: Fri, 01 Sep 2000 21:28:08 -0500
From: Matthew Hudson <mhudson@home.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [Fwd: 2.4.0 do_fork() change, all architectures - take 2]
List-ID: <linux-parisc.vger.kernel.org>



-------- Original Message --------
Subject: 2.4.0 do_fork() change, all architectures - take 2
Resent-Date: Sat, 2 Sep 2000 04:19:10 +0200 (MET DST)
Resent-From: linux-m68k@phil.uni-sb.de
Date: Sat, 02 Sep 2000 13:18:46 +1100
From: Keith Owens <kaos@ocs3.ocs-net>
To: linux-m68k@phil.uni-sb.de

------- Blind-Carbon-Copy

X-Mailer: exmh version 2.1.1 10/15/1999
From: Keith Owens <kaos@ocs.com.au>
To: linux-kernel@vger.kernel.org
Subject: 2.4.0 do_fork() change, all architectures - take 2
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 02 Sep 2000 13:18:46 +1100
Message-ID: <8893.967861126@ocs3.ocs-net>

DaveM pointed out that my 2.4.0-test8-pre1 do_fork patch would generate
better sparc assembler if the extra parameter to do_fork was added at
the end instead of in the middle.  So change all
do_fork(flags,sp,0,&regs)
to do_fork(flags,sp,&regs,0);

I'm not going to mail the complete patch again, you can get it from
ftp://ftp.ocs.com.au/pub/do_fork-2.4.0-test8-take2.gz.  The only
significant difference is this bit to IA64, untested.

Index: 0-test8-pre1.1/arch/ia64/kernel/entry.S
- --- 0-test8-pre1.1/arch/ia64/kernel/entry.S Tue, 15 Aug 2000 17:50:48
+1000 kaos (linux-2.4/c/c/16_entry.S 1.3.1.1.1.2 644)
+++ 0-test8-pre1.2(w)/arch/ia64/kernel/entry.S Sat, 02 Sep 2000 12:49:16
+1100 kaos (linux-2.4/c/c/16_entry.S 1.3.1.1.1.2 644)
@@ -68,8 +68,8 @@
 	mov loc1=r16				// save ar.pfs across do_fork
 	UNW(.body)
 	mov out1=in1
- -	mov out2=in2
- -	adds out3=IA64_SWITCH_STACK_SIZE+16,sp	// out3 = &regs
+	mov out3=in2
+	adds out2=IA64_SWITCH_STACK_SIZE+16,sp	// out2 = &regs
 	mov out0=in0				// out0 = clone_flags
 	br.call.sptk.few rp=do_fork
 .ret1:	UNW(.restore sp)
@@ -87,8 +87,8 @@
 	mov loc1=r16				// save ar.pfs across do_fork
 	UNW(.body)
 	mov out1=in1
- -	mov out2=0
- -	adds out3=IA64_SWITCH_STACK_SIZE+16,sp	// out3 = &regs
+	mov out3=0
+	adds out2=IA64_SWITCH_STACK_SIZE+16,sp	// out2 = &regs
 	mov out0=in0				// out0 = clone_flags
 	br.call.sptk.few rp=do_fork
 .ret2:	UNW(.restore sp)
Index: 0-test8-pre1.1/arch/ia64/ia32/ia32_entry.S
- --- 0-test8-pre1.1/arch/ia64/ia32/ia32_entry.S Tue, 15 Aug 2000
17:50:48 +1000 kaos (linux-2.4/c/c/25_ia32_entry 1.3.1.1 644)
+++ 0-test8-pre1.2(w)/arch/ia64/ia32/ia32_entry.S Sat, 02 Sep 2000
12:49:58 +1100 kaos (linux-2.4/c/c/25_ia32_entry 1.3.1.1 644)
@@ -91,8 +91,8 @@
 	UNW(.body)
 
 	mov out1=0
- -	mov out2=0
- -	adds out3=IA64_SWITCH_STACK_SIZE+16,sp
+	mov out3=0
+	adds out2=IA64_SWITCH_STACK_SIZE+16,sp	// out2 = &regs
 	br.call.sptk.few rp=do_fork
 .ret3:	mov ar.pfs=loc1
 	UNW(.restore sp)


------- End of Blind-Carbon-Copy
