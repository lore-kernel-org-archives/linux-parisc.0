Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from myware.akkadia.org (cpe-24-221-190-179.ca.sprintbbd.net [24.221.190.179])
	by dsl2.external.hp.com (Postfix) with ESMTP id 479F748AC
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Oct 2003 23:49:32 -0600 (MDT)
Message-ID: <3F8CDFD6.1010300@redhat.com>
Date: Tue, 14 Oct 2003 22:49:10 -0700
From: Ulrich Drepper <drepper@redhat.com>
MIME-Version: 1.0
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
References: <20031012213226.GE23999@systemhalted>
In-Reply-To: <20031012213226.GE23999@systemhalted>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: [PATCH] Sysdeps changes for hppa.
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
