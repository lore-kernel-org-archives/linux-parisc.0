Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 025DE482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jul 2003 10:21:07 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157024161.dialin.heagmedianet.de [213.157.24.161])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.9/8.12.7) with ESMTP id h69GG7NW013935
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Wed, 9 Jul 2003 18:16:12 +0200
Message-ID: <3F0C3E70.1060200@hrzpub.tu-darmstadt.de>
Date: Wed, 09 Jul 2003 18:10:24 +0200
From: =?ISO-8859-15?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------000508040007080302070206"
Subject: [parisc-linux] Spelling mistake in unaligned.c
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

This is a multi-part message in MIME format.
--------------000508040007080302070206
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8bit

Hi there!
I found a spelling mistake when I compiled the kernel 2.4.21-pa2 on a 
C360. Here is a patch. Can someone, who has writeaccess to CVS,  apply 
it and put it into CVS?
Thanks!
Rüdiger
   

--------------000508040007080302070206
Content-Type: text/plain;
 name="patch.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch.diff"

Index: arch/parisc/kernel/unaligned.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/unaligned.c,v
retrieving revision 1.16
diff -u -p -r1.16 unaligned.c
--- arch/parisc/kernel/unaligned.c	9 Jul 2003 05:15:20 -0000	1.16
+++ arch/parisc/kernel/unaligned.c	9 Jul 2003 13:48:22 -0000
@@ -576,7 +576,7 @@ void handle_unaligned(struct pt_regs *re
 	{
 	case OPCODE_FLDD_L:
 		flop=1;
-		ret = emualate_ldd(regs,R2(regs->iir),1);
+		ret = emulate_ldd(regs,R2(regs->iir),1);
 		break;
 	case OPCODE_FSTD_L:
 		flop=1;

--------------000508040007080302070206--
