Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 605C4484E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Apr 2003 15:17:39 -0600 (MDT)
Message-ID: <75A9FEBA25015040A761C1F74975667D01442066@hplex4.hpl.hp.com>
From: "Boehm, Hans" <hans_boehm@hp.com>
To: "Boehm, Hans" <hans_boehm@hp.com>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Cc: "'Carlos O'Donell'" <carlos@baldric.uwo.ca>
Subject: RE: [parisc-linux] Program counter from sigcontext, constructurs
	and -fPIC
Date: Tue, 29 Apr 2003 14:17:32 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Thanks to all the help, my profiling code seems to be much healthier now after:

1) Switching to a machine with a 2.4.20-pa28 kernel and gcc 3.2.
2) Discarding the privilege level bits from the program counter value.
3) Adding 24 bytes to the struct sigcontext pointer (?) passed as a third argument to the signal handler. (!)

Needless to say, I'm still a bit concerned about (3).  Why does the third argument to the signal handler appear to point 24 bytes BEFORE the sigcontext structure?  Does it actually point at a bigger structure?  Is the third argument to a signal handler really not a pointer to sigcontext?  Did struct sigcontext change recently, so that I'm dealing with a version mismatch?

With the 24 bytes added, I clearly get the right program counter values.  I also seem to get the right general register values.

Thanks for any insight.

Hans

> -----Original Message-----
> From: Boehm, Hans 
> Sent: Friday, April 25, 2003 12:40 PM
> To: 'Carlos O'Donell'
> Cc: 'parisc-linux@lists.parisc-linux.org'; Boehm, Hans
> Subject: RE: [parisc-linux] Program counter from sigcontext,
> constructurs and -fPIC
> 
> 
> > -----Original Message-----
> > From: Carlos O'Donell [mailto:carlos@baldric.uwo.ca]
> > 
> > Hans,
> > 
> > What code are you porting? :)
> It's a new, currently rather simple, but thread-compatible, 
> purely user-level, profiler.  It includes some infrastructure 
> for using hardware atomic operations in reasonably portable 
> ways.  Need less to say, PA-RISC makes a wonderful test case.
> > 
> > > 1) I need to retrieve the pc value from the sigcontext 
> > structure passed to a timer signal handler.  In an earlier 
> > message, Paul Bame pointed me at sc_iaoq.  After a bit more 
> > reading, my conclusion was that sc_iaoq[0] should be a 
> > reasonable value to use as a sampled pc.  However I have been 
> > unable to see anything reasonable in that slot (or sc_iaoq[1] 
> > for that matter).  Presumably a struct sigcontext pointer is 
> > always passed as the third parameter to a signal handler?  
> > And it's filled in for timer interrrupts?  What does profil() 
> > do?  (I tried to read the code, but it's hard to trace 
> > through all the configuration stuff.)
> > 
> > A. What kernel are you using?
> 2.4.17-64 on spe170.testdrive.hp.com.
> >  
> > The reason I ask is that 64-bit kernels return broken sigcontext
> > pointers (for now it stuffs 64-bit values into a 32-bit 
> values within
> > the sigcontext, rather it should take into account the fact that
> > userspace or the calling threads personality is 32-bit and 
> > truncate the
> > register values).
> It sounds like that's the problem here.  Thanks.  
> > 
> > What is there to understand about profil()? Based on your PC it uses
> > modular arithmetic (the shift, scale, and division) to track 
> > on a coarse
> > scale which parts of your code are being executed.
> Once you get the PC in the signal handler, that's easy.  It 
> sounds like getting the PC from a signal handler from a 
> 32-bit executable on a 64-bit kernel is currently impossible? 
>  I should probably focus on 64-bit executables?  Or does 
> profil() have a way to get around the problem?
> > 
...
