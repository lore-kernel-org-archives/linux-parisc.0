Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6EE6A488D
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Nov 2003 17:51:11 -0700 (MST)
Message-ID: <3FC93EFF.20501@tiscali.be>
Date: Sun, 30 Nov 2003 00:51:11 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [RFC] rewrite kernel spinlock code to work better
 with gcc
References: <20031126070714.GN975@tausq.org>
In-Reply-To: <20031126070714.GN975@tausq.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

:)

a trivial atomic.h patch:
---------><---------
--- atomic.h.orig       2003-11-30 01:47:49.000000000 +0100
+++ atomic.h    2003-11-30 01:48:01.000000000 +0100
@@ -1,7 +1,6 @@
  #ifndef _ASM_PARISC_ATOMIC_H_
  #define _ASM_PARISC_ATOMIC_H_

-#include <linux/config.h>
  #include <asm/system.h>

  /* Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>.  */
---------><---------

hth,
	J.
