From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [RFC] Optimi[zs]e copy_*_user routines
Date: Fri, 17 Sep 2004 08:34:39 -0700
Message-ID: <20040917153439.GI28659@tausq.org>
References: <20040910000032.GJ28659@tausq.org>
	<20040916191856.GF28659@tausq.org>
	<20040917144813.GH28936@baldric.uwo.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040917144813.GH28936@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> What tests have you run against this?
> I think the original version was pretty stable on my 32-bit UP c3k.
> Included kernel compiles and some lws tests.

i've done kernel compiles at various -j levels, and run some lmbench
benchmarks. 

as you know, there's also a memcpy testsuite that verified the main
copying algorithm for various block sizes and alignments.

i also have a small test program that is able to exercise the 
exception cases in the code, so i've tested the various load/store 
exception cases in the two functions (pa_memcpy and copy_dstaligned).

currently, the exception test program is a bit indirect (it requires a
lot of manual work). i have an idea for a better automated testsuite
which still needs to be implemented.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
