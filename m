Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA28770
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Nov 1999 21:09:48 -0700
Date: Fri, 19 Nov 1999 05:12:37 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Philippe Benard <phi@hpfrcu03.france.hp.com>, frowand@cup.hp.com,
        Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        sieler@allegro.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
Message-Id: <19991119051237.C941@mathe.stud.uni-erlangen.de>
References: <3833B29E.5793D0E6@hpfrcu03.france.hp.com> <199911182037.PAA02238@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911182037.PAA02238@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> > This is what I undesrtand now too, at first I though it was flat 4Gb shared
> > between the OS and the processes (ala 2Gb each), then space flip enter in
> > action with flat 4Gb per threads (pardon proceses for now), and then a flat
> > 4Gb for the kernel itself.

> The architecture that I proposed was suggested by figure 3-1 of the
> Precision Architecture and Instruction Set Manual (1989).  On a level 1
> machine there 2**16-1 virtual 4GB spaces.  Thus, each process can
> have its own virtual space.  The physical page directory contains
> the mapping for the kernel and all processes.  The algorithm for
> updating the TLB(s) from the page directory is very important for
> efficiency and also for security.

I agree with the description.

> I assume threads will run in a processes virtual space for efficiency.

Is there any reason we shouldn't do it ?  It's just not a per-pid unique id we
put into the space registers, it's a per-process(Unix sense) one.

> > I don't really see the implementation of a previous mail of someone saying the
> > user VAS quad usage would be TEXT/DATA/SHARED1/SHARE2 if all the SR's are the
> > same, I still have some ProtID problem I don't see how efficiently sharing is
> > implemented (TEXT/SHARED1/SHARED2). I bet this is adressed, I just don't have
> > the design document.
> 
> This was me again.  The TEXT/DATA/SHARED1/SHARE2 architecture is described
> in the 32-bit PA-RISC Runtime Architecture Document.  It is how hpux 10.20
> does it.  Take a look at Table 1, "Space Register Usage".  However, it doesn't
> really tell you anything about the OS implementation details.  I do know
> that hpux uses different spaces for text and data.  As a result, branches
> that cross quadrants must be interspace branches.  The space of the caller
> must be saved and restored on return.  If the same space id is used in SR4-SR7
> for any given process, then I don't think it would be necessary to save
> and restore the instruction space register across calls except for system
> calls where the virtual space changes.

Using the same value in SR0, SR4-SR7 sounds like it will be the least
surprising.  Throwing away the whole fourth quadrant when you only need two
pages out of it doesn't sound like an especially good idea (though it might be
more efficient in very limited circumstances).

> The one advantage to reserving the fourth quadrant for the OS is that in
> a system call the OS has direct access to the first three quadrants
> of the processes address space as well as its own space.

It still has (though I think this might be what you meant by "direct").  Load
SR3 with the content of SR[04567].  Explicitly use SR3 for all references to
user data.

> SR0 to SR4 can be changed by a non-privileged process.  Thus, access
> identities have to be setup properly to prevent a process from flipping
> through the virtual address space and doing bad stuff.

This is an important point as soon as we have to consider system security in
more detail.

> The OS must also be prepared for a process that messes with SR4.  A nasty
> process might be able change the space id in SR4 to that of another process
> or the kernel, and do a system call that writes to this region.

> For PA_RISC 2.0, the architecture is changed for 64-bit operation.  I quote
> 
> 	"The OS will use a different address space layout for 64-bit processes,
> 	so we will not be able to specify that main program text is at the
> 	low end of Quadrant 0, nor will we be able to use absolute addressing
> 	at all.  This will affect millicode calls, long calls, plabel
> 	materialization, and non-PIC literal references.
> 
> 	Compilers must avoid any explicit reference to space registers, so
> 	there is no need to specify any association between particular
> 	segments and quadrants of the address space."
> 
> Further, the 64-bit architecture defines a single PIC compilation model.
> I have to say that the 64-bit document as of Version 3.3 (1997) is vague.

The PA1.1 is vague/redundant as well (or at least I'll assume it is until someone
points out my mistake).

> Probably, we should ignore the 64 bit issues and use an architecture
> that is good for 32 bit level 1 machines and above.

Basically, the question with PA2.0 is "how do we access user memory out of kernel
space".  OTOH, as PA2.0 virtual address offsets are 62 bits only, this shouldn't
be a problem (are they really 62 bits btw ?).

> > ------------------------------------------
> > Some may say, linux is not doc, it is hack n run, but on the long run I'm
> > affraid that hack n run will type more text (try and fail code) than writing
> > the design options. For instance the ASL document for HP-UX wide is 22 pages
> > total, with TOC and figures, and pseudo-code algorithm.
> > Remember Djikstra (well the old timer may, the bambinos may take Kurt Cobain
> > as an example :-) "You should pay the programmers a very good salary, don't
> > hesitate to bump their salary, BUT make them pay any puch in their punched
> > card" The idea behind, think before code after, Kurt tried it the other way,
> > he choose to shoot first and think after oops :-)

> Agree totally.

Who is Kurt and why do we have to go around on parisc-linux and insult him ?

> In summary, I think that each process slot should be assigned a unique
> space id.

I agree, and have said so before (Date: Wed, 17 Nov 1999 14:00:19 +0100).

> At least initially, the same id would be used for SR4-SR7 in
> each process.

I don't see the need to ever change this _for PA1.1_.

For PA2.0 (wide), our largest flat address space is 62 bits and using the two
bits to select space registers is a good idea.

> Link the OS at 0xc0000000 and go with a 3GB process/1GB OS
> virtual address model.

We don't want that.

We might want to link the OS at 0x8000 0000 and go with a 4GB process / 2GB OS
model.

We might want to link the OS at 0x0000 0000 and go with a 4GB process / 4GB OS
model.

> All the physical memory in the machine can therefore be used, up to the ~ 4GB
> limit in the PA 1.X architecture.  I think this model is compatible with the
> PA 1.1 architecture and hopefully also the x86 architecture.

Why does it have to be compatible with the x86 architecture ?

	Philipp Rumpf
