Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from myware.akkadia.org (cpe-24-221-190-179.ca.sprintbbd.net [24.221.190.179])
	by dsl2.external.hp.com (Postfix) with ESMTP id A39634927
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Oct 2003 23:57:02 -0600 (MDT)
Message-ID: <3F8CE195.2090106@redhat.com>
Date: Tue, 14 Oct 2003 22:56:37 -0700
From: Ulrich Drepper <drepper@redhat.com>
MIME-Version: 1.0
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
References: <20031010204444.GF6454@systemhalted> <3F8CD774.4040400@redhat.com> <20031015054045.GE22495@systemhalted>
In-Reply-To: <20031015054045.GE22495@systemhalted>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: [PATCH] linuxthreads for hppa (1/3)
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Carlos O'Donell wrote:

>>>	Use __LT_INITIALIZER_NOT_ZERO instead of __LT_SPINLOCK_INIT.
>>
>>Why?  No unnecessary changes.
> 
> 
> __LT_SPINLOCK_INIT is the value of the structure and used for

The

- -# if __LT_SPINLOCK_INIT != 0
- -  __pthread_handles[0].h_lock = __LOCK_INITIALIZER;
- -  __pthread_handles[1].h_lock = __LOCK_INITIALIZER;
+# ifdef __LT_INITIALIZER_NOT_ZERO
+  __pthread_handles[0].h_lock = __LOCK_ALT_INITIALIZER;
+  __pthread_handles[1].h_lock = __LOCK_ALT_INITIALIZER;

part is what I meant.  There is no reason to change the name.

Look at your change, no changes of code which are not needed.  Clean up
the patches to follow the coding standard, preprocessor indentation, etc
etc.

- -- 
- --------------.                        ,-.            444 Castro Street
Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
Red Hat         `--' drepper at redhat.com `---------------------------
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/jOGV2ijCOnn/RHQRAhQUAJ9/9i66NJnsUCcLb6eLUVOKIUXUzgCeOibq
l0Nqbif38PD+KbJgZqJVq20=
=4y0s
-----END PGP SIGNATURE-----
