Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B752482A
	for <parisc-linux@parisc-linux.org>; Mon,  3 Jun 2002 08:58:51 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-cvs problem
Message-ID: <1023116322.3cfb842218471@webmail.tiscalinet.be>
Date: Mon, 03 Jun 2002 16:58:42 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@parisc-linux.org
References: <200205311715.g4VHF4Pu006500@hiauly1.hia.nrc.ca>
In-Reply-To: <200205311715.g4VHF4Pu006500@hiauly1.hia.nrc.ca>
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

Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:

> > It seems to be well comited in last cvs update this morming I got in
> > src/gcc/gcc/fixinc/inclhack.def:
> > ...
> > /*
> >  * __thread is now a keyword.
> >  */
> 
> > But do not seems to be applied as I got the same error?
> > 
> > What do I wrong or forget to do?
> 
> You should see the following in your build output:
> 
> Applying thread_keyword           to pthread.h
> Fixed:  pthread.h

It stand well in my log files and here is the result:
in {build}/gcc/include/pthread.h
...
/* Create a thread with given attributes ATTR (or default attributes
   if ATTR is NULL), and call function START_ROUTINE with given
   arguments ARG.  */
extern int pthread_create (pthread_t *__restrict __thr,
                           __const pthread_attr_t *__restrict __attr,
                           void *(*__start_routine) (void *),
                           void *__restrict __arg) __THROW;
...

Which seems to be the desired patch?

Hmm... In what changing parameter name from __thread to __thr in such function
prototype does matter (exepted if there is a border effect with some #define
else where)? [afaik this name doe not matter for a C compiler?]

So I will have to go further to analyse precompile results.

See you next,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
