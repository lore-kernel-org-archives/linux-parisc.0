From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] DIFF use 6-regs in copy_user_page_asm
Date: Tue, 4 Jan 2005 16:39:20 -0700
Message-ID: <20050104233920.GB2857@colo.lackof.org>
References: <20050103061910.GJ15061@colo.lackof.org>
	<20050104061342.GE18497@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
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

On Mon, Jan 03, 2005 at 10:13:42PM -0800, Randolph Chung wrote:
> i'd like to see numbers too, but i doubt you will see any.

I hope the new cpup.c will help us provide precise values.


[ The following is more intended for folks like Joel than Randolph.
 I'm pretty sure Randolph understands how CPUs work. ]

>  it appears
> that at least newer PA cpus do a sufficient amount of internal
> instruction reordering that you don't see a difference as long as there
> are enough pending instructions to keep the pipeline busy.

The pipeline on PA-8x00 can load 4 instructions at a time.
How those 4 instructions get executed depend on interlocks (e.g.
register is in still use by previous insn) and if the CPU/mem units are
available.  AFAIK, PA8x00 processors support 2 loads/cycle,
2 stores/cycle, 2 shift+merge ops/cycle, 2 FP Div/cycle, etc. 
"Keeping the pipeline busy" is just as much a function of instruction
scheduling by programmer/compiler as re-ordering by the CPU.
One really needs to keep track of which resources are available.

Anytime a resource is not available, the pipeline "stalls". 
ia64 calls this "bubbles" and the best description I've found
of "bubbles" is in the MySQL perf paper by Philippe Bonnet:
	http://www.gelato.org/resources/bookspapers.php

(or http://www.gelato.org/pdf/mysql_itanium2_perf.pdf)

While parisc might be more primitive in how it deals with "stalls"
than ia64, I expect most of the same principles apply to both when
writing code.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
