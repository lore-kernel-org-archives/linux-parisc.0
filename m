From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] DIFF use 6-regs in copy_user_page_asm
Date: Mon, 3 Jan 2005 22:13:42 -0800
Message-ID: <20050104061342.GE18497@tausq.org>
References: <20050103061910.GJ15061@colo.lackof.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050103061910.GJ15061@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> This patch adds one more cycle between the load and store of a
> given register by using three pairs of registers instead of two.
> I had previously quoted one of the PA-8xxx papers that indicated
> L1 cache was 2 cycles latency.
> With this diff, the unrolled part of the loop now meets that.
> The prolog and epilogue obviously cannot.
> 
> If anyone can show me a workload that improves with this diff,
> I'll apply it. Otherwise it's just an academic excercise.

i'd like to see numbers too, but i doubt you will see any. it appears
that at least newer PA cpus do a sufficient amount of internal
instruction reordering that you don't see a difference as long as there
are enough pending instructions to keep the pipeline busy.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
