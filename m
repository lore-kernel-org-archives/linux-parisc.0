Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE6384834
	for <parisc-linux@parisc-linux.org>; Mon,  3 Jun 2002 11:09:48 -0600 (MDT)
To: joel.soete@freebel.net
Subject: Re: [parisc-linux] gcc-cvs problem
Message-ID: <1023124180.3cfba2d4dc38b@webmail.tiscalinet.be>
Date: Mon, 03 Jun 2002 19:09:40 +0200 (CEST)
From: joel.soete@freebel.net
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	joel.soete@freebel.net, parisc-linux@parisc-linux.org
References: <200205311715.g4VHF4Pu006500@hiauly1.hia.nrc.ca> <1023116322.3cfb842218471@webmail.tiscalinet.be>
In-Reply-To: <1023116322.3cfb842218471@webmail.tiscalinet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Dave,

I really have no chance with this b2000:
I broken first my install and now it makes a HPMC in the middle of binutils
build and the pim info are not clear :((

So I will have to ask to HP to analyse those pim and eventually repare it.
(I hoppe we have a maintenance contract for this server)

Joel

Quoting joel.soete@freebel.net:

> Dave,
> 
> Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:
> 
> > > It seems to be well comited in last cvs update this morming I got
> in
> > > src/gcc/gcc/fixinc/inclhack.def:
> > > ...
> > > /*
> > >  * __thread is now a keyword.
> > >  */
> > 
> > > But do not seems to be applied as I got the same error?
> > > 
> > > What do I wrong or forget to do?
> > 
> > You should see the following in your build output:
> > 
> > Applying thread_keyword           to pthread.h
> > Fixed:  pthread.h
> 
> It stand well in my log files and here is the result:
> in {build}/gcc/include/pthread.h
> ...
> /* Create a thread with given attributes ATTR (or default attributes
>    if ATTR is NULL), and call function START_ROUTINE with given
>    arguments ARG.  */
> extern int pthread_create (pthread_t *__restrict __thr,
>                            __const pthread_attr_t *__restrict __attr,
>                            void *(*__start_routine) (void *),
>                            void *__restrict __arg) __THROW;
> ...
> 
> Which seems to be the desired patch?
> 
> Hmm... In what changing parameter name from __thread to __thr in such
> function
> prototype does matter (exepted if there is a border effect with some
> #define
> else where)? [afaik this name doe not matter for a C compiler?]
> 
> So I will have to go further to analyse precompile results.
> 
> See you next,
>     Joel
> 
> 
> -------------------------------------------------
> This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
