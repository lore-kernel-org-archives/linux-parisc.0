Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9ECD84829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Oct 2002 15:37:56 -0600 (MDT)
Message-Id: <200210152137.g9FLbmkY004459@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] possible gcc-3.2 bug?
To: tausq@debian.org
Date: Tue, 15 Oct 2002 17:37:47 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021015070336.GJ24881@tausq.org> from "Randolph Chung" at Oct 15, 2002 00:03:36 am
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

> The following piece of code compiles with gcc-3.0 but not with
> gcc-3.2... is this a gcc bug? or is the code broken?

I would say the later.

> tausq@a500:~$ gcc-3.2 -c t.c
> t.c: In function `foo':
> t.c:12: initializer element is not constant
> 
> (it's a simplified example of some code from the parisc-linux kernel)
> 
> ---------------------8<-----------------------
> /* compile with gcc -c foo.c */
> 
> typedef struct {
>         volatile unsigned int lock;
> } spinlock_t;
> 
> typedef struct {
>         spinlock_t lock;
>         volatile int counter;
> } rwlock_t;
> 
> void foo(void)
> {
>         static rwlock_t x = (rwlock_t) { (spinlock_t) { 1 }, 0 };
> }

Except for sizeof, cast operators in initializers for static variables
can only be used to convert arithmetic types.  GCC allows non-constant
initializers for automatic variables.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
