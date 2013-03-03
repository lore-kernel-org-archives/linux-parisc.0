From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] [parisc] do not install modules when installing kernel
Date: Sun, 03 Mar 2013 23:23:52 +0100
Message-ID: <5133CD78.8050501@gmx.de>
References: <3763734.hDYRZelWPG@donald.sf-tec.de> <51325617.80102@gmx.de> <BLU0-SMTP686B9725460575E9DE1B0597F90@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org, James.Bottomley@hansenpartnership.com
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP686B9725460575E9DE1B0597F90@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 03/03/2013 10:25 PM, John David Anglin wrote:
> Hi Helge,
> 
> On 2-Mar-13, at 2:42 PM, Helge Deller wrote:
> 
>> Applied to my fixes-for-3.9-latest branch at
>> http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git
> 
> 
> I built the above branch yesterday.  We seem to have a regression in behavior.
> My build of perl 5.14.2-18 failed with the following error:
> 
> ....
> Failed 1 test out of 2039, 99.95% okay.
>         op/sigdispatch.t
> ### Since not all tests were successful, you may want to run some of
> ### them individually and examine any diagnostic messages they produce.
> ### See the INSTALL document's section on "make test".
> ### You have a good chance to get more information by running
> ###   ./perl harness
> ### in the 't' directory since most (>=80%) of the tests succeeded.
> ### You may have to set your dynamic library search path,
> ### LD_LIBRARY_PATH, to point to the build directory:
> ###   setenv LD_LIBRARY_PATH `pwd`; cd t; ./perl harness
> ###   LD_LIBRARY_PATH=`pwd`; export LD_LIBRARY_PATH; cd t; ./perl harness
> ###   export LD_LIBRARY_PATH=`pwd`; cd t; ./perl harness
> ### for csh-style shells, like tcsh; or for traditional/modern
> ### Bourne-style shells, like bash, ksh, and zsh, respectively.
> u=18.18  s=28.38  cu=1367.86  cs=974.72  scripts=2039  tests=465774
> make[1]: *** [test] Error 1
> make[1]: Leaving directory `/home/dave/debian/perl/perl-5.14.2'
> make: *** [perl.static] Error 2
> dpkg-buildpackage: error: debian/rules build gave error exit status 2
> Build command 'cd perl-5.14.2 && dpkg-buildpackage -b -uc' failed.
> 
> I ran ./perl harness again and the same test failed.  As this looked
> like a kernel issue, I tried the build again with 3.7.6+ and had a successful
> build.

Hi Dave,

please pull Linus tree again on top.
There is a patch-fix from Al Viro regarding signals....
Just a guess....and 3.9 is still not stable...

Helge
