From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Wed, 2 May 2007 11:14:52 +0200
Message-ID: <20070502091452.GA26226__6328.7932229743$1416624346$gmane$org@farad.aurel32.net>
References: <46379E8A.8080705@aurel32.net>
	<200705012059.l41Kxj21011265@hiauly1.hia.nrc.ca>
	<119aab440705011847o29e04a2eted8aea1e7c0bb041@mail.gmail.com>
	<463831CA.4060208@aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-15
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <463831CA.4060208@aurel32.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, May 02, 2007 at 08:38:02AM +0200, Aurelien Jarno wrote:
> Carlos O'Donell a écrit :
> > On 5/1/07, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> >> The two least significant bits in ip contain the priviledge level
> >> of the executing code.  They have to be masked off to get the address
> >> of a faulting instruction.
> > 
> > You'll be pleasantly suprised to know we tracked this down to a
> > missing save/restore of the PIC register on a library call.
> > 
> >   0x40bcb744 <closedir+44>:       copy r20,r22
> >   0x40bcb748 <closedir+48>:       b,l 0x40bb4aa0,rp
> >   0x40bcb74c <closedir+52>:       copy r3,r26
> > 
> > See this lonely b,l without a PIC register save/restore? That's the
> > problem. It's a jump to a stub, which calls free, but free tailcalls
> > into __internal_free, and the PIC register isn't restored by free or
> > by closedir.
> > 
> > FWIW I see this aswell when compiling glibc with gcc mainline:
> > 
> >   10:   6b d3 3f c1     stw r19,-20(sp)
> > ../sysdeps/unix/closedir.c:52
> >   14:   e8 40 00 00     b,l 1c <__closedir+0x1c>,rp
> >                         14: R_PARISC_PCREL17F   free
> >   18:   0c a0 10 85     ldw 0(r5),r5
> > ../sysdeps/unix/closedir.c:54
> >   1c:   08 05 02 5a     copy r5,r26
> >   20:   08 13 02 44     copy r19,r4
> > 
> > Why isn't there a save/restore of the PIC register around the call to
> > free? Clearly r19 is being used, notice the save/restore starting on
> > "20:".
> > 
> 
> In case you want to have a closer look, please find attached the
> preprocessed file. I will try to reduce the testcase later today.
> 
> The problem does not appear at -O0, and start to appears with -O1.

Some more progress. The following change in the preprocessed source code
"fixes" the problem:

- extern __thread int __libc_errno __attribute__ ((tls_model ("initial-exec")));
+ extern __thread int __libc_errno;

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
