Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BE854A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 06:27:48 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA06397;
	Fri, 23 Feb 2001 00:27:44 +1100
Date: Fri, 23 Feb 2001 00:27:44 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
In-Reply-To: <20010222130359.F1129@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0102230011340.14557-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 22 Feb 2001, Richard Hirst wrote:

> On Thu, Feb 22, 2001 at 11:27:14PM +1100, Alan Modra wrote:
> > 131   22:37:47 write(5, "cd /scsi/tmp\nfile=sys/stat.h\nif ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 158 <unfinished ...>
> > 132   22:37:47 read(0, "cd /scsi/tmp\nfile=sys/stat.h\nif ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEUUUU\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\367\4\0\0\0\0\0PUU\0\0\0\0\0\0"..., 156) = 558544
> > 132   22:37:47 chdir("/scsi/tmp")       = 0
> > 
> > Bingo.  Look at that read.
> 
> Nice one!  I wonder if that <unfinished ...> is significant.

It completes after pid 132 has done a few things.

> How do I reproduce this?  Is it as simple as cd <somewhere in a gcc
> build tree> && ./fixincludes, or is it more complex?

Nothing is ever simple when it comes to gcc ;)

This is more or less what I used for the last trace, but I've
parameterized it for you, and added a crucial mkdir.  Change BUILD to
suit.  What's the betting you can't reproduce this? :-(

BUILD=/scsi/tmp/gcc
mkdir -p $BUILD/gcc/include/usr/include/sys
cd /usr/include
echo ./sys/stat.h | \
TARGET_MACHINE=hppa-unknown-linux-gnu \
ORIGDIR=$BUILD/gcc \
SRCDIR=/usr/include \
INPUT=/usr/include \
DESTDIR=$BUILD/gcc/include \
VERBOSE=5 \
FIND_BASE=. \
strace -s 256 -t -f -o /tmp/tsys $BUILD/gcc/fixinc/fixincl
