Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 52C3C482F
	for <parisc-linux@parisc-linux.org>; Mon,  3 Jun 2002 09:47:20 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-cvs problem
Message-ID: <1023119233.3cfb8f8180cd6@webmail.tiscalinet.be>
Date: Mon, 03 Jun 2002 17:47:13 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Joel Soete <joel.soete@freebel.net>,
	parisc-linux@parisc-linux.org
References: <200206020045.g520jQ6K009698@hiauly1.hia.nrc.ca>
In-Reply-To: <200206020045.g520jQ6K009698@hiauly1.hia.nrc.ca>
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

Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:

> > I will have a detailed look but as newbee in gcc stuff it will take a
> time.
> 
> If you manually execute the failing compilation command changing '-c'
> to '-E', this will generate the cpp processed output for the
> compilation
> source file.

Hey I also had to do it when I tried and succed to port f2c with bcc 31 (ten
years ago already ;)

>  Inspection of this output should allow you to see exactly
> which include files have been loaded and the result of all macro
> expansions.

and here is the only pthread_create expansion I found in the output file:
# 163 "../linuxthreads/sysdeps/pthread/pthread.h"
extern int pthread_create (pthread_t *__restrict __thread,
                           __const pthread_attr_t *__restrict __attr,
                           void *(*__start_routine) (void *),
                           void *__restrict __arg) ;

So I will change manually __thread by __thr and see.

I also find glibc cvs and co and the new version of 

${src}/glibc/linuxthreads/sysdeps/pthread/pthread.h replace also __thread by
__threadp. Curious?

Joel

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
