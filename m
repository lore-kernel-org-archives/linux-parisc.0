Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay1.cc.umr.edu [131.151.1.120])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D5D3601C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 12:44:53 -0700 (MST)
Message-ID: <E8139C9A62384F49A7EBF9CCCD2243C101968B@umr-mail2.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Mon, 19 Nov 2001 13:44:45 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Subject: [parisc-linux] FW: Porting LWP
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

Anyone have any thoughts on this? In particular the question about whether
setjmp/longjmp preserve the stack. 

When I try to have the code use ucontext (getcontext/setcontext) instead, it
gets complaints from glibc about setcontext/getcontext being unimplemented.

Is parisc linux more like ia64 or x86? I'd presume that I might just have to
use the ucontext stuff, but that's going to be difficult if libc doesn't
support it.

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216


-----Original Message-----
From: chas williams [mailto:chas@cmf.nrl.navy.mil] 
Sent: Monday, November 19, 2001 1:11 PM
To: Neulinger, Nathan
Subject: Re: Porting LWP 


>I know you've been involved with alot of the previous porting efforts in
>AFS. I was hoping you could give some tips on porting LWP.

just a few really, not really that many.

>I've been doing some work trying to get openafs functional on
>parisc_linux24, but LWP definately appears to be the problem at this point.
>(Note, openafs fully compiles, but anything using threads fails.)

lwp is probably the most difficult part of userland.  it truly is
a serious pain.  it would be nice if someone made lwp just use pthreads.
however, its just a gleam in someones eye for now.

>I did get the LWP_SP stuff corrected, had some trouble with that at first,
>but am not sure where else to concentrate on. I generally get segmentation
>faults on everything in savecontext.

the last time i worked on a parisc system i noted that that the 
stack grew UP and not down.  parisc might do the same.  the linux
swp code assumes that the stack grows down (atleast i am pretty sure
it does)

you usually can verify which way the stack goes with something like
the following

sub()
{
	int stack2;
	printf("%x\n", &stack2);
}

main()
{
	int stack1;
	printf("%x\n", &stack1);
	sub();
}

if stack grows up, stack2 is greater than stack1.  if stack grows down,
stack2 less than stack1.  (or so i think)

other than that, parisc might need more space saved on the stack.
you should also make sure you setjmp/longjmp preserve the stack info
(check any comments in the glibc source).  it doesnt on the ia64 and
i had to use ucontext() instead.
