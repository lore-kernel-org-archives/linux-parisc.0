Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E7294829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 28 Sep 2002 11:55:45 -0600 (MDT)
Date: Sat, 28 Sep 2002 10:59:51 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020928175951.GB6868@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] FWD: Bug#162690: [parisc]gcc 3.x produces openssl test code that SEGVs with -march=2.0  and optimization >0
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

perhaps someone here can look at this?

randolph

----- Forwarded message from Kevin Carson <kevincarson@shaw.ca> -----

Subject: Bug#162690: [parisc]gcc 3.x produces openssl test code that SEGVs with -march=2.0  and optimization >0
Reply-To: Kevin Carson <kevincarson@shaw.ca>, 162690@bugs.debian.org
Date: Sat, 28 Sep 2002 10:21:01 -0700
From: Kevin Carson <kevincarson@shaw.ca>
To: submit@bugs.debian.org
X-Mailing-List: <debian-gcc@lists.debian.org> archive/latest/3552

Package: gcc

Running Debian unstable on PA-RISC platform  (C160 Workstation with 160MHz
PA-8000 CPU)

Compiling openssl 0.9.6g with any level of optimization for PA1.1 produces
code that passes all tests ("make test") and benchmarks ("openssl speed")
successfully.  Using -march=2.0 flag produces code that only runs
successfully at optimization level "-O0"  Any higher optimization fails some
of the test suite (reliably in test/exptest.c for instance).

I've observed this problem with gcc 3.0.4-8 and gcc-3.2.1-0pre2

libc6 2.2.5-14.3

"linux-parisc" configuration string in openssl Configure script for
successful run is
"gcc-3.2:-DB_ENDIAN -DNO_ASM -DTERMIO -O0 -march=2.0 -Wall::::::"

"linux-parisc" configuration string in openssl Configure script for failed
run is "gcc-3.2:-DB_ENDIAN -DNO_ASM -DTERMIO -O1 -march=2.0 -Wall::::::"

Run test by:

cd openssl-0.9.6g
<edit Configure to contain string above in single line>

make clean
./Configure linux-parisc
make test

if optimization is >0 run will fail with segmentation violation in exptest
(tests various operations on the big number library)

Kevin



-- 
To UNSUBSCRIBE, email to debian-gcc-request@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

----- End forwarded message -----
