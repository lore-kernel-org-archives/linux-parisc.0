From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Comments?
Date: Sat, 5 Mar 2005 15:33:20 -0500 (EST)
Message-ID: <200503052033.j25KXK8x007561@hiauly1.hia.nrc.ca>
References: <20050305194652.GG23803@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050305194652.GG23803@baldric.uwo.ca> from "Carlos O'Donell" at
	Mar 5, 2005 02:46:53 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I think we have somehow broken __cffc.  I did a binutils build
> > yesterday and various ld tests are now failing.  These are tests
> > that compare function pointers.
> 
> I didn't feed anything new into debian-glibc. All my patches have always
> strived to keep __cffc working, if I messup the function pointer
> comparison I get a slew of glibc testsuite failures which I always
> patchup by making sure __cffc works :)

I haven't touched fptr.c either, although there is a change in GCC
4.0 with respect to canonicalization.  I'm using the debian glibc,
2.3.2.ds1-20, on the system on which I noticed this problem.

2004-12-12  Nathanael Nerode  <neroden@gcc.gnu.org>
	    John David Anglin  <dave.anglin@nrc-cnrc.gc.ca>

	PR middle-end/17564
	* dojump.c (do_compare_and_jump): Only canonicalize function pointers
	in a comparison if both sides are function pointers.

I checked that the binutils testsuite fails with 3.4, so I don't think
the problem is a GCC issue.  I was going to try and see what's happening
this afternoon.  I've been working on some testsuite cleanups today.

Another thing that I need to figure out is the cause of the libstdc++
fails:

hiauly6 4.0.0:
FAIL: 27_io/basic_filebuf/sgetn/char/1-in.cc execution test
FAIL: 27_io/basic_filebuf/sgetn/char/1-io.cc execution test
FAIL: 27_io/basic_filebuf/sgetn/char/2-in.cc execution test
FAIL: 27_io/basic_filebuf/sgetn/char/2-io.cc execution test
FAIL: 27_io/basic_filebuf/underflow/wchar_t/11603.cc execution test
FAIL: 27_io/basic_istream/readsome/char/6746-2.cc execution test
FAIL: 27_io/basic_istream/readsome/wchar_t/6746-2.cc execution test

gsyprf11 4.1.0:
FAIL: 22_locale/messages/members/char/1.cc execution test
FAIL: 22_locale/messages/members/char/2.cc execution test
FAIL: 22_locale/messages/members/char/wrapped_env.cc execution test
FAIL: 22_locale/messages/members/char/wrapped_locale.cc execution test
FAIL: 22_locale/messages_byname/named_equivalence.cc execution test

It's strange that the two systems have a completely different
sets of testsuite fails.  There aren't any fails under hpux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
