Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id B7D2A4875
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 01:31:40 -0600 (MDT)
Received: from unknown (HELO pippin.tausq.org) ([64.81.244.94]) (envelope-sender <randolph@tausq.org>)
          by mail14.speakeasy.net (qmail-ldap-1.03) with SMTP
          for <parisc-linux@parisc-linux.org>; 12 Jul 2002 07:31:40 -0000
Date: Fri, 12 Jul 2002 00:36:28 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020712073628.GB8838@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] compiling kernels with gcc-3.1
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

I seem to recall some reports that you cannot build a working kernel
with gcc-3.1....

Well, maybe they've changed things upstream, but I just tried with
gcc-3.1.1 (3.1.1 20020708 snapshot) and it seems to work well, at least
with my limited testing... this is with the debian default 64-bit smp
.config.

I did have to hack up a bunch of code... it seems like gcc-3.1.1 doesn't
like this construct:

typedef struct {
        volatile unsigned int __attribute__((aligned(16))) lock;
} spinlock_t;

typedef struct {
        spinlock_t lock;
        volatile unsigned int count;
} rwlock_t;

rwlock_t foo = (rwlock_t) { (spinlock_t) { 1 }, 0 };

it complains that the initializer is not constant in this case. 
removing the (rwlock_t) cast fixed that....

also it doesn't like it when you have a variable and you initialize it
after declaration with the { (spinlock_t) { 1 }, 0 } stuff...

(e.g. 
rwlock_t foo;

foo = { (spinlock_t) { 1 }, 0 };

gives a "parse error at {" message)

after working through these problems i got a working kernel...

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
