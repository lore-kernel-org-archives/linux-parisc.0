Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id A770A4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Aug 2002 09:01:49 -0600 (MDT)
Received: from carlos by systemhalted with local (Exim 3.35 #1 (Debian))
	id 17go0j-0005kL-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Aug 2002 11:00:05 -0400
Date: Mon, 19 Aug 2002 11:00:05 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020819150005.GI20487@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] LTP Results - Should we be unhappy? :)
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

pa,

On a whim, I was talking to Willy about porting cerberus to parisc
(which I did... just by taking out the cpu specific test :) and he
mentioned LTP. I had completely forgoten about LTP!

No work required, LTP compiled out of the package, and I began 
running the test on an A500 2.4.19-pa3 (non-smp 64-bit).

To my surprise we don't even make it through all the tests!

- File Locking - 
fcntl14 - Many failures
fcntl15 - Passes
fcntl16 - Processes get stuck in wait (when they obviously shouldn't).

To view the test results, including the point at which I signaled
the waiting processes.

http://www.baldric.uwo.ca/~carlos/LTP/ltp-run-2002-08-19.out

If anyone is bored, interested, looking for something to do on
a slow evening :)

c.
