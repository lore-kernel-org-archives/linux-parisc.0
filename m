Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59381482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 08:51:25 -0700 (MST)
Message-Id: <200111151551.fAFFpKxb016643@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Linux/PA-RISC speed (was Re: C240 Graphics, 64bit kernel and more)
To: xam@student.cs.ucc.ie (Markus Grabert)
Date: Thu, 15 Nov 2001 10:51:20 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.OSF.3.96.1011115140754.20078A-100000@student.cs.ucc.ie> from "Markus Grabert" at Nov 15, 2001 02:08:46 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> Of course there are bugs in binutils/gcc. But are there KNOW bugs/issues
> a software developer (not a kernel freak) has to be aware of ?

These are the main gcc issues that I am aware of:

1) 32-bit ABI -- 5-7 byte structures are not passed correctly per ABI.
2) I would say avoid "-O3" on mainline at the moment.  3.0.2 is better.
   The cause of the bug is unknown.

> What about glibc ?
> Are threads fully supported ? Are gcc's ObjC, Java and C++ compilers
> also working ?

ObjC builds and testsuite results are similar to i386.  Is anybody
actually using it?  I believe that the library is installed in the
wrong location.  There may still be issues with the testsuite using
the installed library rather than the build library.

Java: the library doesn't build.  Needs porting for both parisc-linux
and hpux, I believe.

C++: lack of weak symbol support causes some problems with template
instantiation under hpux.  Not sure how this is working under parisc-linux
but weak support should help.

Fortran: there are some bugs that need work on main.  Stick with 3.0.x
for now.

At least based on the testsuite results, C++ STL threads work under hpux.
Don't know of any issues under linux.  The primary problem is locking.

It would be useful if the gcc testsuite were run on various parisc-linux
linux configurations: 1.X and 2.0 processors, 32 and 64 bit, gcc mainline
and 3.0.2.  Then, post the results using the contrib/test-summary script to
gcc-testresults@gcc.gnu.org.  This would help a lot to determine the status
of things for gcc under parisc-linux.  Volunteer(s)?

I am planning to set up a 64-bit test system in the near future.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
