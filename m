Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from myware.akkadia.org (cpe-24-221-190-179.ca.sprintbbd.net [24.221.190.179])
	by dsl2.external.hp.com (Postfix) with ESMTP id AB0F548AC
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Oct 2003 23:13:51 -0600 (MDT)
Message-ID: <3F8CD774.4040400@redhat.com>
Date: Tue, 14 Oct 2003 22:13:24 -0700
From: Ulrich Drepper <drepper@redhat.com>
MIME-Version: 1.0
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
References: <20031010204444.GF6454@systemhalted>
In-Reply-To: <20031010204444.GF6454@systemhalted>
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

I think I've asked this before:

> 	Use __LT_INITIALIZER_NOT_ZERO instead of __LT_SPINLOCK_INIT.

Why?  No unnecessary changes.


guardaddr))
> +#  else
>    while (h->h_descr == NULL
> -	 || ! (sp <= (char *) h->h_descr->p_stackaddr && sp >= h->h_bottom))
> +	 || ! (sp <= (char *) h->h_descr->p_stackaddr && sp >= (char *) h->h_bottom))
> +#  endif

No unnecessary changes.  Leave the code you're not using alone.


>      h++;
>  # else
> -  while (! (sp <= (char *) h->h_descr && sp >= h->h_bottom))
> +#  ifdef _STACK_GROWS_UP

And again.


- -- 
- --------------.                        ,-.            444 Castro Street
Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
Red Hat         `--' drepper at redhat.com `---------------------------
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/jNd02ijCOnn/RHQRAl6CAJ0Tv6yItJOX52RZu71GKSrGFUfMtACgnf6i
Jy0mt+OERsR8N35JOFozwPU=
=kNiu
-----END PGP SIGNATURE-----
