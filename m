From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] kernel crash in cache_alloc_refill (a500, 64-bit,
	UP)
Date: Sun, 19 Sep 2004 23:41:17 -0600
Message-ID: <20040920054117.GA6895@colo.lackof.org>
References: <20040920024506.GT17238@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040920024506.GT17238@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Sep 19, 2004 at 10:45:07PM -0400, Carlos O'Donell wrote:
> pa,
> 
> My kernels are being less than stable...
> This is recent. Something has recently changed?
> Any thoughts?

2.6.8.1-pa7 continues to be very stable.
Something is clobbering the free list maybe?

> firin login: Backtrace:
>  [<0000000010184e38>] kmem_cache_alloc+0x68/0x70
>  [<00000000101b6664>] alloc_buffer_head+0x2c/0x90
>  [<000000001022a980>] journal_write_metadata_buffer+0x88/0x8a8
>  [<00000000102242f4>] journal_commit_transaction+0x7fc/0x2778
>  [<000000001022a460>] kjournald+0x150/0x370
>  [<000000001010647c>] ret_from_kernel_thread+0x24/0x38

Ditto. I just crashed my c3k again with 2.6.9-rc2-pa6.
I would like to verify if -pa4 was more stable.

I was trying to update the pa8800 chroot env on that box.
data page fault occurred while dselect was downloading
packages. Last tty output was:
...
Get:103 http://mirrors.kernel.org testing/main build-essential 10.1 [6534B]    
Get:104 http://mirrors.kernel.org testing/main cvs 1:1.12.9-4 [1474kB]         
44% [104 cvs 406303/1474kB 27%]                                   387kB/s 3m31s

(out of 327 packages to be upgraded)

Stack trace is similar in that it starts with:
	kmem_cache_alloc+0x48
	alloc_buffer_head_0x1c
	create_buffers+0x44
	create_empty_buffers+0x1c
	__block_prepare_write+0x440
	block_prepare_write+0x2c
	ext3_prepare_write+0x80
	generic_file_buffered_write+0x1cc
	generic_file_aio_write_nolock+0x264
	generic_file_aio_write+0x88
	ext3_file_write+0x34
	do_sync_write+0xb4
	vfs_write+0xd8
	sys_write+0x58
	syscall_exit+0x0

> Bad Address (null pointer deref?): Code=15 regs=000000006d2ec8f0 (Addr=4000000066354008)

Kernel Fault: Code=15 regs=46b3c8c0 (Addr=b5feec50)

>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001001111111100001110 Not tainted

same

> r00-03  0000000000000000 0000000010597100 00000000123d8ce8 000000000000000b
> r04-07  0000000000000001 00000000123da000 00000000123d8bc0 00000000123d8cc8
> r08-11  00000000123db000 00000000123d8d28 0000000000000850 000000006f702a40
> r12-15  000000006d2ec508 0000000000330226 0000000000000000 0000000000000000
> r16-19  0000000000000000 000000006ddfd06c 0000000000000f94 00000000123d8cc8
> r20-23  7364650066354000 000000000000002c 0000000000000031 000000006637e000
> r24-27  000000000000000a 000000006637e028 00000000123da010 0000000010516e80
> r28-31  0000000000200200 0000000000100100 000000006d2ec8f0 00000000123d8cd8
> sr0-3   0000000004c47000 0000000000000000 0000000000000000 0000000004c47000
> sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

r00-03  00000000 104f3010 10feec5c 10ff5000
r04-07  10feec4c 10feec40 00000001 00000050
...
r20-23  b5feec4c 0000004e 0000004d 3fedd000
r24-27  3fedd018 0000002a 10ff5010 103c2010
...

> IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000010184934 0000000010184938
>  IIR: 0e9312d0    ISR: 0000000033646500  IOR: 4000000066354008
>  CPU:        0   CR30: 000000006d2ec000 CR31: 00000000104e0000
>  ORIG_R28: 000000005b4c1ab8
>  IAOQ[0]: cache_alloc_refill+0x164/0x330
>  IAOQ[1]: cache_alloc_refill+0x168/0x330

Yes - identical IOAQ.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
