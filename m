From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] DIFF use 6-regs in copy_user_page_asm
Date: Tue, 4 Jan 2005 19:00:43 -0500 (EST)
Message-ID: <200501050000.j0500iKD024978@hiauly1.hia.nrc.ca>
References: <20050104233920.GB2857@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050104233920.GB2857@colo.lackof.org> from "Grant Grundler" at
	Jan 4, 2005 06:39:20 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The pipeline on PA-8x00 can load 4 instructions at a time.
> How those 4 instructions get executed depend on interlocks (e.g.
> register is in still use by previous insn) and if the CPU/mem units are
> available.  AFAIK, PA8x00 processors support 2 loads/cycle,
> 2 stores/cycle, 2 shift+merge ops/cycle, 2 FP Div/cycle, etc. 
> "Keeping the pipeline busy" is just as much a function of instruction
> scheduling by programmer/compiler as re-ordering by the CPU.
> One really needs to keep track of which resources are available.

This is what the GCC machine definitions says:

;; The PA8000 has a large (56) entry reorder buffer that is split between
;; memory and non-memory operations.
;;
;; The PA8000 can issue two memory and two non-memory operations per cycle to
;; the function units, with the exception of branches and multi-output
;; instructions.  The PA8000 can retire two non-memory operations per cycle
;; and two memory operations per cycle, only one of which may be a store.
;;
;; Given the large reorder buffer, the processor can hide most latencies.
;; According to HP, they've got the best results by scheduling for retirement
;; bandwidth with limited latency scheduling for floating point operations.
;; Latency for integer operations and memory references is ignored.
;;
;;
;; We claim floating point operations have a 2 cycle latency and are
;; fully pipelined, except for div and sqrt which are not pipelined and
;; take from 17 to 31 cycles to complete.
;;
;; It's worth noting that there is no way to saturate all the functional
;; units on the PA8000 as there is not enough issue bandwidth.

Comments?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
