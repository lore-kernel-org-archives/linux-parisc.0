Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77657482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Oct 2002 19:30:21 -0600 (MDT)
Date: Tue, 15 Oct 2002 18:32:31 -0700
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] possible gcc-3.2 bug?
Message-ID: <20021016013231.GS5602@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20021015070336.GJ24881@tausq.org> <200210152137.g9FLbmkY004459@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200210152137.g9FLbmkY004459@hiauly1.hia.nrc.ca>
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

> > ---------------------8<-----------------------
> > /* compile with gcc -c foo.c */
> > 
> > typedef struct {
> >         volatile unsigned int lock;
> > } spinlock_t;
> > 
> > typedef struct {
> >         spinlock_t lock;
> >         volatile int counter;
> > } rwlock_t;
> > 
> > void foo(void)
> > {
> >         static rwlock_t x = (rwlock_t) { (spinlock_t) { 1 }, 0 };
> > }
> 
> Except for sizeof, cast operators in initializers for static variables
> can only be used to convert arithmetic types.  GCC allows non-constant
> initializers for automatic variables.

well, it's doesn't seem to be very consistent about it then...

static rwlock_t x = (rwlock_t) { { 1 }, 0 };
is ok

static rwlock_t x = { (spinlock_t) { 1 }, 0 };
is also ok

only when you have both casts does it fail...

randolph
