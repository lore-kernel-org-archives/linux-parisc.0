From: Ulrich Drepper <drepper@redhat.com>
Subject: [parisc-linux] Re: [PATCH] linuxthreads for hppa (1/3)
Date: Wed, 15 Oct 2003 10:36:57 -0700
Message-ID: <3F8D85B9.8090504__47724.5698952631$1416622879$gmane$org@redhat.com>
References: <20031010204444.GF6454@systemhalted> <3F8CD774.4040400@redhat.com> <20031015054045.GE22495@systemhalted> <3F8CE195.2090106@redhat.com> <20031015142648.GF22495@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20031015142648.GF22495@systemhalted>
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
> Ulrich,
> 
> 
>>- -# if __LT_SPINLOCK_INIT != 0
>>- -  __pthread_handles[0].h_lock = __LOCK_INITIALIZER;
>>- -  __pthread_handles[1].h_lock = __LOCK_INITIALIZER;
>>+# ifdef __LT_INITIALIZER_NOT_ZERO
>>+  __pthread_handles[0].h_lock = __LOCK_ALT_INITIALIZER;
>>+  __pthread_handles[1].h_lock = __LOCK_ALT_INITIALIZER;
>>
>>part is what I meant.  There is no reason to change the name.
> 
> 
> How do you propose it be handled? All arches define __LT_SPINLOCK_INIT

I'm talking about this __LOCK_INITIALIZER -> __LOCK_ALT_INITIALIZER
change.  Why do you claim the right to rename the symbol?

- -- 
- --------------.                        ,-.            444 Castro Street
Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
Red Hat         `--' drepper at redhat.com `---------------------------
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/jYW52ijCOnn/RHQRAsmEAJ0cmMRxfMlyduuTG9TQMnATJVRJQQCgu/Vy
aL6qdcssSoUjY7D7oCnKXII=
=VzEk
-----END PGP SIGNATURE-----
