Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA30985
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Nov 2000 15:03:18 -0700
Message-Id: <200011292205.RAA25396@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc crashes/out of memory and groff
To: alan@lxorguk.ukuu.org.uk (Alan Cox)
Date: Wed, 29 Nov 2000 17:05:31 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <E140T6e-0003Rc-00@the-village.bc.nu> from "Alan Cox" at Nov 27, 2000 06:34:23 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> With groff -fno-gcse does not help but -O0 does. Without -O0 you get an
> internal error.
> 
> g++ -I. -I/usr/src/redhat/BUILD/groff-1.16/src/roff/troff -I/usr/src/redhat/BUILD/groff-1.16/src/include -I/usr/src/redhat/BUILD/groff-1.16/src/include -DHAVE_UNISTD_H=1 -DHAVE_DIRENT_H=1 -DHAVE_LIMITS_H=1 -DHAVE_SYS_DIR_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRINGS_H=1 -DSTDLIB_H_DECLARES_PUTENV=1 -DSTDIO_H_DECLARES_POPEN=1 -DSTDIO_H_DECLARES_PCLOSE=1 -DHAVE_SYS_NERR=1 -DHAVE_SYS_ERRLIST=1 -DHAVE_CC_LIMITS_H=1 -DRETSIGTYPE=void -DHAVE_STRUCT_EXCEPTION=1 -DHAVE_UNISTD_H=1 -DHAVE_GETPAGESIZE=1 -DHAVE_MMAP=1 -DHAVE_FMOD=1 -DHAVE_STRTOL=1 -DHAVE_GETCWD=1 -DHAVE_STRERROR=1 -DHAVE_PUTENV=1 -DHAVE_RENAME=1 -DHAVE_MKSTEMP=1 -DHAVE_STRCASECMP=1 -DHAVE_STRSEP=1 -DHAVE_STRDUP=1 -DSYS_SIGLIST_DECLARED=1  -O2 -mpa-risc-1-0 -fno-gcse  -c env.cc
> env.cc: In member function `void environment::output_line (node *, hunits)':
> env.cc:1582: Internal error: Segmentation fault.
>    Please submit a full bug report.
>    See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
> make[2]: *** [env.o] Error 1
> make[2]: Leaving directory `/usr/src/redhat/BUILD/groff-1.16/src/roff/troff'

This error is also exception related but appears different from the
memory explosion.  It occurs in scan_region in except.c.  The memory
explosion that occurs without -fno-gcse does seem to occur in the
gcse pass as I suspected.  I need to rebuild gcc with debugging to
get further.

I was able to build the groff package with `CXXFLAGS="-O3 -fno-exceptions"'.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
