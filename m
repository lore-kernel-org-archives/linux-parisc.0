Return-Path: <arndb@onlinehome.de>
To: =?iso-8859-1?Q?John_David_Anglin?= <dave@hiauly1.hia.nrc.ca>
Subject: Re: Re: [parisc-linux] missing barrier in _raw_spin_lock?
From: <arndb@onlinehome.de>
Message-Id: <26879984$10750505064013f80a9ea842.79929993@config4.schlund.de>
Content-Type: text/plain;
	charset="iso-8859-1"
Mime-Version: 1.0
Date: Sun, 25 Jan 2004 18:10:01 +0100
Cc: =?iso-8859-1?Q?Grant_Grundler?= <grundler@parisc-linux.org>, arnd@arndb.de,
	parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


John David Anglin <dave@hiauly1.hia.nrc.ca> schrieb am 25.01.2004,
07:13:10:
> >  Anyway, gcc doesn't seem to be that smart:
> 
> Right, it not that smart but it does optimize certain memory references.
> 
> > The key bit is __ldcw() in asm/system.h:
> > 
> > /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
> > #define __ldcw(a) ({ \
> >         unsigned __ret; \
> >         __asm__ __volatile__("ldcw 0(%1),%0" : "=r" (__ret) : "r" (a)); \
> >         __ret; \
> > })
> 
> In some version of pthreads, we used
> 
> #define __ldcw(a) ({ \
>   unsigned int __ret;                                                   \
>   __asm__ __volatile__("ldcw 0(%2),%0"                                  \
> 		      : "=r" (__ret), "=m" (*(a)) : "r" (a));           \
>   __ret;                                                                \
> })
> 
> This tells gcc explicitly what memory is affected by the asm.  However,
> it doesn't provide a memory barrier.  I think this isn't necessary in
> pthreads because it provides a separate macro define for this.

I suppose the memory operand specification is required here. Newer 
compilers (especially gcc-3.4) can optimize away local variables if you 
only access the address but not the contents. I think even your 
pthreads version is not really correct, because it specifies (*(a)) as
output only instead of inout.

> #include 
> 
> static spinlock_t lock = SPIN_LOCK_UNLOCKED;
> 
> void test(int *x)
> {
>   if (*x)
>     {
>       spin_lock(&lock);
>       if (!*x)
> 	*x = 0x1234;
>       spin_unlock(&lock);
>     }
> }
> 
> We need the "memory" clobber in SMP.  I think the macro should be:
> 
> #define __ldcw(a) ({ \
>   unsigned int __ret;							 \
>   __asm__ __volatile__("ldcw 0(%2),%0"					 \
> 		      : "=r" (__ret), "=m" (*(a)) : "r" (a) : "memory"); \
>   __ret;								 \
> })

No, putting the barrier into __ldcw is wrong because it would impact all
other uses of __ldcw that don't need the barrier. AFAICS, the 
_raw_spin_lock needs to be changed  to the below. 

#define _raw_spin_lock(x) do { \
        while (__ldcw (&(x)->lock) == 0) \
                while (((x)->lock) == 0) ; \
        barrier(); } while (0)

Since the assembly output of the test program with gcc-3.3 looks good,
this probably did not do any harm so far.

     Arnd <><
