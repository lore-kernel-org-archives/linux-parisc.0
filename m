From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] memory barriers, spinlocks, debuglocks, oh my
Date: Sun, 29 Aug 2004 16:11:10 +0000
Message-ID: <4132001E.6060707@tiscali.be>
References: <20040827163701.GA2414@mcmartin.ca>
	<20040828221524.GT2414@mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040828221524.GT2414@mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Kyle McMartin wrote:
> Once more unto the brink,
> 
> Commitable?
> 
mmm,

[...]

> Index: include/asm-parisc/atomic.h
> ===================================================================
> RCS file: /var/cvs/linux-2.4/include/asm-parisc/atomic.h,v
> retrieving revision 1.10
> diff -u -r1.10 atomic.h
> --- include/asm-parisc/atomic.h	13 Sep 2002 21:43:37 -0000	1.10
> +++ include/asm-parisc/atomic.h	28 Aug 2004 18:56:09 -0000
> @@ -30,8 +30,11 @@
>   *
>   * XXX REVISIT these could be renamed and moved to spinlock_t.h as well
>   */
> -#define SPIN_LOCK(x)	do { while(__ldcw(&(x)->lock) == 0); } while(0)
> -#define SPIN_UNLOCK(x)  do { (x)->lock = 1; } while(0)
> +#define SPIN_LOCK(x) do { while(__ldcw(&(x)->lock) == 0); } while(0)
> +#define SPIN_UNLOCK(x) do {  \
> +                         __asm__ __volatile__ ("stw,ma %1,0(%0)" \
> +                         : : "r" (&(x)->lock), "r" (0) : "memory"); \
> +                       } while (0)
>  
Sorry, but here I am confused: for parisc-linux unlock means (x)->lock = 1?

may be the jda idea: <http://lists.parisc-linux.org/pipermail/parisc-linux/2004-August/024440.html>
#define __lock_reset(lock_addr,tmp) \
   __asm__ __volatile__ ("stw,ma %1,0(%0)" \
			 : : "r" (lock_addr), "r" (tmp) : "memory");
(tmp or flag may be?)

and if I better understand the idea:

#define SPIN_UNLOCK(x)	__lock_reset((&(x)->lock), 1)

What do you think?

Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
