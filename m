Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1AC6948D7
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Mar 2003 11:14:09 -0700 (MST)
Message-Id: <200303201813.h2KIDn3P007214@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
To: jsoe0708@tiscali.be (Joel Soete)
Date: Thu, 20 Mar 2003 13:13:49 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, b.gunreben@web.de, willy@debian.org,
	doko@cs.tu-berlin.de, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org,
	kuznet@ms2.inr.ac.ru, linux-net@vger.kernel.org
In-Reply-To: <3E689FC4000046DF@ocpmta1.freegates.net> from "Joel Soete" at Mar 20, 2003 06:51:27 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> >> 
> >> these are definitely kernel addresses....
> >
> >Right.  I see the code that's causing the problem in kernel/signal.c:
> >
> >                if (k->sa.sa_handler == SIG_IGN
> >		    || (k->sa.sa_handler == SIG_DFL
> >
> >
> >You don't want to canonicalize k->sa.sa_handler here, so a cast to
> >void * or something is needed.  The PA is the only port that I am
> >aware of that needs to canonicalize function pointers.
> >
> Well I try to test some:
> --- signal.h.orig       2003-03-20 15:12:24.000000000 +0100
> +++ signal.h    2003-03-20 15:11:47.000000000 +0100
> @@ -106,9 +106,15 @@
>  #define SIG_UNBLOCK        1   /* for unblocking signals */
>  #define SIG_SETMASK        2   /* for setting the signal mask */
>  
> +#if __GNUC__ == 3 && __GNUC_MINOR__ >= 3 || __GNUC__ > 3
> +#define SIG_DFL        (0)                     /* default signal handling
> */
> +#define SIG_IGN        (1)                     /* ignore signal */
> +#define SIG_ERR        (-1)                    /* error return from signal
> */
> +#else
>  #define SIG_DFL        ((__sighandler_t)0)     /* default signal handling
> */
>  #define SIG_IGN        ((__sighandler_t)1)     /* ignore signal */
>  #define SIG_ERR        ((__sighandler_t)-1)    /* error return from signal
> */
> +#endif

No, don't do that.  SIG_DFL, SIG_IGN and SIG_ERR expand to compound
literals.  Look at the assembly output from the following little
program (gcc -S) with and without the "void *" cast.

typedef int (*__sighandler_t)(void);
#define SIG_IGN        ((__sighandler_t)1)
int foo (__sighandler_t g)
{
  return g == (void *)SIG_IGN;
}

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
