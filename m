Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gwyn.tux.org (gwyn.tux.org [207.96.122.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id CC8864841
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Feb 2002 13:28:08 -0700 (MST)
Received: (from timball@localhost)
	by gwyn.tux.org (8.9.3/8.9.1) id PAA06591
	for parisc-linux@lists.parisc-linux.org; Tue, 12 Feb 2002 15:28:02 -0500
Date: Tue, 12 Feb 2002 15:28:01 -0500
From: Timothy Ball <timball@tux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020212202801.GX8669@gwyn.tux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] include/asm-parisc/pgalloc.h
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

do { ... } while(0); do not need the trailing semicolon and may lead to
strange side effects. the following patch fixes it.

--timball

--snip--snip--snip--
diff -ruN linux-2.5.4/include/asm-parisc/pgalloc.h linux-2.5.4-fixed/include/asm-parisc/pgalloc.h
--- linux-2.5.4/include/asm-parisc/pgalloc.h    Sun Feb 10 20:50:16 2002
+++ linux-2.5.4-fixed/include/asm-parisc/pgalloc.h  Mon Feb 11 18:35:43 2002
@@ -120,7 +120,7 @@
 #define flush_tlb() do { \
         flush_data_tlb(); \
    flush_instruction_tlb(); \
-} while(0);
+} while(0)
 
 #define flush_tlb_all()    flush_tlb() /* XXX p[id]tlb */



-- 
	GPG key available on pgpkeys.mit.edu
pub  1024D/511FBD54 2001-07-23 Timothy Lu Hu Ball <timball@tux.org>
Key fingerprint = B579 29B0 F6C8 C7AA 3840  E053 FE02 BB97 511F BD54
