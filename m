From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] DIFF use 6-regs in copy_user_page_asm
Date: Tue, 4 Jan 2005 08:51:19 -0600
Message-ID: <200501040851.19806.mszick@wolfbutter.com>
References: <20050103061910.GJ15061@colo.lackof.org>
	<20050104061342.GE18497@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050104061342.GE18497@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue January 4 2005 00:13, Randolph Chung wrote:
> > This patch adds one more cycle between the load and store of a
> > given register by using three pairs of registers instead of two.
> > I had previously quoted one of the PA-8xxx papers that indicated
> > L1 cache was 2 cycles latency.
> > With this diff, the unrolled part of the loop now meets that.
> > The prolog and epilogue obviously cannot.
> > 
> > If anyone can show me a workload that improves with this diff,
> > I'll apply it. Otherwise it's just an academic excercise.
> 
> i'd like to see numbers too, but i doubt you will see any. it appears
> that at least newer PA cpus do a sufficient amount of internal
> instruction reordering that you don't see a difference as long as there
> are enough pending instructions to keep the pipeline busy.
> 
One other possibility to keep in mind when testing: this is an
io sequence, no heavy register-register computations.

If the 4-regs + internal reordering has already saturated the
cpu-external busses...

Then even if the cpu-core can execute the 6-regs + internal
reordering more effectively, you will never see it outside
of the cpu.

You might have to borrow a buss analyzer from the hardware
lab to see if this is effecting your tests.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
