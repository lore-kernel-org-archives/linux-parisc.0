Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F54E482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Feb 2003 07:55:43 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id GAA21205
	for <parisc-linux@lists.parisc-linux.org>; Sun, 9 Feb 2003 06:55:42 -0800
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
From: James Bottomley <James.Bottomley@steeleye.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Randolph Chung <tausq@debian.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	grundler@dsl2.external.hp.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030209020325.D27544@parcelfarce.linux.theplanet.co.uk>
References: <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk>
	<200302090035.h190ZJYC012838@hiauly1.hia.nrc.ca>
	<20030209004942.GQ11363@tausq.org> <20030209005608.GR11363@tausq.org>
	<20030209020325.D27544@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 09 Feb 2003 08:55:33 -0600
Message-Id: <1044802535.1741.30.camel@mulgrave>
Mime-Version: 1.0
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

On Sat, 2003-02-08 at 20:03, Matthew Wilcox wrote:
> I think it's even worse than that.  What stops gcc reordering:
> 
> typedef struct {
>         spinlock_t lock;
>         volatile int counter;
> } rwlock_t;
> 
> static  __inline__ void _raw_read_lock(rwlock_t *rw)
> {
>         while (__ldcw (&(x)->lock) == 0) \
>                 while (((x)->lock) == 0) ; } while (0)
>         rw->counter++;
>         do { (x)->lock = 1; } while(0)
> }
> 
> to:
> 
>         while (__ldcw (&(x)->lock) == 0) \
>                 while (((x)->lock) == 0) ; } while (0)
>         do { (x)->lock = 1; } while(0)
>         rw->counter++;

Compilers themselves have fairly strong reordering rules.  For instance,
do { } while() blocks cannot be reordered like your example (that's why
the kernel uses do { } while(0); as a compiler reordering barrier.

You can if you prefer use the barrier() macro, which prevents the
compiler from reordering statements around it.

Of course, the processor can still reorder what the compiler doesn't as
part of its speculation and optimisation (that's what mb(), rmb() and
wmb() are all about).

James
