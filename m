Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE6724829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Apr 2003 00:24:18 -0600 (MDT)
Date: Wed, 16 Apr 2003 23:19:58 -0700
From: Randolph Chung <tausq@debian.org>
To: doko@gcc.gnu.org, debian-gcc@lists.debian.org,
	gcc-bugs@gcc.gnu.org, gcc-prs@gcc.gnu.org, nobody@gcc.gnu.org,
	parisc-linux@lists.parisc-linux.org, gcc-gnats@gcc.gnu.org,
	danglin@gcc.gnu.org
Subject: Re: [parisc-linux] Re: c++/10235: [3.3 regression] [HPPA] internal compiler error: in final_scan_insn, at final.c:2099
Message-ID: <20030417061958.GU25257@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030417055739.19189.qmail@sources.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030417055739.19189.qmail@sources.redhat.com>
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

In reference to a message from doko@gcc.gnu.org, dated Apr 17:
> Synopsis: [3.3 regression] [HPPA] internal compiler error: in final_scan_insn, at final.c:2099
> 
> State-Changed-From-To: feedback->closed
> State-Changed-By: doko
> State-Changed-When: Thu Apr 17 05:57:39 2003
> State-Changed-Why:
>     sucessfully built as well with 3.3 20030412 (current Debian package)
> 
> http://gcc.gnu.org/cgi-bin/gnatsweb.pl?cmd=view%20audit-trail&database=gcc&pr=10235

really? it still ICEs for me with that version. The test case was from
the nurbs++ package.

tausq@ios:~/debian/nurbs++-3.0.11$ g++ -v
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.3/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,objc,ada,treelang --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-sjlj-exceptions --enable-clocale=gnu --enable-debug --enable-objc-gc hppa-linux
Thread model: posix
gcc version 3.3 20030412 (Debian prerelease)

tausq@ios:~/debian/nurbs++-3.0.11$ g++ -DHAVE_CONFIG_H -I. -I. -I../include -I/usr/X11R6/include -I../include -I../matrix -I../image -I../numerical -g -O2 -fno-implicit-templates -c f_nurbs.cpp -MT f_nurbs.lo -MD -MP -MF .deps/f_nurbs.TPlo  -fPIC -DPIC -o .libs/f_nurbs.lo
nurbs.cpp: In member function `void PLib::NurbsCurve<T, N>::globalInterpD(const
   PLib::Vector<PLib::Point_nD<T, D> >&, const PLib::Vector<PLib::Point_nD<T,
   D> >&, int, int, T) [with T = float, int N = 2]':
f_nurbs.cpp:85:   instantiated from here
nurbs.cpp:3060: internal compiler error: in final_scan_insn, at final.c:2099
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.

Maybe the test case needs fixing :) Dave, I'll put a preprocessed file
in gsyprf11:~tausq/f_nurbs.ii.gz. It's >100k so i won't post it here 
for now.  :)

i'm in the process of building a new cvs snapshot to retry.

thanks,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
