Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 526F14829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Aug 2002 23:55:34 -0600 (MDT)
Date: Fri, 16 Aug 2002 07:54:04 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Matthew Wilcox <willy@debian.org>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.44.0208160747470.18884-100000@gfrw1044.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] db3 patch for Linux/HPPA
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

Hi Matthew,

this fixes a problem with db3 mutexes. Problem is in 
__db_tas_mutex_init(). If MUTEX_INIT returns non-zero value, mutexp->spins 
doesn't get initialized and later __db_tas_mutex_lock loops without ever 
trying to aquire the lock (as spins is zero).

diff -urN db-3.2.9/include/mutex.h db-3.2.9.new/include/mutex.h
--- db-3.2.9/include/mutex.h    Sun Jun 23 16:34:28 2002
+++ db-3.2.9.new/include/mutex.h        Sun Jun 23 16:33:38 2002
@@ -413,7 +413,7 @@
        __r & 1;                                                        \
 })

-#define        MUTEX_UNSET(tsl)        (*(tsl) = -1)
+#define        MUTEX_UNSET(tsl)        (!(*(tsl) = -1))
 #define        MUTEX_INIT(tsl)         MUTEX_UNSET(tsl)
 #endif
 #endif

Cheers,
--jochen
