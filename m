From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Trouble Building GCC
Date: Wed, 1 Nov 2006 20:17:25 -0500 (EST)
Message-ID: <200611020117.kA21HQCp029595@hiauly1.hia.nrc.ca>
References: <47F7F502-FBD7-4E25-8701-A04DBC278804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: alan.mock@gmail.com (Alan Mock)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <47F7F502-FBD7-4E25-8701-A04DBC278804@gmail.com> from "Alan Mock"
	at Nov 1, 2006 06:38:25 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I am having trouble bootstrapping gcc.  My questions are how do I get  
> gcc to bootstrap using hppa1.1 and how do I disable building ada?  I  
> configured using --enable-languages=c,c++ as the only flag and  
> encountered the following error.
> 
> /usr/bin/ld: warning: hppa2.0w architecture of input file `libgcc/./ 
> gthr-gnat_s.o' is incompatible with hppa1.1 output
> /usr/bin/ld: warning: hppa2.0w architecture of input file `libgcc/./ 
> unwind-c_s.o' is incompatible with hppa1.1 output
> /usr/bin/ld: warning: hppa2.0w architecture of input file `./ 
> crtendS.o' is incompatible with hppa1.1 output
> /usr/bin/ld: ./crtbeginS.o(.data.rel+0x0): cannot handle  
> R_PARISC_DIR64 for __dso_handle

You have to force the target to 32 bits when using a 64-bit kernel.
Otherwise, the build machinary will try to build a 64-bit version
of GCC.  However, parisc-linux only supports a 32-bit userspace
at the moment ;(

There's probably a bug in config.guess.  Under hpux, it selects
between 32 and 64 bits based on the bootstrap compiler.  However,
this is a bit of a hack and there's some work going on to try to
integrate the 32 and 63-bit tool chains.

> With many more warning: lines above what is shown.  To fix this I  
> tried passing --target=hppa-unknown-linux-gnu --enable-languages=c,c+ 
> + to configure so that it will not try to build an hppa2.0 compiler,  
> however that produces an error message saying that gnat can't be  
> found, so I guess it is trying to build the ada frontend.

c,c++ should be "c,c++".  This should fix the gnat error.  I typically
something like the following to configure GCC:

../gcc/configure --with-gnu-as --with-gnu-ld --enable-shared --prefix=/home/dave/opt/gnu/gcc/gcc-4.2.0 --with-local-prefix=/home/dave/opt/gnu --enable-threads=posix --enable-__cxa_atexit --host=hppa-linux --enable-clocale=gnu --enable-java-gc=boehm --enable-java-awt="xlib" --enable-languages="c,c++,objc,fortran,java,ada,obj-c++"

The --host option also sets --target.  Here my build directory is adjacent
to my GCC tree.

Using debian and I believe gentoo, GCC 4.1 packages are available.
So, you really shouldn't have to build GCC unless you are interested
in working on or learning about GCC.  4.2 and 4.3 aren't ready for
prime time.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
