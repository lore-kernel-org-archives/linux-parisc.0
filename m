From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 24 Mar 2005 11:19:28 -0500 (EST)
Message-ID: <200503241619.j2OGJScZ000411@hiauly1.hia.nrc.ca>
References: <kfhwtrx2myr.fsf@csclub.uwaterloo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: ja2morri@csclub.uwaterloo.ca (James A. Morrison)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <kfhwtrx2myr.fsf@csclub.uwaterloo.ca> from "James A. Morrison" at
	Mar 24, 2005 08:27:24 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>  GCC 4 already produces the same code for these functions*.  Attached is the
> final_cleanup dumb of an O2 build of this file.

My impression is that GCC 4 is doing a better job with 64-bit code
than previous versions although I haven't run any benchmarks.  It
could be as much as a 10% improvement in performance on average.
However, 64-bit code is still slower than 32-bit code.

>>From a PA standpoint, GCC 4 is ready for serious testing.  All testsuite
bugs have been squashed in C and C++.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
