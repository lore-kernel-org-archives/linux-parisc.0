From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] BUG 2.6.11-rc4-pa1 XFS data page fault
Date: Sun, 20 Feb 2005 17:04:12 -0700
Message-ID: <20050221000412.GA30800@colo.lackof.org>
References: <20050216065539.GB5251@colo.lackof.org>
	<20050219222723.GA12572@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050219222723.GA12572@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Feb 19, 2005 at 03:27:23PM -0700, Grant Grundler wrote:
> This suggests there is a problem with Astro/Elroy programming
> where "Sprockets" firmware (for Astro based workstations) does
> something different than PAT PDC firmware on a500.

This was not the only issue, but the first one.
Two more bits in the IOC_CTRL register were getting
set on j6k (vs A500):
	D4	Disable 4-byte coalescing. Apperently could
		result in 12 byte transfers (4 byte-lanes not
		enabled on the second 8 byte transaction)
		that "some devices don't tolerate".
		Documentation doesn't list these devices.

	DD	Disable Distributed LMMIO coalescing.
		Disables coalescing for all PIO MMIO transactions
		to addresses below distributed LMMIO ranges.
		Directed LMMIO and other GMMIO ranges
		may still coalesce (e.g. graphics buffers usually
		get a directed range).

Spew ran for an hour and managed to push 80+ GB
of data to 6 disks. I'll commit this change shortly.

Then I got ambitious and ran "make clean" and XFS panic'd.
I expect this is a different problem.
Same one I've seen before:

[ no backtrace :^( ]

Kernel Fault: Code=26 regs=000000006cd40c10 (Addr=00000000000000c8)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000011001111111100001111 Not tainted
r00-03  0000000000000000 000000001026d1d0 000000000028afa8 0000000000000000
r04-07  0000000000243000 0000000000000000 0000000000000000 00000000fff00800
r08-11  00000000156b60b8 0000000000000000 0000000000000008 0000000000000000
r12-15  0000000000000008 0000000000000000 0000000000000000 000000006cd40768
r16-19  0008000000000001 0000000000000000 0000000000000022 0000000000000000
r20-23  0000000000000000 0000000000000000 00000000fdfafbf8 0000000000000000
r24-27  0000000000000000 0000000000000000 00000000fdfafb38 00000000105424c0
r28-31  00000000fdfafb38 000000006cd40c70 000000006cd40c10 00000000a0000000
sr0-3   000000000044d000 0000000000000000 0000000000000000 000000000044f000
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000000028afc0 000000000028afdc


Press Q/q to quit, Enter to continue: 
 IIR: 50d30190    ISR: 0000000000000000  IOR: 00000000000000c8
 CPU:        0   CR30: 000000006cd40000 CR31: 000000001050c000
 ORIG_R28: 00000000fda4fa80
 IAOQ[0]: xfs_btree_init_cursor+0x70/0x1b8 [xfs]
 IAOQ[1]: xfs_btree_init_cursor+0x8c/0x1b8 [xfs]
 RP(r2): xfs_btree_init_cursor+0x58/0x1b8 [xfs]
Kernel panic - not syncing: Kernel Fault
 

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
