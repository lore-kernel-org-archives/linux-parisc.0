From: Ulrich Drepper <drepper@redhat.com>
Subject: [parisc-linux] Re: [PATCH] Sysdeps changes for hppa.
Date: Tue, 14 Oct 2003 22:49:10 -0700
Message-ID: <3F8CDFD6.1010300__15613.5348407135$1416622875$gmane$org@redhat.com>
References: <20031012213226.GE23999@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20031012213226.GE23999@systemhalted>
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


> 2003-10-12  Carlos O'Donell  <carlos@baldric.uwo.ca>
> 
> 	* sysdeps/hppa/sysdep.h: Undef JUMPTARGET before use.
> 	* sysdeps/unix/sysv/linux/hppa/sysdep.h:
> 	Define __NR_semtimedop for compat with old kernels,
> 	PSEUDO_ERRVAL, SYSCALL_ERROR_LABEL under all conditions,
> 	INTERNAL_SYSCALL_DECL, INTERNAL_SYSCALL_ERROR_P,
> 	INTERNAL_SYSCALL_ERRNO, INTERNAL_SYSCALL, and undef 
> 	JUMPTARGET before use.
> 	[PIC]: Save pic register around syscall.
> 	* sysdeps/unix/sysv/linux/hppa/sysdep.c (syscall): 
> 	Cleanup asm statment.

I've applied this patch, but only because I really don't care how the PA
port looks.

The semtimedop definition is completely wrong.  If you want all
syscall,s use appropriate headers.

You've modified the patch by hand and broke it, forcing me to do clean up.

The coding style is completely wrong and a terrible mess.  The coding
standard document is available, read it.

The preprocessor directive indentation is wrong or non-existing.

- -- 
- --------------.                        ,-.            444 Castro Street
Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
Red Hat         `--' drepper at redhat.com `---------------------------
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/jN/W2ijCOnn/RHQRAjrzAJsEI3ukb5MQ/T0Wl0ihUX1l2ejBJACeL8GW
7tzXLthx8pW4Rhb+26NQkH4=
=8Fy5
-----END PGP SIGNATURE-----
