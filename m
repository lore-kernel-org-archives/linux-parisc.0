Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6D564840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  2 Mar 2004 12:52:49 -0700 (MST)
Date: Tue, 2 Mar 2004 14:50:50 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3: a warning with gcc-3.3 become an
	error with gcc-3.5
Message-ID: <20040302195050.GE19402@baldric.uwo.ca>
References: <20040301193815.GG21769@baldric.uwo.ca>
	<402A4CA50000D57D@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <402A4CA50000D57D@ocpmta2.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Joel,

Could you lookup the C99 specification please?

> --- ./feupdateenv.c.orig	2004-03-02 15:21:25.959085856 +0100
> +++ ./feupdateenv.c	2004-03-02 07:53:27.938166120 +0100
> @@ -28,11 +28,16 @@
>    /* Get the current exception status. */
>    __asm__ ("fstd %%fr0,0(%1)" : "=m" (*sw) : "r" (sw));
>    sw[0] &= FE_ALL_EXCEPT;
> -  envp->__status_word = envp->__status_word | sw[0];
> +/*  envp->__status_word = envp->__status_word | sw[0]; */

This is required to set the flags. Please review the specfications.

>    /* Install new environment.  */
>    fesetenv (envp);
>  
> +  /* Raise the safed exception.  Incidently for us the implementation
> +     defined format of the values in objects of type fexcept_t is the
> +     same as the ones specified using the FE_* constants.  */
> +  feraiseexcept (sw[0]);
> +

AFAIK, this is not correct, the spec says that it will be an OR of the
raised exceptions, e.g. an OR of the raised flags. 

Calling feraiseexcept could fault the program.

>    /* Success.  */
>    return 0;
>  }

c.
