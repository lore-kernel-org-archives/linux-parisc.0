From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] memory barriers, spinlocks, debuglocks, oh my
Date: Sun, 29 Aug 2004 13:45:10 -0400 (EDT)
Message-ID: <200408291745.i7THjA3V014636@hiauly1.hia.nrc.ca>
References: <4132001E.6060707@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4132001E.6060707@tiscali.be> from "Joel Soete" at Aug 29,
	2004 12:11:10 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > +#define SPIN_UNLOCK(x) do {  \
> > +                         __asm__ __volatile__ ("stw,ma %1,0(%0)" \
> > +                         : : "r" (&(x)->lock), "r" (0) : "memory"); \
> > +                       } while (0)
> >  
> Sorry, but here I am confused: for parisc-linux unlock means (x)->lock = 1?
> 
> may be the jda idea:
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2004-August/024440.htm
> l>
> #define __lock_reset(lock_addr,tmp) \
>    __asm__ __volatile__ ("stw,ma %1,0(%0)" \
> 			 : : "r" (lock_addr), "r" (tmp) : "memory");
> (tmp or flag may be?)
> 
> and if I better understand the idea:
> 
> #define SPIN_UNLOCK(x)	__lock_reset((&(x)->lock), 1)

To reset the lock, the value 1 needs to be loaded into a register
for the memory store.  In situations where you both lock and unlock,
the value 1 will be loaded into a register, say tmp, on a successful
lock.  This value can be used to reset the lock, saving one instruction.
That's why I had "tmp" in the lock macro.  If you don't have the value
from the previous lock, you can just use 1.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
