Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B8BF2482C
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Feb 2003 19:03:26 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18hgoX-0003n6-00; Sun, 09 Feb 2003 02:03:25 +0000
Date: Sun, 9 Feb 2003 02:03:25 +0000
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <tausq@debian.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Matthew Wilcox <willy@debian.org>, grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
Message-ID: <20030209020325.D27544@parcelfarce.linux.theplanet.co.uk>
References: <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk> <200302090035.h190ZJYC012838@hiauly1.hia.nrc.ca> <20030209004942.GQ11363@tausq.org> <20030209005608.GR11363@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030209005608.GR11363@tausq.org>; from tausq@debian.org on Sat, Feb 08, 2003 at 04:56:08PM -0800
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

On Sat, Feb 08, 2003 at 04:56:08PM -0800, Randolph Chung wrote:
> > lock(l1)
> > do something
> > unlock(l1)
> > 
> > lock(l2)
> > do something else
> > unlock(l2)
> > 
> > will gcc ever move the lock(l2) before the unlock(l1)? 
> 
> well, bad example, since l1 and l2 are both volatile, but in general,
> nothing will prevent part of "do something else" to happen inside the l1
> lock, right?

I think it's even worse than that.  What stops gcc reordering:

typedef struct {
        spinlock_t lock;
        volatile int counter;
} rwlock_t;

static  __inline__ void _raw_read_lock(rwlock_t *rw)
{
        while (__ldcw (&(x)->lock) == 0) \
                while (((x)->lock) == 0) ; } while (0)
        rw->counter++;
        do { (x)->lock = 1; } while(0)
}

to:

        while (__ldcw (&(x)->lock) == 0) \
                while (((x)->lock) == 0) ; } while (0)
        do { (x)->lock = 1; } while(0)
        rw->counter++;

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
