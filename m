Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1EAF04829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Feb 2003 19:18:47 -0700 (MST)
Message-Id: <200302090218.h192Ii9E012950@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
To: willy@debian.org (Matthew Wilcox)
Date: Sat, 8 Feb 2003 21:18:44 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, willy@debian.org,
	grundler@dsl2.external.hp.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030209020325.D27544@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Feb 9, 2003 02:03:25 am
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

Nothing.  The reset needs to be a volatile asm.  This will stop GCC from
doing the above.  On PA 2.0, the processor can do similar reordering.  So,
the reset needs to be an ordered store.  Well, I think the scheduling
model tends to try to do things as early as possible, consistent with
not over feeding the pipeline.  However, I wouldn't rely on this to
get the instrunction order that you want.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
