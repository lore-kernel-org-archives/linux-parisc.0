From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 05 May 2005 18:41:06 +0000
Message-ID: <427A68C2.90907@tiscali.be>
References: <200505051707.j45H7sH3016561@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: lamont@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200505051707.j45H7sH3016561@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



John David Anglin wrote:
>>Come back to expect pb:
>>	o I just grab dpkg src and while I rebuild it localy I noticed that:
>>./configure [snip] --enable-threads
>>[snip]
>>checking for building with threads... configure: WARNING: Expect is not fully thread-enabled.  Although significant work has been 
>>done towards that goal, it is not complete.  Continue compiling at your own risk.
> 
> 
> I don't configure it using --enable-threads.  I've been using something
> like this:
> 
> # ../configure  --prefix=/home/dave/opt/gnu --host=hppa-linux --build=hppa-linux --with-tcl=/usr/lib/tcl8.3 --with-tk=/usr/lib/tk8.3 --with-tk=/usr/lib/tk8.3 --with-tclinclude=/usr/include/tcl8.3/tcl-private --with-tkinclude=/usr/include/tcl8.3/tk-private
> 
> I used the following CFLAGS:
> 
> CFLAGS = -O1 -g -ansi -D_SVID_SOURCE -D_POSIX_SOURCE
> 
> -ansi and the defines are because of the wait flag issue.
> 
Ok just rebuild my own dpkg with this interesting options ...

> 
>>	o I also grab the latest 5.43.0 release and btw lfs recommended the patch: expect-5.43.0-spawn-1.patch
>>	  <http://lfs-matrix.net/lfs/view/development/chapter05/expect.html>
>>	? do you already test it?
> 
> 
> I'm running 5.43.0 on one system.  I haven't tried the patch.
> 
and also with this patch

run autoexpect as simple test seems ok ;-)

I will try to rebuild gcc-4.0 dpkg now...

Thanks for advise,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
