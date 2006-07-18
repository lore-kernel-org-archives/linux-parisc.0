From: "Michael S. Zick" <mszick@morethan.org>
Subject: [parisc-linux] Re: Looking at vfprintf.c and alloca.
Date: Tue, 18 Jul 2006 15:11:42 -0500
Message-ID: <200607181511.42481.mszick@morethan.org>
References: <119aab440607172040gf1209cp52131893cea42460@mail.gmail.com>
	<44BD0369.3090905@tausq.org>
	<119aab440607181230l3abcf965y5afe9fe6901e36d7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440607181230l3abcf965y5afe9fe6901e36d7@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue July 18 2006 14:30, Carlos O'Donell wrote:
> On 7/18/06, Randolph Chung <randolph@tausq.org> wrote:
> > I tried this with both old (gcc-3.[34]) and new gcc (gcc-4.[01]) and i
> > don't think this works....
> >
> > tausq@riot:~$ gcc-4.1 -Wall -o alloca alloca.c; ./alloca
> > ptr = 0xc04ca590
> > old = 0xc04ca3d0
> > &old[100] = 0xc04ca560
> 
> I thought so, if this code is ever execute it will be wrong.
>

I did not look at the original code - just the posted example.

If the library code is depending on an expected difference between
the old and new stack position (other than direction) 
- it will be in trouble.

> 
> I think our tst-printfsz failure is related to this code trying to
> expand the specs and getting the wrong answer.
> 
> Michael, want to write a patch to fix this for glibc? :)
> I'll support you on libc-alpha!
> 

It just so happened that I was compiling glibc and during this exchange
vfprintf.c scrolled by...
I think it set some sort of record for "number of warning messages"

So it needs work.  Probably would be better to give someone else a chance.

Getting -finstrument-functions and the related __builtin_{frame,return}_address()
to work is taking all of my time right now.

> In glibc I don't think the code should be a runtime check at all,
> there are STACK_GROWS_UP macros that should be used.
> 

Sounds reasonable to me.

> c.
Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
