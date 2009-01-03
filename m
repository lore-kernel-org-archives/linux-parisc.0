From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: bad code with gcc-4.3 and lzma-utils ?
Date: Sat, 3 Jan 2009 12:21:25 -0500 (EST)
Message-ID: <20090103172125.E7EF44EDA@hiauly1.hia.nrc.ca>
References: <200901030745.01638.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: vapier@gentoo.org (Mike Frysinger)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200901030745.01638.vapier@gentoo.org> from "Mike Frysinger" at Jan 3, 2009 07:45:01 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> to reproduce, just download lzma-4.32.7.tar.gz and do:
> tar xf lzma-4.32.7.tar.gz
> cd lzma-4.32.7
> CXXFLAGS=3D'-O1 -march=3D2.0 -g' ./configure
> make
> make check

Built as above.  I see a segv compressing InBuffer.o in build directory.

Program received signal SIGSEGV, Segmentation fault.
0x00024638 in NCompress::NLZMA::CEncoder::SetStreams (this=0x4158f000, 
    inStream=0x0, outStream=0x3, inSize=0x12, outSize=0x0)
    at ../../../../../../src/sdk/7zip/Compress/LZMA/LZMAEncoder.cpp:1251
1251	  RINOK(Create());

There is a problem with memory allocation in MyAlloc:

Breakpoint 2, MyAlloc (size=72355848) at ../../../src/sdk/Common/Alloc.cpp:24
24	  if (size == 0)

This fails:

(gdb) 
NBT4::CMatchFinderBinTree::Create (this=0x32100, historySize=8388608, 
    keepAddBufferBefore=<value optimized out>, 
    matchMaxLen=<value optimized out>, keepAddBufferAfter=419)
    at ../../../../../../src/sdk/7zip/Compress/LZMA/../LZ/BinTree/BinTreeMain.h:97
97	    if (_hash != 0)
(gdb) 
101	  return E_OUTOFMEMORY;

There isn't a check for out of memory at 1251, so segv.  Don't have time
now to look at memory allocation problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
