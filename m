From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [RFC] Optimi[zs]e copy_*_user routines
Date: Fri, 17 Sep 2004 12:23:30 -0400
Message-ID: <20040917162329.GU28936@baldric.uwo.ca>
References: <20040910000032.GJ28659@tausq.org>
	<20040916191856.GF28659@tausq.org>
	<20040917144813.GH28936@baldric.uwo.ca>
	<20040917153439.GI28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040917153439.GI28659@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Randolph,

> i've done kernel compiles at various -j levels, and run some lmbench
> benchmarks. 

Good.

> as you know, there's also a memcpy testsuite that verified the main
> copying algorithm for various block sizes and alignments.

Yup. I ran those first.

> i also have a small test program that is able to exercise the 
> exception cases in the code, so i've tested the various load/store 
> exception cases in the two functions (pa_memcpy and copy_dstaligned).

Cool, that's the most important cases to test. My lws testcase exercises
teh exception code, but obviously not the exception cases in pa_memcpy
and copy_dstaligned.

> currently, the exception test program is a bit indirect (it requires a
> lot of manual work). i have an idea for a better automated testsuite
> which still needs to be implemented.

Kernel module? :)

If you did it in C it could be used for a lot of arches.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
