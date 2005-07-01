From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [dave@hiauly1.hia.nrc.ca: Re: [parisc-linux] Why gas kills the
Date: Fri, 1 Jul 2005 15:47:56 -0400
Message-ID: <20050701194756.GY5269@systemhalted.org>
References: <1120241244.5046.16.camel@mulgrave>
	<200507011838.j61Ic37N006115@hiauly1.hia.nrc.ca>
	<20050701191254.GX5269@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050701191254.GX5269@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jul 01, 2005 at 03:12:55PM -0400, Carlos O'Donell wrote:
> On Fri, Jul 01, 2005 at 02:38:03PM -0400, John David Anglin wrote:
> > > On Fri, 2005-07-01 at 13:53 -0400, Carlos O'Donell wrote:
> > > > journal_alloc_journal_head() can return a null pointer causing
> > > > the kernel to die in memset.  I think the fix is to skip calling
> > > > memset when new_jh is null.  The rest of the code looks ok except
> > > > for possibly
> > > 
> > > That's true (and needs fixing), but isn't what happened in this case.
> > > Look at the traceback:
> > 
> > Actually, I was wrong.  journal_alloc_journal_head con't return
> > null.  I see it spins until kmem_cache_alloc returns a non null
> > value.
> > 
> > It looks like mm/slab.c needs to be built with DEBUG true and
> > and possibly CONFIG_DEBUG_PAGEALLOC to find how the pointer is
> > getting allocated.
> 
> I don't know how to turn that on, I can see the define in a couple of
> places, but it's not really connected to any configuration option.
> It looks bitrotten.

Run again with debug I get teh following:

as-new        D 10109D08     0   453    438                     (NOTLB)
Backtrace:
 [<10100eac>] schedule+0x4a0/0x6f8
 [<10101b10>] io_schedule+0x3c/0x68
 [<101404d8>] sync_page+0x40/0x68
 [<10102078>] __wait_on_bit_lock+0xdc/0xf0
 [<101410a4>] __lock_page+0x98/0xa4
 [<101547c0>] do_swap_page+0x36c/0x400
 [<10155158>] handle_mm_fault+0x120/0x204
 [<10103558>] do_page_fault+0x214/0x2a4
 [<10104fd4>] handle_interruption+0x2bc/0x5e8
 [<1010a088>] intr_check_sig+0x0/0xc
 [<10166060>] get_empty_filp+0x5c/0x120
 [<10166060>] get_empty_filp+0x5c/0x120
 [<10166060>] get_empty_filp+0x5c/0x120
 [<10166060>] get_empty_filp+0x5c/0x120
 [<10166060>] get_empty_filp+0x5c/0x120
 [<10166060>] get_empty_filp+0x5c/0x120

---

Slab corruption: start=435cd90a, len=52
Redzone: 0x0/0x0.
Last user: [<00000000>](_stext+0xefefff80/0x20)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
030: 00 00 00 00
Prev obj: start=435cd8c5, len=52
Redzone: 0x0/0x0.
Last user: [<00000000>](_stext+0xefefff80/0x20)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
slab error in cache_alloc_debugcheck_after(): cache `journal_head':
double free, or memory outside object was overwritten
Backtrace:
 [<1014ba94>] cache_alloc_debugcheck_after+0xd0/0x184
 [<1014bf04>] kmem_cache_alloc+0x7c/0xc0
 [<101c04e4>] journal_alloc_journal_head+0x28/0xac
 [<101c0654>] journal_add_journal_head+0xc8/0x13c
 [<101b9ae0>] journal_dirty_data+0x64/0x1dc
 [<101a7d8c>] ext3_journal_dirty_data+0x1c/0x60
 [<101a7b30>] walk_page_buffers+0xe8/0xf4
 [<101a84b4>] ext3_ordered_writepage+0x168/0x1fc
 [<1018d68c>] mpage_writepages+0x2ac/0x3fc
 [<1018b980>] __sync_single_inode+0x5c/0x274
 [<1018bc30>] __writeback_single_inode+0x98/0x16c
 [<1018bee0>] sync_sb_inodes+0x1dc/0x32c
 [<1018c0ec>] writeback_inodes+0xbc/0xd8
 [<10147b08>] background_writeout+0xc4/0x11c
 [<1014884c>] __pdflush+0x134/0x204
 [<1014893c>] pdflush+0x20/0x2c

435cd906: redzone 1: 0x0, redzone 2: 0x0.
Slab corruption: start=435cd90a, len=52
Redzone: 0x170fc2a5/0x170fc2a5.
Last user: [<101c04e4>](journal_alloc_journal_head+0x28/0xac)
000: 2c 38 76 7c 00 00 00 00 00 00 00 01 00 00 00 00
010: 00 00 00 00 00 00 00 00 4f 66 b9 d8 00 00 00 00
020: 31 36 73 48 35 cf ae 48 00 00 00 00 00 00 00 00
030: 00 00 00 00
Prev obj: start=435cd8c5, len=52
Redzone: 0x0/0x0.
Last user: [<00000000>](_stext+0xefefff80/0x20)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
slab error in cache_alloc_debugcheck_after(): cache `journal_head':
double free, or memory outside object was overwritten
Backtrace:
 [<1014ba94>] cache_alloc_debugcheck_after+0xd0/0x184
 [<1014bf04>] kmem_cache_alloc+0x7c/0xc0
 [<101c04e4>] journal_alloc_journal_head+0x28/0xac
 [<101c0654>] journal_add_journal_head+0xc8/0x13c
 [<101b9ae0>] journal_dirty_data+0x64/0x1dc
 [<101a7d8c>] ext3_journal_dirty_data+0x1c/0x60
 [<101a7b30>] walk_page_buffers+0xe8/0xf4
 [<101a84b4>] ext3_ordered_writepage+0x168/0x1fc
 [<1018d68c>] mpage_writepages+0x2ac/0x3fc
 [<1018b980>] __sync_single_inode+0x5c/0x274
 [<1018bc30>] __writeback_single_inode+0x98/0x16c
 [<1018bee0>] sync_sb_inodes+0x1dc/0x32c
 [<1018c0ec>] writeback_inodes+0xbc/0xd8
 [<10147b08>] background_writeout+0xc4/0x11c
 [<1014884c>] __pdflush+0x134/0x204
 [<1014893c>] pdflush+0x20/0x2c

435cd906: redzone 1: 0x170fc2a5, redzone 2: 0x170fc2a5.
Slab corruption: start=435cd90a, len=52
Redzone: 0x170fc2a5/0x170fc2a5.
Last user: [<101c04e4>](journal_alloc_journal_head+0x28/0xac)
000: 2c 38 76 b8 00 00 00 00 00 00 00 01 00 00 00 00
010: 00 00 00 00 00 00 00 00 4f 66 b9 d8 00 00 00 00
020: 43 5c d9 0a 43 5c d9 0a 00 00 00 00 00 00 00 00
030: 00 00 00 00
Prev obj: start=435cd8c5, len=52
Redzone: 0x0/0x0.
Last user: [<00000000>](_stext+0xefefff80/0x20)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
slab error in cache_alloc_debugcheck_after(): cache `journal_head':
double free, or memory outside object was overwritten
Backtrace:
 [<1014ba94>] cache_alloc_debugcheck_after+0xd0/0x184
 [<1014bf04>] kmem_cache_alloc+0x7c/0xc0
 [<101c04e4>] journal_alloc_journal_head+0x28/0xac
 [<101c0654>] journal_add_journal_head+0xc8/0x13c
 [<101b9ae0>] journal_dirty_data+0x64/0x1dc
 [<101a7d8c>] ext3_journal_dirty_data+0x1c/0x60
 [<101a7b30>] walk_page_buffers+0xe8/0xf4
 [<101a84b4>] ext3_ordered_writepage+0x168/0x1fc
 [<1018d68c>] mpage_writepages+0x2ac/0x3fc
 [<1018b980>] __sync_single_inode+0x5c/0x274
 [<1018bc30>] __writeback_single_inode+0x98/0x16c
 [<1018bee0>] sync_sb_inodes+0x1dc/0x32c
 [<1018c0ec>] writeback_inodes+0xbc/0xd8
 [<10147b08>] background_writeout+0xc4/0x11c
 [<1014884c>] __pdflush+0x134/0x204
 [<1014893c>] pdflush+0x20/0x2c

435cd906: redzone 1: 0x170fc2a5, redzone 2: 0x170fc2a5.
Slab corruption: start=435cd90a, len=52
Redzone: 0x170fc2a5/0x170fc2a5.
Last user: [<101c04e4>](journal_alloc_journal_head+0x28/0xac)
000: 2c 38 76 f4 00 00 00 00 00 00 00 01 00 00 00 00
010: 00 00 00 00 00 00 00 00 4f 66 b9 d8 00 00 00 00
020: 43 5c d9 0a 43 5c d9 0a 00 00 00 00 00 00 00 00
030: 00 00 00 00
Prev obj: start=435cd8c5, len=52
Redzone: 0x0/0x0.
Last user: [<00000000>](_stext+0xefefff80/0x20)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
slab error in cache_alloc_debugcheck_after(): cache `journal_head':
double free, or memory outside object was overwritten
Backtrace:
 [<1014ba94>] cache_alloc_debugcheck_after+0xd0/0x184
 [<1014bf04>] kmem_cache_alloc+0x7c/0xc0
 [<101c04e4>] journal_alloc_journal_head+0x28/0xac
 [<101c0654>] journal_add_journal_head+0xc8/0x13c
 [<101b9ae0>] journal_dirty_data+0x64/0x1dc
 [<101a7d8c>] ext3_journal_dirty_data+0x1c/0x60
 [<101a7b30>] walk_page_buffers+0xe8/0xf4
 [<101a84b4>] ext3_ordered_writepage+0x168/0x1fc
 [<1018d68c>] mpage_writepages+0x2ac/0x3fc
 [<1018b980>] __sync_single_inode+0x5c/0x274
 [<1018bc30>] __writeback_single_inode+0x98/0x16c
 [<1018bee0>] sync_sb_inodes+0x1dc/0x32c
 [<1018c0ec>] writeback_inodes+0xbc/0xd8
 [<10147b08>] background_writeout+0xc4/0x11c
 [<1014884c>] __pdflush+0x134/0x204
 [<1014893c>] pdflush+0x20/0x2c

435cd906: redzone 1: 0x170fc2a5, redzone 2: 0x170fc2a5.
Slab corruption: start=435cd90a, len=52
Redzone: 0x170fc2a5/0x170fc2a5.
Last user: [<101c04e4>](journal_alloc_journal_head+0x28/0xac)
000: 2c 38 77 30 00 00 00 00 00 00 00 01 00 00 00 00
010: 00 00 00 00 00 00 00 00 4f 66 b9 d8 00 00 00 00
020: 43 5c d9 0a 43 5c d9 0a 00 00 00 00 00 00 00 00
030: 00 00 00 00
Prev obj: start=435cd8c5, len=52
Redzone: 0x0/0x0.
Last user: [<00000000>](_stext+0xefefff80/0x20)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
slab error in cache_alloc_debugcheck_after(): cache `journal_head':
double free, or memory outside object was overwritten
Backtrace:
 [<1014ba94>] cache_alloc_debugcheck_after+0xd0/0x184
 [<1014bf04>] kmem_cache_alloc+0x7c/0xc0
 [<101c04e4>] journal_alloc_journal_head+0x28/0xac
 [<101c0654>] journal_add_journal_head+0xc8/0x13c
 [<101b9ae0>] journal_dirty_data+0x64/0x1dc
 [<101a7d8c>] ext3_journal_dirty_data+0x1c/0x60
 [<101a7b30>] walk_page_buffers+0xe8/0xf4
 [<101a84b4>] ext3_ordered_writepage+0x168/0x1fc
 [<1018d68c>] mpage_writepages+0x2ac/0x3fc
 [<1018b980>] __sync_single_inode+0x5c/0x274
 [<1018bc30>] __writeback_single_inode+0x98/0x16c
 [<1018bee0>] sync_sb_inodes+0x1dc/0x32c
 [<1018c0ec>] writeback_inodes+0xbc/0xd8
 [<10147b08>] background_writeout+0xc4/0x11c
 [<1014884c>] __pdflush+0x134/0x204
 [<1014893c>] pdflush+0x20/0x2c

---

And on and on. Then the oops, and then a reset by the automatic reset
code. I assume this means that someone overwrote the slab sentinel?
How do we track down the rogue writer?

c.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
