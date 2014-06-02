From: Davidlohr Bueso <davidlohr@hp.com>
Subject: Re: [PATCH v2] introduce atomic_pointer to fix a race condition in
 cancelable mcs spinlocks
Date: Mon, 02 Jun 2014 10:12:25 -0700
Message-ID: <1401729145.5185.5.camel@buesod1.americas.hpqcorp.net>
References: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com>
	 <alpine.LRH.2.02.1406021158360.20627@file01.intranet.prod.int.rdu2.redhat.com>
	 <20140602162525.GH16155@laptop.programming.kicks-ass.net>
	 <CA+55aFzwrqkwD=G=w2m7TdXTpsMFjV7XUMXv5DMPGr=5x5YGCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Peter Zijlstra <peterz@infradead.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Paul McKenney <paulmck@linux.vnet.ibm.com>,
	"Vinod, Chegu" <chegu_vinod@hp.com>,
	Waiman Long <Waiman.Long@hp.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rik van Riel <riel@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Anvin <hpa@zytor.com>, Andi Kleen <andi@firstfloor.org>,
	"Chandramouleeswaran, Aswin" <aswin@hp.com>,
	"Norton, Scott J" <scott.norton@hp.com>,
	Jason Low <jason.low2@hp.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFzwrqkwD=G=w2m7TdXTpsMFjV7XUMXv5DMPGr=5x5YGCQ@mail.gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2014-06-02 at 10:09 -0700, Linus Torvalds wrote:
> On Mon, Jun 2, 2014 at 9:25 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > And I can't say I'm a particular fan of these ops either, as alternative
> > I'm almost inclined to just exclude parisc from using opt spinning.
> 
> Please do.

I agree, this is the best way out of this mess. Furthermore, it would
also be nice to consolidate opt spinning in a common CONFIG option --
right now mutexes and rwsems create their own dependencies.
