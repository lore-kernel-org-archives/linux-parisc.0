From: Helge Deller <deller@gmx.de>
Subject: Re: resource_size_t printk woes...
Date: Fri, 02 Jan 2009 10:14:54 +0100
Message-ID: <495DDB0E.9010203@gmx.de>
References: <20090101233937.7256E4EDA@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, kyle@infradead.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090101233937.7256E4EDA@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>> On Thu, 01 Jan 2009, John David Anglin wrote:
>>
>>> I was think of something like this (untested):
>> While trying to test this, I hit the following with Kyle's 2.6.28-rc7
>> parisc tree:
>>
>> Debian GNU/Linux 5.0 mx3210 ttyS1
> 
> And other one:
> 
> mx3210 login: Slab corruption: names_cache start=000000007cc71000, len=4096
> 000: 00 00 00 00 7f 45 cb c0 00 00 00 00 40 5b 86 a0

Hi Dave,

telling you to try vanilla 2.6.28 was a stupid idea.
I forgot that I had exactly the same problem (slab corruption):
http://bugzilla.kernel.org/show_bug.cgi?id=11913
when I started the thread 
"2.6.28-rcX in pretty bad shape on parisc"
here on the list as well.

The solution for me was to use another default config.
James posted this one, which started to get everything working for me:
http://parisc-linux.org/~jejb/config-2.6.28-rc5-ion
Try this one instead (e.g. with Kyle's tree).

I assume something in your .config is different than what is in
James' .config. It would be interesting to know what it
is. I didn't checked further at that time.

Helge

> 010: 00 00 00 00 00 00 00 02 00 00 00 00 7f 41 0d 00
> 020: 00 00 00 00 7f 48 01 18 00 00 00 00 00 00 00 01
> 030: 00 00 00 00 7f 45 b2 88 00 00 00 00 40 5e f8 a0
> 040: 00 00 00 00 00 10 36 64 00 00 00 00 00 00 00 00
> 050: 00 00 00 00 00 00 00 00 00 00 00 00 00 22 34 e4
> Slab corruption: biovec-128 start=000000007cc7a308, len=2048
> Redzone: 0x0/0x1812c.
> Last user: [<000000007cc7a750>](0x7cc7a750)
> 000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 010: 00 00 00 00 00 00 00 00 00 00 00 00 40 10 40 78
> 020: 00 00 00 00 40 10 40 7c 00 00 00 00 40 4f bb 00
> 030: 00 00 00 00 42 76 81 e0 00 00 00 00 42 76 70 40
> 040: 00 00 00 00 40 5b 86 a0 6b 6b 6b 6b 6b 6b 6b 6b
> 050: 00 00 00 00 00 00 00 00 00 00 00 00 03 c0 08 a1
> Prev obj: start=000000007cc798d0, len=2048
> Redzone: 0x0/0xff0804ff0f.
> Last user: [<00000000405bcea0>](0x405bcea0)
> 000: 00 00 00 00 00 00 00 00 00 00 00 00 00 22 34 e4
> 010: 41 2e 84 80 00 00 00 00 00 00 00 00 00 1e 84 80
> slab error in cache_alloc_debugcheck_after(): cache `biovec-128': double free, or memory outside object was overwritten
> Backtrace:
>  [<000000004011bd1c>] show_stack+0x14/0x20
>  [<00000000401144f0>] dump_stack+0x18/0x28
>  [<00000000401c65dc>] __slab_error+0x3c/0x48
>  [<00000000401c6db0>] cache_alloc_debugcheck_after+0x190/0x308
>  [<00000000401c91d8>] kmem_cache_alloc+0xd8/0x190
>  [<000000004019552c>] mempool_alloc_slab+0x1c/0x28
>  [<0000000040195720>] mempool_alloc+0x88/0x1b8
>  [<00000000402039e0>] bvec_alloc_bs+0x88/0x138
>  [<0000000040203b14>] bio_alloc_bioset+0x84/0x140
>  [<0000000040203cf0>] bio_alloc+0x20/0x50
>  [<00000000402086e4>] mpage_alloc+0x44/0xd0
>  [<0000000040208c8c>] __mpage_writepage+0x41c/0x788
>  [<000000004019c7ec>] write_cache_pages+0x33c/0x438
>  [<0000000040208808>] mpage_writepages+0x48/0xb0
>  [<00000000142ca3a4>] ext2_writepages+0x1c/0x28 [ext2]
>  [<000000004019c974>] do_writepages+0x44/0x78
> 
> 000000007cc7a300: redzone 1:0x0, redzone 2:0x1812c
> ------------[ cut here ]------------
> kernel BUG at mm/slab.c:2895!
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001001111111100001110 Tainted: G        W 
> r00-03  000000ff0804ff0e 00000000405baea0 00000000401c6b0c 000000007cc7a300
> r04-07  00000000405b86a0 0000000000000000 000000007ed64740 d84156c5635688c0
> r08-11  00000000404063c0 000000007cc7a2c0 00000000401955ac 00000000405c2ea0
> r12-15  00000000405c0ea0 0000000040574f50 0000000000000000 000000004050bb80
> r16-19  00000000405ba6a0 0000000000000000 00000000ffffffff 00000000000f6ab4
> r20-23  000000006d207700 00000000001fa11d 00000000000f1c19 0000000066957700
> r24-27  00000000401955ac 00000000001fa11d 000000007cc7a300 00000000405b86a0
> r28-31  00000000000f6ab4 0000000040575500 0000000040575530 0000000000000003
> sr00-03  00000000006c9800 0000000000000000 0000000000000000 00000000006c9800
> sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> 
> IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401c6bb8 00000000401c6bbc
>  IIR: 03ffe01f    ISR: 0000000010340000  IOR: 000000015d575538
>  CPU:        0   CR30: 0000000040574000 CR31: 0000000040554000
> ORIG_R28: 000000004058f6a0
> IAOQ[0]: cache_free_debugcheck+0x360/0x3c8
> IAOQ[1]: cache_free_debugcheck+0x364/0x3c8
> RP(r2): cache_free_debugcheck+0x2b4/0x3c8
> Backtrace:
>  [<00000000401c733c>] kmem_cache_free+0x4c/0x150
>  [<00000000401955ac>] mempool_free_slab+0x1c/0x28
>  [<0000000040195690>] mempool_free+0xd8/0xe0
>  [<0000000040204a30>] bio_free+0x40/0x90
>  [<0000000040204a9c>] bio_fs_destructor+0x1c/0x28
>  [<00000000402023f8>] bio_put+0x88/0xa0
>  [<0000000040209b64>] mpage_end_io_write+0xcc/0x138
>  [<00000000402024e0>] bio_endio+0x70/0x90
>  [<000000004025bd60>] req_bio_endio+0xf8/0x158
>  [<000000004025befc>] __end_that_request_first+0x13c/0x3f8
>  [<000000004025c1f4>] end_that_request_data+0x3c/0xa8
>  [<000000004025d058>] blk_end_io+0x38/0xf8
>  [<000000004025d178>] blk_end_request+0x18/0x28
>  [<00000000081183e4>] scsi_end_request+0x4c/0x110 [scsi_mod]
>  [<0000000008118c8c>] scsi_io_completion+0x12c/0x538 [scsi_mod]
>  [<000000000810ed44>] scsi_finish_command+0xd4/0x148 [scsi_mod]
> 
> Backtrace:
>  [<000000004011bd1c>] show_stack+0x14/0x20
>  [<00000000401144f0>] dump_stack+0x18/0x28
>  [<000000004011c508>] die_if_kernel+0x138/0x240
>  [<000000004011ce88>] handle_interruption+0x878/0x910
>  [<00000000401c6bb8>] cache_free_debugcheck+0x360/0x3c8
>  [<00000000401c733c>] kmem_cache_free+0x4c/0x150
>  [<00000000401955ac>] mempool_free_slab+0x1c/0x28
>  [<0000000040195690>] mempool_free+0xd8/0xe0
>  [<0000000040204a30>] bio_free+0x40/0x90
>  [<0000000040204a9c>] bio_fs_destructor+0x1c/0x28
>  [<00000000402023f8>] bio_put+0x88/0xa0
>  [<0000000040209b64>] mpage_end_io_write+0xcc/0x138
>  [<00000000402024e0>] bio_endio+0x70/0x90
>  [<000000004025bd60>] req_bio_endio+0xf8/0x158
>  [<000000004025befc>] __end_that_request_first+0x13c/0x3f8
>  [<000000004025c1f4>] end_that_request_data+0x3c/0xa8
> 
> Dave

