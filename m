Return-Path: <carlos@baldric.uwo.ca>
Received: from fep03-mail.bloor.is.net.cable.rogers.com
	(fep03-mail.bloor.is.net.cable.rogers.com [66.185.86.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA9664840
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 11 Feb 2004 09:26:38 -0700 (MST)
Date: Wed, 11 Feb 2004 11:27:02 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
Message-ID: <20040211162702.GI990@baldric.uwo.ca>
References: <4029EF9C00000135@ocpmta1.freegates.net>
	<402A42A100000200@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <402A42A100000200@ocpmta1.freegates.net>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James Morrison <ja2morri@csclub.uwaterloo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> with same glibc cvs src + your patch and gcc-3.3, no pb
> but always same pb with gcc-snapshot (aka 3.5).
> 
> I find an interesting differnce between glibc config.h:
> --- gcc-3.5.0//glibc/config.h	2004-02-11 15:07:53.667245536 +0100
> +++ gcc-3.3.3//glibc/config.h	2004-02-11 15:26:00.256058928 +0100
> @@ -104,7 +104,7 @@
>  
>  /* Define if __asm () on built-in function's prototype causes redirection
> of
>     the builtin.  */
> -#define	HAVE_BUILTIN_REDIRECTION 1
> +/* #undef	HAVE_BUILTIN_REDIRECTION */
>  
>  /* Define if the __thread keyword is supported.  */
>  /* #undef HAVE___THREAD */
> 
> Where should look for to attempt to fix my pb?

Unknown. gcc-3.5 requires some non-trivial changes to code. You really
have to work with the gcc developers here. I tried building kernels with
3.5 but it's too much work right now, I'm sticking with the gcc-3.3
release until 3.5 matures and all the problems are understood. Stop
using gcc-snapshot to compile glibc :)

c.
