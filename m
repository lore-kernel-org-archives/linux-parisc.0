From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Tue, 18 Oct 2011 10:20:24 -0400
Message-ID: <4E9D8B28.2060901@bell.net>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca> <20111017152358.GA3518@glitch> <CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com> <4E9C6F9E.5000605@bell.net> <4E9C9643.6030309@systemhalted.org> <4E9C9971.5090806@bell.net> <20111017215734.GA28681@glitch> <BLU0-SMTP3369C2E5C7F1EBE9C97C5B97E40@phx.gbl> <CAGH6_ppwkasTO4U3xg4ito9-QGCd5v-G=u-jqj9CXTXjTWCrFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Domenico Andreoli <cavok@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAGH6_ppwkasTO4U3xg4ito9-QGCd5v-G=u-jqj9CXTXjTWCrFA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/18/2011 5:33 AM, Domenico Andreoli wrote:
> Unfortunately I've never been able to build eglibc with the supposed
> fix, indeed I'm running an hacked udev on libc 2.11.something.
>
> BTW, how did you successfully build it? you said you build a good part
> of unstable, I would like to do the same and maybe upload some key
> packages...
>
The dependency issues have been somewhat tricky.  I recall that I did my 
initial
2.13 build with my own tool chain builds (binutils and gcc).  I wanted 
to ensure that
I had the binutils fix for non equivalent aliases.  There were also some 
compiler
fixes that I wanted.

Carlos sent me his current glibc patch set and I integrated them into 
the 2.13-10
patches.  I could send you my current two patches tonight.  Carlos also 
has these
updates.  This wasn't completely straight forward as there were some 
conflicts
with the existing patch set.  The main goal was to fix a bug in thread stack
allocation (tst-timer1?).

I used 2.13-10 as my starting source for applying Carlos' changes.  I 
had built
2.13-13 previously, but I removed the source.  I had tried building and 
installing
2.13-14.  However, it wouldn't install without breaking my installed 
version of perl.
So, I had to go back to 2.13-10.

Once I had the glibc multiarch support installed, then I built the 
latest unstable
versions of binutils, gcc-4.4, gnat-4.4, gcj-4.4, gcc-4.5, gcc-4.6, 
etc.  I'm still using
gcc-4.4 as my default.

Next, I had to update perl and python.  This involved updating a bunch 
of libraries.
There was more than one dependency loop where I had to force 
installation of a
library because I needed it to build the library that the installation 
depended on.

Part of the problem is I was starting from a system updated to 
testing/unstable.
Many of the "-dev" packages for libraries had disappeared as newer versions
were built and uploaded to the servers.  I couldn't really go back 
without breaking
a huge amount of stuff.

So, I just plunged forward.  It's not really possible to support GCC 
without having
the new stuff in unstable.

I have kept all my .deb files and can provide them if needed.

I had hoped that we would get a buildd going by now.  If we wait much 
longer,
the dependencies will be a killer.

Based on my experience, a fair number of packages need some manual
intervention to get them to build.  For example, with glibc, it probably 
is necessary
to disable testsuite checking.  With perl and python, it may be 
necessary to manually
kill tests that  hang, etc.

Dave

-- 
John David Anglin    dave.anglin@bell.net

