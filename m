Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id B528F4871
	for <parisc-linux@parisc-linux.org>; Mon, 24 Feb 2003 10:42:54 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18nMcv-00057M-00
	for <parisc-linux@parisc-linux.org>; Mon, 24 Feb 2003 18:42:53 +0100
Date: Mon, 24 Feb 2003 18:42:39 +0100
Message-ID: <3E5A21B500000145@ocpmta3.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] 2.4.20-pa27 64bits smp problem!
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

Having the opportunity to test a N-class (classical), I build a sd with
debian unstable running a kernel 2.4.20-pa27 64bits up and would try now
to rebuild this same kernel with smp support (I am reach of 2cpu  :) ) but
compile failled with following message:

hppa64-linux-gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-pa27-64/include -Wall
-Wst
rict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame
-pointer -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-
calls -mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000
-nostdin
c -I /usr/lib/gcc-lib/hppa64-linux/3.2.3/include -DKBUILD_BASENAME=sched
 -fno-o
mit-frame-pointer -c -o sched.o sched.c
sched.c:93: initializer element is not constant
sched.c:93: (near initialization for `tasklist_lock')
sched.c:93: initializer element is not constant
make[2]: *** [sched.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.20-pa27-64/kernel'
make[1]: *** [first_rule] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.20-pa27-64/kernel'
make: *** [_dir_kernel] Error 2

at this 93th line I met:
rwlock_t tasklist_lock __cacheline_aligned = RW_LOCK_UNLOCKED

which is precompile as:
rwlock_t tasklist_lock __attribute__((__aligned__(64))) = (rwlock_t) { (spinlock_t)
{1}, 0 };

What's wrong?

I am using the last I know gcc-hppa64 3.2.3-0.1 (would I have to prefer
previous release?) .

Thanks in advance,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
