From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: traps, unwind new patch proposal.
Date: Tue, 3 May 2005 17:50:30 +0200
Message-ID: <426F252F00002D58@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Randolph,

>
> > Here is my new proposal to attempt to fix the show_stack() bug in the=

early
>
> > boot stage:
>
> Can you explain again what is the problem you are seeing?
Well all came from the fact that my b2k was runing fine a 2.6 64bit (quie=
t
more stable then 32bit twin kernel) and a day I read I mail (iirc from tb=
one)
speaking about DEBUG_SLAB.
I would so try it to attempt to reproduce its pb.

Effectively, under heavy stress condition this same 64bit kernel +  DEBUG=
_SLAB
made panicing the system.
What was anoying: there was no Backtrace?

The analyse of piminfo learned me that the system did a hpmc so why no Ba=
cktrace?

Another case was when I attempted to study the irq (enable/disable) statu=
s
(if I well undestand the PSW I bit) along the boot of our parisc-linux (s=
till
on going :-) ).
I also remember of the willy's patch: "Remove spurious BUG_ON()."
<http://cvs.parisc-linux.org/linux-2.6/kernel/posix-cpu-timers.c?r1=3D1.2=
&r2=3D1.3>

I thought so that it could be interesting to replace the BUG_ON() by a WA=
RN_ON()
to start.

Even thought that was just a warning the system panicing also whithout an=
y
Backtrace?

Then I have a look and found a possible way which could explain this pb:
BUG_ON (for parisc) as well as WARN_ON() -> dump_stack() -> show_stack()
-> kmalloc() (as *task =3D=3D NULL)
OTH (for some run path) kmalloc() -> __kmalloc() -> kmem_find_genral_cach=
ep()->
BUG_ON() (when DEBUG_SLAB is selected)

> Is it because
> of stack overflow? calls to kmalloc()?
>
so imho there are at least a possibility of calls of kmalloc() in loop?

> > +struct unwind_frame_regs {
> > +       unsigned long sp, ip, rp, r31;
> > +};
>
> this is better, although i am still not very clear why we can't just us=
e
> pt_regs.
>
Just because pt_regs struct would use many place (around 0.7k) for just u=
sefull
32bytes (64bit kernel).
(mmm may be oldfashion but at school I learned basis of asm on a 8088 tes=
ting
board with a lot of 4k of ram ;-) ...)

> > +#define UFI_REGS_BUF_MAX       128     /* about 4k for LP64 */
> > +extern struct unwind_frame_regs ufi_regs_buf[UFI_REGS_BUF_MAX];
> > +extern unsigned int ufi_regs_buf_i;
>
> this seems to be used to handle recursive calls to show_stack(), is tha=
t
> right? why do we want to call show_stack() recursively?
>
I thought more to insure some kind of re-intrance (may be not the right w=
ay?).

> i'm not sure why you want to put this array as a global variable. what'=
s
> wrong with putting it on the stack of show_stack()?
>
Willy seems to dis-like this solution:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2005-April/026315.h=
tml>
(imho make sense?)

> > +#if 0   /* FIXME: not used */
> >  void unwind_frame_init_running(struct unwind_frame_info *info, struc=
t
>
> >  pt_regs *regs);
> > +#endif
>
> please fix this. this function is useful e.g. for kdb.
>
Oops I missed sorry (I will check that as soon as we agreed a common solu=
tion).

Thanks,
    Joel

PS: I still need to check the DEBUG_SLAB case; but already help to get mo=
re
backtrace in the second example (eventhought it dramaticaly slow down the=

boot).
It also also help me about that 'ext3' pb encountered with 32bit kernel o=
n
b180 and b2k by showing me now the same Backtrace :-) (previously on b180=
,
it was showing apparently a truncated backtrace, making thought to a diff=
erent
pb)  


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
