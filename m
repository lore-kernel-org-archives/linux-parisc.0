Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B6CC483A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 08:02:47 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18vIc1-0006Dz-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 16:02:45 +0100
Date: Tue, 18 Mar 2003 16:02:44 +0100
Message-ID: <3E68A39600001FEA@ocpmta7.freegates.net>
In-Reply-To: <3E68A39600001F9F@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] squid pb with glibc-2.3.1
To: parisc-linux@lists.parisc-linux.org
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

Sorry all,

I remember now that the actual pb was in mallopt() stuff at the beginning:
edit autoconf.h and undef HAVE_MALLOPT to recompile manually and it works.

Very sorry for confusion,
    Joel

>-- Original Message --
>From: "Joel Soete" <jsoe0708@tiscali.be>
>To: parisc-linux@lists.parisc-linux.org
>Subject: [parisc-linux] squid pb with glibc-2.3.1
>Date: Tue, 18 Mar 2003 15:11:18 +0100
>
>
>Hi all,
>
>I try, without success :( , to do a test case to reproduce the problem I
>encountered with squid when glibc was updated to 2.3.1.
>
>Fortunately I steel have a testing system with glibc 2.1 and I can so compare
>straces:
>
>squid-2.4.7 && glibc-2.2.5-14.3
>...
>close(3)                                = 0
>open("/lib/libc.so.6", O_RDONLY)        = 3
>read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\37"..., 1024)
>= 1024
>fstat64(3, {st_mode=0, st_size=0, ...}) = 0
>mmap(NULL, 1392404, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40170000
>mprotect(0x402a7000, 118548, PROT_NONE) = 0
>mmap(0x402b6000, 45056, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
>3, 0x136000) = 0x402b6000
>mmap(0x402c1000, 12052, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS,
>-1, 0) = 0x402c1000
>close(3)                                = 0
>mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
>= 0x4001c000
>munmap(0x40018000, 13557)               = 0
>getpid()                                = 10655
>rt_sigaction(SIGRTMIN, {0x400910fe, [], 0}, NULL, 8) = 0
>rt_sigaction(SIGRT_1, {0x40091106, [], 0}, NULL, 8) = 0
>rt_sigaction(SIGRT_2, {0x4009110e, [], 0}, NULL, 8) = 0
>rt_sigprocmask(SIG_BLOCK, [RTMIN], NULL, 8) = 0
>_sysctl(0xfaf00a50, 0, 0, 0xfaf00a78, 0) = 0
>umask(07)                               = 022
>umask(022)                              = 07
>time(NULL)                              = 1047922670
>gettimeofday({1047922670, 112579}, NULL) = 0
>brk(0)                                  = 0x221000
>brk(0x221030)                           = 0x221030
>brk(0x222000)                           = 0x222000
>brk(0x223000)                           = 0x223000
>brk(0x224000)                           = 0x224000
>open("/etc/squid.conf", O_RDONLY)       = 3
>fstat64(3, {st_mode=0, st_size=0, ...}) = 0
>mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
>= 0x40018000
>...
>
>
>squid-2.4.7 && glibc-2.3.1
>...
>close(3)                                = 0
>open("/lib/libc.so.6", O_RDONLY)        = 3
>read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\f"..., 1024)
>= 102
>4
>fstat64(3, {st_mode=0, st_size=0, ...}) = 0
>mmap(NULL, 1412104, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40224000
>mprotect(0x40363000, 105480, PROT_NONE) = 0
>mmap(0x40372000, 36864, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
>3
>, 0x13e000) = 0x40372000
>mmap(0x4037b000, 7176, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP
>_ANONYMOUS, -1, 0) = 0x4037b000
>close(3)                                = 0
>munmap(0x40017000, 13557)               = 0
>getpid()                                = 23706
>rt_sigaction(SIGRTMIN, {0x400865d6, [], 0}, NULL, 8) = 0
>rt_sigaction(SIGRT_1, {0x400865de, [], 0}, NULL, 8) = 0
>rt_sigaction(SIGRT_2, {0x400865e6, [], 0}, NULL, 8) = 0
>rt_sigprocmask(SIG_BLOCK, [RTMIN], NULL, 8) = 0
>_sysctl(0xfaf00988, 0, 0, 0xfaf009b0, 0) = 0
>sched_yield()                           = 0
>sched_yield()                           = 0
>.
>.
>.
>.
>
>squid loop here
>
>Is the problem is in _systcl() or elsewhere?
>How may I analyse further this pb (for my limited understanding, I do not
>found enough information on _sysctl() in man)?
>
>Thanks for additional help,
>    Joel
>
>
>PS: the two system are b180L running the same kernel 2.4.20-pa27. The first
>one is a testing debian before glibc upgrade, the second one just after
the
>glibc upgrade.
>
>---------------------------------
>Vous surfez avec une ligne classique ?
>Economisez jusqu'à 25% avec Tiscali Complete !
>Offre spéciale : première année d'abonnement offerte.
>... Plus d'info sur http://complete.tiscali.be
>
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
