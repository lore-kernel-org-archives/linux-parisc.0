Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel11.hp.com (palrel11.hp.com [156.153.255.246])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB5724829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Apr 2003 13:40:06 -0600 (MDT)
Message-ID: <75A9FEBA25015040A761C1F74975667D01442051@hplex4.hpl.hp.com>
From: "Boehm, Hans" <hans_boehm@hp.com>
To: "'Carlos O'Donell'" <carlos@baldric.uwo.ca>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>,
	"Boehm, Hans" <hans_boehm@hp.com>
Subject: RE: [parisc-linux] Program counter from sigcontext, constructurs
	and -fPIC
Date: Fri, 25 Apr 2003 12:40:00 -0700
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

> -----Original Message-----
> From: Carlos O'Donell [mailto:carlos@baldric.uwo.ca]
> 
> Hans,
> 
> What code are you porting? :)
It's a new, currently rather simple, but thread-compatible, purely user-level, profiler.  It includes some infrastructure for using hardware atomic operations in reasonably portable ways.  Need less to say, PA-RISC makes a wonderful test case.
> 
> > 1) I need to retrieve the pc value from the sigcontext 
> structure passed to a timer signal handler.  In an earlier 
> message, Paul Bame pointed me at sc_iaoq.  After a bit more 
> reading, my conclusion was that sc_iaoq[0] should be a 
> reasonable value to use as a sampled pc.  However I have been 
> unable to see anything reasonable in that slot (or sc_iaoq[1] 
> for that matter).  Presumably a struct sigcontext pointer is 
> always passed as the third parameter to a signal handler?  
> And it's filled in for timer interrrupts?  What does profil() 
> do?  (I tried to read the code, but it's hard to trace 
> through all the configuration stuff.)
> 
> A. What kernel are you using?
2.4.17-64 on spe170.testdrive.hp.com.
>  
> The reason I ask is that 64-bit kernels return broken sigcontext
> pointers (for now it stuffs 64-bit values into a 32-bit values within
> the sigcontext, rather it should take into account the fact that
> userspace or the calling threads personality is 32-bit and 
> truncate the
> register values).
It sounds like that's the problem here.  Thanks.  
> 
> What is there to understand about profil()? Based on your PC it uses
> modular arithmetic (the shift, scale, and division) to track 
> on a coarse
> scale which parts of your code are being executed.
Once you get the PC in the signal handler, that's easy.  It sounds like getting the PC from a signal handler from a 32-bit executable on a 64-bit kernel is currently impossible?  I should probably focus on 64-bit executables?  Or does profil() have a way to get around the problem?
> 
> > 2) If I mark a C function as a constructor function, and 
> compile it with -fPIC, it seems to run before globals are 
> properly accessible.  The retrieval of the address of a 
> global through the global offset table seems to return a bad 
> address and the access faults.  Are there known issues in 
> this area?  (The offending function actually ends up in the 
> main program, if that matters.)
> 
> B. Can we see the code?
> 
I haven't officially released it, since I wanted to make sure it at least passed its tests on HP Linux platforms.  I do have permission to release it, so I put a preliminary snapshot at http://hpl.hp.com/personal/Hans_Boehm/qprof/qprof-0.2.tar.gz (probably not its final location).

I believe "make check" works on X86/Itanium/Alpha, but not PA.  (Feedback on the code itself is of course also gratefully accepted.)  The only problem on PA should be running qprof_test.

Thanks.

Hans
