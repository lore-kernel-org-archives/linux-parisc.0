Return-Path: <ww@STYX.ORG>
Received: from STYX.ORG (styx.org [204.138.67.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id B20CA4854
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  4 Mar 2004 12:06:44 -0700 (MST)
Date: Thu, 4 Mar 2004 14:06:43 -0500
From: William Waites <parisc@lists.styx.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040304190643.GC19629@styx.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] lstrncpy_from_user symbol not exported
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I tried sending this to submit@bugs.parisc-linux.org
but it bounced...

----- Forwarded message from William Waites <ww@styx.org> -----

Date: Thu, 4 Mar 2004 13:59:49 -0500
From: William Waites 
Subject: lstrncpy_from_user symbol not exported
To: submit@bugs.parisc-linux.org

Hello, 

I am running LiS on Linux/parsic. The streams kernel
module uses the strncpy_from_user function which on
parisc is macro that calls lstrncpy_from_user. This
function is not exported by the kernel, so the module
gets an unresolved symbol. The following patch fixes
this.

Index: arch/parisc/kernel/parisc_ksyms.c
===================================================================
RCS file: /var/cvs/linux-2.4/arch/parisc/kernel/parisc_ksyms.c,v
retrieving revision 1.49
diff -u -r1.49 parisc_ksyms.c
--- a/arch/parisc/kernel/parisc_ksyms.c 17 Jan 2004 06:40:11 -0000      1.49
+++ b/arch/parisc/kernel/parisc_ksyms.c 4 Mar 2004 18:53:07 -0000
@@ -110,6 +110,7 @@
 EXPORT_SYMBOL(lcopy_from_user);
 EXPORT_SYMBOL(lstrnlen_user);
 EXPORT_SYMBOL(lclear_user);
+EXPORT_SYMBOL(lstrncpy_from_user);

 #ifndef __LP64__
 /* Needed so insmod can set dp value */

-- 
/~\  The ASCII Ribbon Campaign
\ /    No HTML/RTF in email
 X     No Word docs in email
/ \  Respect for open standards
