From: Ryan Bradetich <rbradetich@uswest.net>
Subject: Re: [parisc-linux] more cpup.c results
Date: Wed, 05 Jan 2005 01:40:56 -0700
Message-ID: <1104914456.8221.34.camel@beavis>
References: <20050105055412.68E06495698@palinux.hppa>
	<20050105061613.GA12455@colo.lackof.org>
Reply-To: rbradetich@uswest.net
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050105061613.GA12455@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Grant,

> Can folks try this on PA8000 and PA82000 for me?
> Check /proc/cpuinfo if you aren't sure what you have.

processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8200 (PCX-U+)
cpu MHz         : 200.000000
model           : 9000/782/C200+
model name      : Raven U 200 (9000/780/C200)
hversion        : 0x000059d0
sversion        : 0x00000481
I-cache         : 512 KB
D-cache         : 1024 KB (WB, 0-way associative)
ITLB entries    : 120
DTLB entries    : 120 - shared with ITLB
bogomips        : 395.26
software id     : 2005736878

> Should be a simple cut/paste of 4 lines to a shell prompt:
> 
> gcc -O2 -o cpup0 cpup.c
> gcc -O2 -march=2.0 -DLP64 -o cpup2 cpup.c
> gcc -O2 -march=2.0 -DLP64 -DUSE6REGS -o cpup3 cpup.c
> for i in 1 2 3 4 5; do echo TEST $i; ./cpup0; ./cpup2; ./cpup3; done

This is on a 64-bit kernel:
$ uname -a
Linux vega 2.6.10-pa3 #1 Sun Jan 2 14:28:36 MST 2005 parisc64 GNU/Linux

TEST 1
          First Loop : min   9990  avg  11444  median  10352
         Later Loops : min   6290  avg   8673  median   8885
          First Loop : min   8758  avg  10370  median   9312
         Later Loops : min   5842  avg   7168  median   7024
          First Loop : min   8701  avg  10277  median   9215
         Later Loops : min   5670  avg   7244  median   7124
TEST 2
          First Loop : min   9990  avg  11451  median  10353
         Later Loops : min   6197  avg   8669  median   8880
          First Loop : min   8748  avg  10379  median   9318
         Later Loops : min   5768  avg   7166  median   7022
          First Loop : min   8657  avg  10280  median   9208
         Later Loops : min   5773  avg   7239  median   7123
TEST 3
          First Loop : min   9993  avg  11442  median  10353
         Later Loops : min   6278  avg   8670  median   8880
          First Loop : min   8745  avg  10408  median   9318
         Later Loops : min   5804  avg   7163  median   7023
          First Loop : min   8681  avg  10340  median   9266
         Later Loops : min   5663  avg   7238  median   7120
TEST 4
          First Loop : min   9990  avg  11453  median  10347
         Later Loops : min   6282  avg   8661  median   8877
          First Loop : min   8751  avg  10400  median   9324
         Later Loops : min   5750  avg   7171  median   7024
          First Loop : min   8622  avg  10283  median   9213
         Later Loops : min   5680  avg   7235  median   7119
TEST 5
          First Loop : min  10032  avg  11442  median  10348
         Later Loops : min   6224  avg   8688  median   8884
          First Loop : min   8799  avg  10396  median   9323
         Later Loops : min   5751  avg   7165  median   7021
          First Loop : min   8622  avg  10286  median   9221
         Later Loops : min   5653  avg   7240  median   7120



This is on a 32-bit kernel:
$ uname -a
Linux vega 2.6.10-pa5 #1 Wed Jan 5 01:14:00 MST 2005 parisc GNU/Linux

TEST 1
          First Loop : min  10924  avg  11555  median  11090
         Later Loops : min   7744  avg   8196  median   8130
          First Loop : min   9584  avg  10251  median   9790
         Later Loops : min   6451  avg   6836  median   6784
          First Loop : min   9487  avg  10104  median   9673
         Later Loops : min   6202  avg   6604  median   6550
TEST 2
          First Loop : min  10927  avg  11553  median  11097
         Later Loops : min   7687  avg   8193  median   8130
          First Loop : min   9594  avg  10267  median   9790
         Later Loops : min   6451  avg   6853  median   6784
          First Loop : min   9477  avg  10117  median   9654
         Later Loops : min   6243  avg   6606  median   6549
TEST 3
          First Loop : min  10943  avg  11549  median  11104
         Later Loops : min   7670  avg   8197  median   8130
          First Loop : min   9607  avg  10255  median   9790
         Later Loops : min   6451  avg   6836  median   6783
          First Loop : min   9487  avg  10144  median   9674
         Later Loops : min   6216  avg   6604  median   6550
TEST 4
          First Loop : min  10924  avg  11527  median  11083
         Later Loops : min   6848  avg   8176  median   8118
          First Loop : min   9610  avg  10260  median   9810
         Later Loops : min   6451  avg   6837  median   6784
          First Loop : min   9493  avg  10140  median   9670
         Later Loops : min   6215  avg   6605  median   6552
TEST 5
          First Loop : min  10924  avg  11538  median  11087
         Later Loops : min   7703  avg   8191  median   8132
          First Loop : min   9583  avg  10236  median   9793
         Later Loops : min   6451  avg   6837  median   6783
          First Loop : min   9487  avg  10132  median   9674
         Later Loops : min   6171  avg   6606  median   6550


The K460 is a 8000 processor ... I'll see if I can get the K460
installed and updated to give you results from that system as well.  I
am also working on getting you results from a 715/100 
as well (currently in the middle of a new debian install).

Thanks,

- Ryan

> thanks,
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
-- 
Ryan Bradetich <rbradetich@uswest.net>

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
