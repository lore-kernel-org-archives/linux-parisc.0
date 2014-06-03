From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] introduce atomic_pointer to fix a race condition in
 cancelable mcs spinlocks
Date: Mon, 2 Jun 2014 17:28:23 -0700
Message-ID: <20140603002823.GI22231@linux.vnet.ibm.com>
References: <20140602163032.GI16155@laptop.programming.kicks-ass.net>
 <538CB56E.5010709@hp.com>
 <20140602200525.GD13930@laptop.programming.kicks-ass.net>
 <CA+55aFwJwVf_MbcwNNWg-KrLdoOaV2xse2jzvBZTJHJgC_Htvg@mail.gmail.com>
 <20140602210227.GE22231@linux.vnet.ibm.com>
 <CA+55aFzX3oDvzqh4AfkJ7-X1Yfo8obFM+jOOmwzeN-GyqOPLJg@mail.gmail.com>
 <20140602220831.GG22231@linux.vnet.ibm.com>
 <1401749088.3645.189.camel@edumazet-glaptop2.roam.corp.google.com>
 <20140602231730.GH22231@linux.vnet.ibm.com>
 <1401753224.3645.190.camel@edumazet-glaptop2.roam.corp.google.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <waiman.long@hp.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Vinod, Chegu" <chegu_vinod@hp.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rik van Riel <riel@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Davidlohr Bueso <davidlohr@hp.com>,
	Peter Anvin <hpa@zytor.com>, Andi Kleen <andi@firstfloor.org>,
	"Chandramouleeswaran, Aswin" <aswin@hp.com>,
	"Norton, Scott J" <scott.norton@hp.com>,
	Jason Low <jason.low2@hp.com>
To: Eric Dumazet <eric.dumazet@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1401753224.3645.190.camel@edumazet-glaptop2.roam.corp.google.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 02, 2014 at 04:53:44PM -0700, Eric Dumazet wrote:
> On Mon, 2014-06-02 at 16:17 -0700, Paul E. McKenney wrote:
> 
> > But given that I already have preemption disabled and given that
> > __srcu_read_lock() is not to be used by irq handlers, I should be able to
> > use __this_cpu_inc(), correct?  Just to avoid unnecessary irq disabling
> > on non-x86 platforms...
> 
> Absolutely, __this_cpu_inc() is OK here.

Cool, giving it a test...

							Thanx, Paul

