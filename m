Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26455482B
	for <parisc-linux@parisc-linux.org>; Mon,  3 Jun 2002 09:12:53 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g53FCoFN011019
	for <parisc-linux@parisc-linux.org>; Mon, 3 Jun 2002 11:12:50 -0400 (EDT)
Message-Id: <200206031512.g53FCnh7011018@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-cvs problem
To: joel.soete@freebel.net
Date: Mon, 3 Jun 2002 11:12:48 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <1023116322.3cfb842218471@webmail.tiscalinet.be> from "joel.soete@freebel.net" at Jun 3, 2002 04:58:42 pm
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

Yes.

> Hmm... In what changing parameter name from __thread to __thr in such function
> prototype does matter (exepted if there is a border effect with some #define
> else where)? [afaik this name doe not matter for a C compiler?]

Changing the name doesn't matter in a C function prototype.  The bug in the
system header is that __thread is now a reserved language keyword.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
