From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Fri, 15 Jul 2005 20:08:43 -0400 (EDT)
Message-ID: <200507160008.j6G08hdg005634@hiauly1.hia.nrc.ca>
References: <20050715234448.GA5314@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050715234448.GA5314@systemhalted.org> from "Carlos O'Donell"
	at Jul 15, 2005 07:44:48 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> However, the following is troubling and where trouble goes, so does the
> blame on the compiler.
> 
> test-float.out (Non-inline float):
>  Test suite completed:
>    2599 test cases plus 2384 tests for exception flags executed.
> -  39 errors occurred.
> +  4363 errors occurred.
> 
> test-double.out (Non-inline double):
>  Test suite completed:
>    2624 test cases plus 2399 tests for exception flags executed.
> -  38 errors occurred.
> +  4388 errors occurred.
> 
> Although the numbers don't add up with the errors a cursory check shows
> *none* of the non-inline math tests passed.

I don't want to throw stones but I posted a message to parisc two
days ago indicating that we have at least one kernel bug in its math
emulation ;)

Ok, PA 2.0 support could be suspect.  I doubt very much there are
major FP issues with PA 1.1.  In PA 1.1, essentially all the operations
are supported in hardware (I hate assist).  There's an issue with
complex support using PA 1.0 but if the compiler didn't die that's
not likely the problem.  That's fixed in main.  Finally, you've got
the glibc issue in handling 64-bit long doubles.  I would suspect a
glibc issue first.  GCC doesn't have much to do with exception support
or control of rounding modes, although you would think the compiler
would need to know about rounding mode.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
