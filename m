Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA07523
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 02:54:03 -0700
Sender: christoph.plattner@alcatel.at
Message-ID: <3A6EA64B.5875D07A@alcatel.at>
Date: Wed, 24 Jan 2001 10:54:19 +0100
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: John Marvin <jsm@udlkern.fc.hp.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] One more step: Interruption (trap) 18 on 9000/720
References: <200101240938.CAA25865@udlkern.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Thank you for the answer !

I will check that point and I hope my skills are high enough 
for all that.

Further, can you tell me, how to use and where I can find
the kernel debugger stuff. I am used to handle a modified
gdb debuging parts of chorus kernel (on intel machines) in
my job, so I think I should handle that. I saw (as far
this is right) that the kernel debug support is new in
2.4 kernel (partially 2.3) and I am interested in that, as
I often write device drivers (I also want use this for HP
and for intel).

The `strace' is not running with the new stuff. Will there 
be an update. (I tried the current CVS version, but I have
built probles. Many of them I tried to fix. But in process.c
there were problems in basic structures.

And now a very important question:
---------------------------------

You seem to be the right man asking this. I also have an
E55 server (9000/856) with those propriatary HP interfaces.
For me the SCSI controller and the 8-port serial multiplxer
(used for serial console on port-0) are the important
key points. Is there no possibility to get them running ??
Is there really no documentation, etc...

Can I use the PDC console as system console
(not to have "Switching from PDC console..."), so that
I can run Linux NFS based via the PDC console ?

I hope you can help.

With friendly regards

	Christoph




John Marvin wrote:
> 
> >
> > or whatever my first process is. I have instrumented the kernel code
> > and added the output of the code number (a good idea to have this
> > fix in the kernel !) and I saw:
> >
> >         code=18
> >
> > So I have the code 18 (decimal). In the PA RISC 1.1 manual (your link)
> > I saw following description:
> >
> >         18  Data memory protection trap / Unaligned data reference trap
> >
> > So what does this mean here. An alignment problem ?
> > Why is this code not handled in the switch/case ?
> >
> We have done very little testing on machines with PCXS processors. PCXS
> processors are the earliest cpu's that conformed to the PARISC 1.1
> architecture specification, and therefore are the earliest processors that
> we will probably ever support. Anything earlier was PARISC 1.0 based, and
> I doubt we will every support PARISC 1.0 based machines.
> 
> PCXS has a variety of unique differences from some of the later parisc
> cpu's, and you just ran into one of them. Trap type 18 was generated
> by PARISC 1.0 based cpu's primarily. PCXS is the only PARISC 1.1 cpu
> that generates this type of trap. Trap 18 was replaced by Trap 26,
> 27 & 28 in all later cpu's.  The reason is that a Trap 18 has three
> possible causes, and it was a lot better to have three different traps
> for those different causes. Those three causes are:
> 
>     Data Memory Access Rights Trap (Now trap type 26)
>     Data Memory Protection Id Trap (Now trap type 27)
>     Unaligned Data Reference Trap  (Now trap type 28)
> 
> So, the correct fix is going to require code that can test for each of
> these three possibilities, and then do the right thing (e.g. an
> unaligned fault can be checked for by using the iir to determine the
> access size, and then comparing that to the ior to see if the address
> is properly aligned).
> 
> However, there may be a quick workaround you can try.  Currently we don't
> enable protection id checking (we will eventually), so it should be
> impossible to get a Data Memory Protection Id Trap.  In most cases we
> should only get an Unaligned Data Reference Trap if there is a bug.
> However there is a known bug right now (a fix is in progress) in the
> pthreads support which might cause this trap to be generated on a PCXS
> processor.  The only trap that should happen in the normal execution of
> the kernel is a Data Memory Access Rights Trap, which will happen every
> time there is a copy-on-write fault.
> 
> So, the quick workaround might be to just add a "case 18" where you
> find "case 15" and "case 26" in handle_interruption. The problem with
> this workaround is that if you do get an Unaligned Data Reference
> fault you will just hang the kernel, because you will keep calling
> do_page_fault() for a problem that do_page_fault() can't fix.
> 
> > I always use (I think the 32bit code). Have I set to a parisc64 ?
> > How can I influence this ?
> > Which kind of CPU is this in the 720 model ? (I know a 50MHz PA RISC ..)
> >
> 
> PARISC 1.1 processors are incapable of running in 64 bit mode. As I
> mentioned above the processor in a 720 is a PCXS processor. PCXS is
> the internal name for a PA7000 processor.
> 
> John Marvin
> jsm@fc.hp.com

-- 
  +--------V--------+	Christoph.Plattner@alcatel.at
  |  A L C A T E L  |	-----------------------------
  +-----------------+	Phone: +43 1 27722 3706	
         T A S		Fax:   +43 1 27722 3955
