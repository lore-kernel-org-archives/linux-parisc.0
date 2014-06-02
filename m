From: Jason Low <jason.low2@hp.com>
Subject: Re: [PATCH] fix a race condition in cancelable mcs spinlocks
Date: Mon, 02 Jun 2014 08:27:38 -0700
Message-ID: <1401722858.7440.27.camel@j-VirtualBox>
References: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com>
	 <538C86E2.1070806@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Mikulas Patocka <mpatocka@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>, jejb@parisc-linux.org,
	deller@gmx.de, John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	chegu_vinod@hp.com, paulmck@linux.vnet.ibm.com, tglx@linutronix.de,
	riel@redhat.com, akpm@linux-foundation.org, davidlohr@hp.com,
	hpa@zytor.com, andi@firstfloor.org, aswin@hp.com,
	scott.norton@hp.com
To: Waiman Long <waiman.long@hp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <538C86E2.1070806@hp.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2014-06-02 at 10:14 -0400, Waiman Long wrote:
> On 06/01/2014 01:53 PM, Mikulas Patocka wrote:
> >   struct optimistic_spin_queue {
> > -	struct optimistic_spin_queue *next, *prev;
> > +	atomic_pointer_t next;
> > +	struct optimistic_spin_queue *prev;
> >   	int locked; /* 1 if lock acquired */
> >   };
> 
> Is there a way to do it without changing the pointer type? It will make 
> the code harder to read and understand.

I agree that it would be nice if there is a way to fix this without
changing the pointer type of "next". The change of the type to
atomic_pointer_t might make it less obvious what "next" is for. This is
then compounded with "prev" being kept as a pointer to
optimistic_spin_queue, which can further make it appear as if "next" may
potentially point to something different.
