Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA26772
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Nov 1999 15:37:20 -0700
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by palrel1.hp.com (Postfix) with ESMTP id 42465352
	for <parisc-linux@thepuffingroup.com>; Thu, 18 Nov 1999 14:38:46 -0800 (PST)
Received: from hp.com (localhost [127.0.0.1]) by xsvr4.cup.hp.com with ESMTP (8.7.6/8.7.3) id OAA02977 for <parisc-linux@thepuffingroup.com>; Thu, 18 Nov 1999 14:38:45 -0800 (PST)
Sender: frowand@cup.hp.com
Message-ID: <38347FF5.B1C230F6@hp.com>
Date: Thu, 18 Nov 1999 14:38:45 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
References: <199911182037.PAA02238@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

John David Anglin wrote:
> 
> >
> > John David Anglin wrote:
> > >
> > > I think what is being suggested is to run with the space registers all
> > > zero and swap the TLB contents on context switches in order to changing
> > > the mapping from virtual to physical.  However, I doubt this is efficient.
> >
> > This is what I undesrtand now too, at first I though it was flat 4Gb shared
> > between the OS and the processes (ala 2Gb each), then space flip enter in
> > action with flat 4Gb per threads (pardon proceses for now), and then a flat
> > 4Gb for the kernel itself.
> 
> The architecture that I proposed was suggested by figure 3-1 of the
> Precision Architecture and Instruction Set Manual (1989).  On a level 1
> machine there 2**16-1 virtual 4GB spaces.  Thus, each process can
> have its own virtual space.  The physical page directory contains
> the mapping for the kernel and all processes.  The algorithm for
> updating the TLB(s) from the page directory is very important for
> efficiency and also for security.
> 
> I assume threads will run in a processes virtual space for efficiency.
> 
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
> 
> The one advantage to reserving the fourth quadrant for the OS is that in
> a system call the OS has direct access to the first three quadrants
> of the processes address space as well as its own space.  What I am
> suggesting here is that the TLB page table mapping for the fourth quadrant
> would be more or less the same except for access rights for the kernel
> and user processes.  Of course, hardware registers wouldn't be mapped
> in process space.  There could be a gateway page that messes with the
> mapping to allow the kernel to run at a different location.  But then
> I think the system would have a more difficult job in accessing user
> virtual space.  Possibly, some special provisions would have to be made
> for PDC calls in virtual mode.
> 
> I know that there are restrictions using mmap with hpux 10.X.  More or
> less, the problem is that you can't put a shared data area where you want
> and this causes problems with many apps that assume a more general
> implementation.  The system chooses where shared data goes.  This needs
> to be looked at in more detail.
> 
> SR0 to SR4 can be changed by a non-privileged process.  Thus, access
> identities have to be setup properly to prevent a process from flipping
> through the virtual address space and doing bad stuff.  The OS must also
> be prepared for a process that messes with SR4.  A nasty process might
> be able change the space id in SR4 to that of another process or the
> kernel, and do a system call that writes to this region.
> 
> For PA_RISC 2.0, the architecture is changed for 64-bit operation.  I quote


Just to avoid confusion, the following quote is from the 64-Bit Runtime
Architecture, and applies to  *** 'user-mode applications running in "Wide"
mode' ***.


>         "The OS will use a different address space layout for 64-bit processes,
>         so we will not be able to specify that main program text is at the
>         low end of Quadrant 0, nor will we be able to use absolute addressing
>         at all.  This will affect millicode calls, long calls, plabel
>         materialization, and non-PIC literal references.
> 
>         Compilers must avoid any explicit reference to space registers, so
>         there is no need to specify any association between particular
>         segments and quadrants of the address space."
> 
> Further, the 64-bit architecture defines a single PIC compilation model.
> I have to say that the 64-bit document as of Version 3.3 (1997) is vague.
> 
> Probably, we should ignore the 64 bit issues and use an architecture
> that is good for 32 bit level 1 machines and above.
> 
> > ------------------------------------------
> 
> > Some may say, linux is not doc, it is hack n run, but on the long run I'm
> > affraid that hack n run will type more text (try and fail code) than writing
> > the design options. For instance the ASL document for HP-UX wide is 22 pages
> > total, with TOC and figures, and pseudo-code algorithm.
> > Remember Djikstra (well the old timer may, the bambinos may take Kurt Cobain
> > as an example :-) "You should pay the programmers a very good salary, don't
> > hesitate to bump their salary, BUT make them pay any puch in their punched
> > card" The idea behind, think before code after, Kurt tried it the other way,
> > he choose to shoot first and think after oops :-)
> 
> Agree totally.
> 
> In summary, I think that each process slot should be assigned a unique
> space id.  At least initially, the same id would be used for SR4-SR7 in
> each process.  Link the OS at 0xc0000000 and go with a 3GB process/1GB OS
> virtual address model.  All the physical memory in the machine can
> therefore be used, up to the ~ 4GB limit in the PA 1.X architecture.
> I think this model is compatible with the PA 1.1 architecture and hopefully
> also the x86 architecture.
> 
> Dave
> --
> J. David Anglin                                  dave.anglin@nrc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
