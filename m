From: Ulrich Drepper <drepper@redhat.com>
Subject: [parisc-linux] Re: [PATCH] _STACK_GROWS_UP fixes.
Date: Tue, 14 Oct 2003 22:53:58 -0700
Message-ID: <3F8CE0F6.6050000__37163.1264024929$1416622875$gmane$org@redhat.com>
References: <20031012213734.GJ23999@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20031012213734.GJ23999@systemhalted>
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

> 2003-10-06  Carlos O'Donell <carlos@baldric.uwo.ca>
> 
> 	* pthread.c (__pthread_self_stack): _STACK_GROWS_UP case added.
> 	(__pthread_find_self): Likewise.
> 	* manager.c (thread_segment): _STACK_GROWS_UP case added.

Applied after cleaning up.

- -- 
- --------------.                        ,-.            444 Castro Street
Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
Red Hat         `--' drepper at redhat.com `---------------------------
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/jOD22ijCOnn/RHQRAtSQAKCSAkx1YFOt3HSr2MBfKcB5OqK43ACgyHQK
ch5Et0rXhEeQqKCszFrYGDY=
=UKA4
-----END PGP SIGNATURE-----
