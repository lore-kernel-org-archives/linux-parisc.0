Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA30068
	for <parisc-linux@puffin.external.hp.com>; Fri, 19 Nov 1999 02:04:14 -0700
Sender: phi@hpfrcu81.france.hp.com
Message-ID: <3835137D.4904B531@hpfrcu03.france.hp.com>
Date: Fri, 19 Nov 1999 10:08:13 +0100
From: Philippe Benard <phi@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
CC: frowand@cup.hp.com, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        sieler@allegro.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
References: <199911182037.PAA02238@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Nice answer at least it clarify some design options

John David Anglin wrote:
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

IMHO efficiency is a side effect, by definition user threads are part of a
process, i.e sharing the process VAS, so your assumption is more than valid.


> 
> 
> This was me again.  The TEXT/DATA/SHARED1/SHARE2 architecture is described
> in the 32-bit PA-RISC Runtime Architecture Document.  It is how hpux 10.20
> does it.  Take a look at Table 1, "Space Register Usage".  However, it doesn't
> really tell you anything about the OS implementation details.  I do know
> that hpux uses different spaces for text and data.

Not always, hpux have a lot of chatr(1) tricks to manage the quadran usage
(again don't beat me, this is a consequence of segmented architecture). So for
a regular (non-sharable text) the magic number is EXEC_MAGIC and for those
kind of executable, the quad1 and quad2 (i.e the index from the 2 high bit of
32 bit addr is 0,1) are the same, this allow the DATA/BSS to be stuffed righ
after the TEXT and then having alinear 2GB (whoa) linear space, yet leaving
the quad3 and quad4 for sharable data (shm and mmap).

On the other hand a shared executable (SHARE_MAGIC) does have quad1 (for TEXT)
that is shared among several process, then having its own uniq space since
shared, all the process using this area share it with the same space AND same
offset (more comment below). The quad2 is process private DATA, then indeed
each SHARE_MAGIC process does have its own private space (different space id).
 

>  As a result, branches
> that cross quadrants must be interspace branches.  The space of the caller
> must be saved and restored on return.  If the same space id is used in SR4-SR7
> for any given process, then I don't think it would be necessary to save
> and restore the instruction space register across calls except for system
> calls where the virtual space changes.

In my EXEC_MAGIC does have a common spaceid for quad1 and quad2 and as in your
example, where you generalize with all four quad equal, that's true that there
is no SR jazz to do for calls.

This bring me to another question, how sharing is done with linux on hppa 

Are you planing of using 'limited' aliasing?

I don't see for now how sharing and copy-on-write could be accomplished, if
thoug those concept are high level concern, they are driven by the
architecture capability and virtual addr alias is one of the weak area of hppa
IMHO.

> 
> The one advantage to reserving the fourth quadrant for the OS is that in
> a system call the OS has direct access to the first three quadrants
> of the processes address space as well as its own space.  

This is an interesting point, does the OS must share a lot with a process?
Personally I think the set of threads UAREA look enough to me I don't see the
point of having the OS being capable of r/w on the 3Gb of the process.

However thing that doesn't exist on unix and I think would be nice to have is
a shared area between the process and the kernel, where the process (and its
threads) can readonly, and where the kernel can r/w, the idea is to stick
there some credentials, even stuff that is usually in the proc.h kthread.h lik
pid, tid, lastrun, various time etc, this to allow a process/thread to get
this data as pointer deref, I know I needed this of process tracing, the
tracing lib would get the CR16, and manage the pa1.1 roll-over by watching a
change in the elapsed time inthe uarea, since the CR16 roll-over in multi
seconds, while the OS does an update on each schedule that is sure to happen
at least every 10ms.
To day the UAREA is part of the user VAS but is not readable and off course
not writable, I think that a sharable part would be helpfull...

So I'm still curious about sharing on linux + hppa.
If someone does have infos on this...


Phi

--
mailto:phi@hpfrcu81.france.hp.com
WTEC Project. Kernel debugging tools
