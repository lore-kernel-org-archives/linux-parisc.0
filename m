From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] DIFF use 6-regs in copy_user_page_asm
Date: Tue, 4 Jan 2005 13:09:55 -0700
Message-ID: <20050104200955.GB28074@colo.lackof.org>
References: <20050103061910.GJ15061@colo.lackof.org>
	<200501040851.19806.mszick@wolfbutter.com>
	<20050104160227.GA28074@colo.lackof.org>
	<200501041142.44400.mszick@wolfbutter.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Michael S. Zick" <mszick@wolfbutter.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200501041142.44400.mszick@wolfbutter.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 04, 2005 at 11:42:44AM -0600, Michael S. Zick wrote:
> > I don't. If 6-regs works better then I use it.
> Agreed,
> If you can find a difference now.

I can using CR16. That's what I was proposing before.

> I was speaking of the other case:
> If they appear to work the same now.

Yes, but I don't need an analyzer to guess at what might be causing
the bottleneck. The "Linux Way" is to keep trying different variants
until we find a better one (or get fed up). I know using an analyzer
is more precise _once_ it's setup.

Joel,
I've hacked your cpup1.c and committed it build-tools.
Please send me diffs in the future.
You would have noticed that you reference %r26 directly in two
of the asm statements.

The new version implements most of what I was proposing:
o use CR16 to measure copy_user_page_asm()
o run multiple iterations to avoid page faults/TLB activity

o drops -DV1 code (4ld/4st in 64-bit case)
o implements -DUSE6REGS
o uses 64MB src/dest buffer

grundler <536>gcc -O2 -o cpup0 cpup.c
grundler <537>gcc -march=2.0 -DLP64 -o cpup2 cpup.c
grundler <538>gcc -march=2.0 -DLP64 -DDUSE6REGS -o cpup3 cpup.c
grundler <539>./cpup0
          First Loop : min  14393  avg  17156  median  16219
         Later Loops : min   9696  avg  10819  median  10432
grundler <540>./cpup2
          First Loop : min  11381  avg  14120  median  13168
         Later Loops : min   5844  avg   7695  median   7595
grundler <541>./cpup3
          First Loop : min  11441  avg  14102  median  13167
         Later Loops : min   5898  avg   7702  median   7594

This might be useful for measuring cost of TLB insertion too.

Please verify the code is generating the stats properly before
taking the above numbers as The Truth.
(650 Mhz A500 running SMP 2.6.10-rc3-pa6)

I also noticed that even this gets different results on the first
vs successive invocations:
grundler <545>./cpup3
          First Loop : min  11277  avg  17749  median  13143
         Later Loops : min   5806  avg   8156  median   7589
grundler <546>./cpup3
          First Loop : min  11217  avg  14250  median  13154
         Later Loops : min   5904  avg   7726  median   7604
grundler <547>./cpup3
          First Loop : min  11528  avg  14147  median  13162
         Later Loops : min   5877  avg   7722  median   7600
grundler <548>./cpup3
          First Loop : min  11548  avg  14202  median  13177
         Later Loops : min   5866  avg   7727  median   7600
grundler <549>./cpup3
          First Loop : min  11577  avg  14150  median  13173
         Later Loops : min   5877  avg   7729  median   7607

Ignoring the first invocation, the results are quite precise: +- 4/7725

Adding another "ldw 192(%0), %%r0" to the bottom of the loop
reduced that even a bit more. We only prefectch one of the
two cachelines processed in the loop before.
The 5th run output was:
grundler <561>./cpup3 
          First Loop : min   9831  avg  12950  median  12000
         Later Loops : min   5790  avg   7529  median   7375

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
