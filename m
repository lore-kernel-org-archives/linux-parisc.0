Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id EEDB7482A
	for <parisc-linux@parisc-linux.org>; Mon, 21 May 2001 08:30:19 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 151qgg-0007Rb-00; Mon, 21 May 2001 15:29:34 +0100
Date: Mon, 21 May 2001 15:29:34 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: amodra@one.net.au
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] elf/resolvfail
Message-ID: <20010521152934.A23718@parcelfarce.linux.theplanet.co.uk>
References: <20010520052242.L23718@parcelfarce.linux.theplanet.co.uk> <20010521220002.K30444@squeak.one.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010521220002.K30444@squeak.one.net.au>; from amodra@one.net.au on Mon, May 21, 2001 at 10:00:03PM +0930
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, May 21, 2001 at 10:00:03PM +0930, amodra@one.net.au wrote:
> On Sun, May 20, 2001 at 05:22:42AM +0100, Matthew Wilcox wrote:
> > 
> > but i would have throught that RTLD_LAZY would mean that it didn't have to
> > resolve foo immediately, only when it was used.  Can someone explain what's
> > supposed to happen here?
> 
> What type is foo?  Lazy linking only works for .plt entries, ie. functions.

extern int foo (int);

int
obj1func2 (int a)
{
  return foo (a) + 10;
}

18077:  find library=testobj1.so; searching
18077:   search path=/home/willy/cvs/glibc-C:/home/willy/cvs/glibc-C/math:/home/willy/cvs/glibc-C/elf:/home/willy/cvs/glibc-C/dlfcn:/home/willy/cvs/glibc-C/nss:/home/willy/cvs/glibc-C/nis:/home/willy/cvs/glibc-C/rt:/home/willy/cvs/glibc-C/resolv:/home/willy/cvs/glibc-C/crypt:/home/willy/cvs/glibc-C/linuxthreads
        (LD_LIBRARY_PATH)
18077:    trying file=/home/willy/cvs/glibc-C/testobj1.so
18077:    trying file=/home/willy/cvs/glibc-C/math/testobj1.so
18077:    trying file=/home/willy/cvs/glibc-C/elf/testobj1.so
18077:
18077:  file=testobj1.so;  generating link map
18077:    dynamic: 0x40198cd8  base: 0x40188000   size: 0x00010d90
18077:      entry: 0x401887bc  phdr: 0x40188034  phnum:          4
18077:
18077:  checking for version `GLIBC_2.2' in file /home/willy/cvs/glibc-C/libc.so.6 required by file /home/willy/cvs/glibc-C/elf/testobj1.so
18077:  checking for version `GLIBC_2.0' in file /home/willy/cvs/glibc-C/dlfcn/libdl.so.2 required by file /home/willy/cvs/glibc-C/elf/testobj1.so
[...]

18077:  symbol=dlsym;  lookup in file=/home/willy/cvs/glibc-C/elf/resolvfail
18077:  symbol=dlsym;  lookup in file=/home/willy/cvs/glibc-C/dlfcn/libdl.so.2
18077:  binding file /home/willy/cvs/glibc-C/elf/testobj1.so to /home/willy/cvs/glibc-C/dlfcn/libdl.so.2: normal symbol `dlsym' [GLIBC_2.0]
18077:  symbol=__deregister_frame_info;  lookup in file=/home/willy/cvs/glibc-C/
elf/resolvfail
18077:  symbol=__deregister_frame_info;  lookup in file=/home/willy/cvs/glibc-C/
dlfcn/libdl.so.2
18077:  symbol=__deregister_frame_info;  lookup in file=/home/willy/cvs/glibc-C/
linuxthreads/libpthread.so.0
18077:  symbol=__deregister_frame_info;  lookup in file=/home/willy/cvs/glibc-C/
libc.so.6
18077:  symbol=__deregister_frame_info;  lookup in file=/home/willy/cvs/glibc-C/
elf/ld.so.1
18077:  symbol=__deregister_frame_info;  lookup in file=/home/willy/cvs/glibc-C/
elf/testobj1.so
18077:  symbol=__deregister_frame_info;  lookup in file=/home/willy/cvs/glibc-C/
dlfcn/libdl.so.2
18077:  symbol=__deregister_frame_info;  lookup in file=/home/willy/cvs/glibc-C/
libc.so.6
18077:  symbol=__deregister_frame_info;  lookup in file=/home/willy/cvs/glibc-C/
elf/ld.so.1
18077:  symbol=foo;  lookup in file=/home/willy/cvs/glibc-C/elf/resolvfail
18077:  symbol=foo;  lookup in file=/home/willy/cvs/glibc-C/dlfcn/libdl.so.2
18077:  symbol=foo;  lookup in file=/home/willy/cvs/glibc-C/linuxthreads/libpthr
ead.so.0
18077:  symbol=foo;  lookup in file=/home/willy/cvs/glibc-C/libc.so.6
18077:  symbol=foo;  lookup in file=/home/willy/cvs/glibc-C/elf/ld.so.1
18077:  symbol=foo;  lookup in file=/home/willy/cvs/glibc-C/elf/testobj1.so
18077:  symbol=foo;  lookup in file=/home/willy/cvs/glibc-C/dlfcn/libdl.so.2
18077:  symbol=foo;  lookup in file=/home/willy/cvs/glibc-C/libc.so.6
18077:  symbol=foo;  lookup in file=/home/willy/cvs/glibc-C/elf/ld.so.1
18077:
18077:  calling fini: /home/willy/cvs/glibc-C/dlfcn/libdl.so.2

On x86, it never tries to look up `foo' at all.

-- 
Revolutions do not require corporate support.
