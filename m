From: Ulrich Drepper <drepper@redhat.com>
Subject: [parisc-linux] Re: [PATCH] HPPA Linuxthreads.
Date: Wed, 21 May 2003 10:57:57 -0700
Message-ID: <3ECBBE25.8090302__38112.3577048585$1416622474$gmane$org@redhat.com>
References: <20030521172929.GB21858@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: libc-alpha@sources.redhat.com,
	parisc-linux@lists.parisc-linux.org,
	Randolph Chung <tausq@debian.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030521172929.GB21858@systemhalted>
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

> This is a cleaner HPPA linuxthreads implementation that stems from the
> work that John David Anglin <dave.anglin@nrc-cnrc.gc.ca> and myself did 
> to devise a self-aligning lock system that doesn't impose the 16-byte 
> lock alignment restriction.

The indentation and general style is wrong in many places.


> diff -urN glibc-2.3.1.orig/linuxthreads/sysdeps/hppa/pspinlock.c glibc-2.3.1/linuxthreads/sysdeps/hppa/pspinlock.c
> --- glibc-2.3.1.orig/linuxthreads/sysdeps/hppa/pspinlock.c	2002-08-26 18:39:51.000000000 -0400
> +++ glibc-2.3.1/linuxthreads/sysdeps/hppa/pspinlock.c	2003-01-15 18:26:51.000000000 -0500
> @@ -24,15 +24,12 @@
>  int
>  __pthread_spin_lock (pthread_spinlock_t *lock)
>  {
> -  unsigned int val;
> +	unsigned int *addr = __ldcw_align (lock);
> +	
> +	while (__ldcw (addr) == 0)
> +		while (*addr == 0) ;

This is plain wrong.  addr at least must be volatile.

And I don't understand why you removed the asm code.  These pieces of
code are prime candidates for hand-coding.


> +static inline struct _pthread_descr_struct * __get_cr27(void)
> +{
> +	long cr27;
> +	asm("mfctl %%cr27, %0" : "=r" (cr27) : );
> +	return (struct _pthread_descr_struct *) cr27;
> +}

Not a real problem, but you should get gcc to recognize this reqister
and perform the loading.

- -- 
- --------------.                        ,-.            444 Castro Street
Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
Red Hat         `--' drepper at redhat.com `---------------------------
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+y74l2ijCOnn/RHQRAvZ1AKCkAhua5qA19EDylfBz2Zhp8dROIACfTrwO
9Slpj32aUy92PiggDNexZBE=
=6Ilf
-----END PGP SIGNATURE-----
