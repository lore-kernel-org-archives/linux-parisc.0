From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: bad code with gcc-4.3 and lzma-utils ?
Date: Sun, 4 Jan 2009 13:08:12 +0100
Message-ID: <20090104130812.69c81ed6@bleh.bxl.tuxicoman.be>
References: <200901030745.01638.vapier@gentoo.org>
	<20090103172125.E7EF44EDA@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: vapier@gentoo.org (Mike Frysinger), linux-parisc@vger.kernel.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090103172125.E7EF44EDA@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi Dave,

Could you do the very same test with -fno-delayed-branch ?

Compiling without that optimization on my system makes the problem go
away. It is really a problem with that part of the code and delayed
branching.

This has been tested with different versions of gcc (4.1.2, 4.2.4,
4.3.1). Both 4.2 and 4.3 exhibit the issue once you compile with
-march=2.0 and -fdelayed-branch.

Also, compiling with -march=2.0 -O0 -fdelayed-branch doesn't produce a
segv but produces the following error message :
hope tests # ../src/lzma/lzma -c < in > out 
../src/lzma/lzma: SetCoderProperties() error

There is really a compiler issue here.


For reference, the Gentoo bug can be found here :
http://bugs.gentoo.org/show_bug.cgi?id=228287


Also, not sure if you noticed but values printed in the gdb backtrace
are completely wrong. But that is a different issue as binaries
generated with any compilers shows the same thing.


Regards,
  Guy

On Sat, 3 Jan 2009 12:21:25 -0500 (EST)
"John David Anglin" <dave@hiauly1.hia.nrc.ca> wrote:

> > to reproduce, just download lzma-4.32.7.tar.gz and do:
> > tar xf lzma-4.32.7.tar.gz
> > cd lzma-4.32.7
> > CXXFLAGS=3D'-O1 -march=3D2.0 -g' ./configure
> > make
> > make check
> 
> Built as above.  I see a segv compressing InBuffer.o in build
> directory.
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x00024638 in NCompress::NLZMA::CEncoder::SetStreams
> (this=0x4158f000, inStream=0x0, outStream=0x3, inSize=0x12,
> outSize=0x0)
> at ../../../../../../src/sdk/7zip/Compress/LZMA/LZMAEncoder.cpp:1251
> 1251	  RINOK(Create());
> 
> There is a problem with memory allocation in MyAlloc:
> 
> Breakpoint 2, MyAlloc (size=72355848)
> at ../../../src/sdk/Common/Alloc.cpp:24 24	  if (size == 0)
> 
> This fails:
> 
> (gdb) 
> NBT4::CMatchFinderBinTree::Create (this=0x32100, historySize=8388608, 
>     keepAddBufferBefore=<value optimized out>, 
>     matchMaxLen=<value optimized out>, keepAddBufferAfter=419)
>     at ../../../../../../src/sdk/7zip/Compress/LZMA/../LZ/BinTree/BinTreeMain.h:97
> 97	    if (_hash != 0)
> (gdb) 
> 101	  return E_OUTOFMEMORY;
> 
> There isn't a check for out of memory at 1251, so segv.  Don't have
> time now to look at memory allocation problem.
> 
> Dave

