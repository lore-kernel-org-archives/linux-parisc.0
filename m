Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from myware.akkadia.org (cpe-24-221-190-179.ca.sprintbbd.net [24.221.190.179])
	by dsl2.external.hp.com (Postfix) with ESMTP id CED7948AC
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Oct 2003 23:54:21 -0600 (MDT)
Message-ID: <3F8CE0F6.6050000@redhat.com>
Date: Tue, 14 Oct 2003 22:53:58 -0700
From: Ulrich Drepper <drepper@redhat.com>
MIME-Version: 1.0
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
References: <20031012213734.GJ23999@systemhalted>
In-Reply-To: <20031012213734.GJ23999@systemhalted>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: [PATCH] _STACK_GROWS_UP fixes.
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
