From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 64-bit Userland
Date: Mon, 30 Oct 2006 20:04:51 -0500 (EST)
Message-ID: <200610310104.k9V14qZ6021106@hiauly1.hia.nrc.ca>
References: <119aab440610300743y2eae2a5fje17535527eb17860@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: alan.mock@gmail.com,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440610300743y2eae2a5fje17535527eb17860@mail.gmail.com>
	from "Carlos O'Donell" at Oct 30, 2006 10:43:25 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Post the results of the testsuite to the list.

I regularly post GCC test results to <http://gcc.gnu.org/ml/gcc-testresults/>.

At the moment, there's some small difference in results using 32 and 64-bit
kernels.  The 22_locale/time_get/get_date/wchar_t/4.cc execution test only
fails on my c3k with a 32-bit kernel.  Also, gfortran.dg/cray_pointers_2.f90
tests sometimes file on 32-bit kernels.  There are still occasional problems
with expect/tcl truncating the output in tests that generate a lot of output.

There are some libjava fails that appear to be pthread problems, but
I also see similar failures on hpux.  So, I tend to blame the libjava
implementation which is quite complex and fun to debug.

Otherwise, we are as good as x86 ;)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
