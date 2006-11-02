From: Alan Mock <alan.mock@gmail.com>
Subject: [parisc-linux] Trouble Building GCC
Date: Wed, 1 Nov 2006 18:38:25 -0600
Message-ID: <47F7F502-FBD7-4E25-8701-A04DBC278804@gmail.com>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Type: text/plain;
  charset=US-ASCII;
  delsp=yes;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
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

I am having trouble bootstrapping gcc.  My questions are how do I get  
gcc to bootstrap using hppa1.1 and how do I disable building ada?  I  
configured using --enable-languages=c,c++ as the only flag and  
encountered the following error.

/usr/bin/ld: warning: hppa2.0w architecture of input file `libgcc/./ 
gthr-gnat_s.o' is incompatible with hppa1.1 output
/usr/bin/ld: warning: hppa2.0w architecture of input file `libgcc/./ 
unwind-c_s.o' is incompatible with hppa1.1 output
/usr/bin/ld: warning: hppa2.0w architecture of input file `./ 
crtendS.o' is incompatible with hppa1.1 output
/usr/bin/ld: ./crtbeginS.o(.data.rel+0x0): cannot handle  
R_PARISC_DIR64 for __dso_handle
/usr/bin/ld: final link failed: Bad value
collect2: ld returned 1 exit status
make[3]: *** [libgcc_s.so] Error 1
make[3]: Leaving directory `/gcc/gccbuild/gcc'
make[2]: *** [libgcc.a] Error 2
make[2]: Leaving directory `/gcc/gccbuild/gcc'
make[1]: *** [stage1_build] Error 2
make[1]: Leaving directory `/gcc/gccbuild/gcc'
make: *** [bootstrap] Error 2

With many more warning: lines above what is shown.  To fix this I  
tried passing --target=hppa-unknown-linux-gnu --enable-languages=c,c+ 
+ to configure so that it will not try to build an hppa2.0 compiler,  
however that produces an error message saying that gnat can't be  
found, so I guess it is trying to build the ada frontend.

Thanks,
Alan
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
