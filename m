Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2844C4842
	for <parisc-linux@parisc-linux.org>; Fri, 28 Feb 2003 06:57:02 -0700 (MST)
Date: Fri, 28 Feb 2003 14:56:55 +0100
Message-ID: <3E5A232800001242@ocpmta8.freegates.net>
In-Reply-To: <200302271717.h1RHHJM1021638@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi all,


>-- Original Message --
>Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
>To: jsoe0708@tiscali.be (Joel Soete)
>From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
>Cc: willy@debian.org, parisc-linux@parisc-linux.org
>Date: Thu, 27 Feb 2003 12:17:18 -0500 (EST)
>
>
>> I remove the cast so that in asm-parisc/spinclok_t.h
>> ...
>> #ifndef CONFIG_DEBUG_SPINLOCK
>> #define SPIN_LOCK_UNLOCKED { 1 }
>> ...
>> #else
>> 
>> #define SPIN_LOCK_UNLOCKED { 1, 0L, 0L }
>
>You probably don't need the 0's.  When there a fewer initializers in a brace
>enclosed list than there are elements or members of an aggregate, they are
>implicitly initialized the same as objects that have static storage duration.
>
>> but it breacks many code else where fork.c, raid1.c, raid5.c,...
>> where it is easy to recast.
>
>Glibc linuxthreads defines two initializers in the pthread code, one
>using compound literals and the other using standard initializer lists.
>
Sorry Dave I do not find this stuff.

Any way after some sleep, I find this kind patches:

--- include/asm-parisc/spinlock_t.h.orig	2003-02-28 09:12:26.000000000 +0100
+++ include/asm-parisc/spinlock_t.h	2003-02-28 12:51:37.000000000 +0100
@@ -47,7 +47,9 @@
 } spinlock_t;
 
 #ifndef CONFIG_DEBUG_SPINLOCK
-#define SPIN_LOCK_UNLOCKED (spinlock_t) { 1 }
+/* This following change because of gcc-3.2 limits for C99 compliance */
+#define C_SPIN_LOCK_UNLOCKED { 1 }
+#define SPIN_LOCK_UNLOCKED (spinlock_t) C_SPIN_LOCK_UNLOCKED
 
 /* Define 6 spinlock primitives that don't depend on anything else. */
 
@@ -79,7 +81,9 @@
 
 #else
 
-#define SPIN_LOCK_UNLOCKED (spinlock_t) { 1, 0, 0 }
+/* This following change because of gcc-3.2 limits for C99 compliance */
+#define C_SPIN_LOCK_UNLOCKED { 1, 0L, 0L }
+#define SPIN_LOCK_UNLOCKED (spinlock_t) C_SPIN_LOCK_UNLOCKED
 
 /* Define 6 spinlock primitives that don't depend on anything else. */
--- include/asm-parisc/spinlock.h.orig	2003-02-19 18:05:55.000000000 +0100
+++ include/asm-parisc/spinlock.h	2003-02-28 09:45:10.000000000 +0100
@@ -14,7 +14,7 @@
 	volatile int counter;
 } rwlock_t;
 
-#define RW_LOCK_UNLOCKED (rwlock_t) { SPIN_LOCK_UNLOCKED, 0 }
+#define RW_LOCK_UNLOCKED (rwlock_t) { C_SPIN_LOCK_UNLOCKED, 0 }
 
 #define rwlock_init(lp)	do { *(lp) = RW_LOCK_UNLOCKED; } while (0)

Well I prefer to save "{ 1, 0L, 0L }" because I am never sure about what
is (how) and what is not initialised in C.

I test it on gcc-3.2 64bits and I obtain a a kernel (I will try to boot it
latter).

Any better idea?

Joel


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
