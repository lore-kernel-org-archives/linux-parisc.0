From: Ulrich Drepper <drepper@redhat.com>
Subject: [parisc-linux] Re: [PATCH] linuxthreads for hppa (1/3)
Date: Tue, 14 Oct 2003 22:13:24 -0700
Message-ID: <3F8CD774.4040400__37114.7156380632$1416622874$gmane$org@redhat.com>
References: <20031010204444.GF6454@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20031010204444.GF6454@systemhalted>
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
