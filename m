From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] a b180 panic with 2.6.11-rc3-pa3
Date: Wed, 16 Feb 2005 20:14:17 +0100
Message-ID: <20050216201417.737f4c40@Tatooine.r3z0>
References: <42075CE800002E4E@mail-6-bnl.tiscali.it>
	<e6eae029050214141362a7d859@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: List Parisc <parisc-linux@lists.parisc-linux.org>
To: Max Grabert <parisc@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <e6eae029050214141362a7d859@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 14 Feb 2005 22:13:59 +0000
Max Grabert <parisc@gmail.com> wrote:

> On Mon, 14 Feb 2005 11:30:43 +0000, Joel Soete <soete.joel@tiscali.be>
> wrote:
> > Hi all,
> > 
> > Don't know if somebody else also emcountered such panic:
> > Backtrace:
> 
> > [<101bb588>] journal_add_journal_head+0xdc/0x13c
> > [<101b4dd8>] journal_dirty_data+0x64/0x1b0
> > [<101a6be4>] ext3_journal_dirty_data+0x1c/0x60
> > [<101a69a8>] walk_page_buffers+0xe0/0xf0
> > [<101a72b8>] ext3_ordered_writepage+0x168/0x1fc

Got hit by a similar panic during the night (the kernel uptime was < 5h)

Kernel Fault code 15
Top stack was:

cache_grow
cache_alloc_refill
kmem_cache_alloc
journal_alloc_journal

and the rest was identical to your dump.

IAOQ was alloc_slabmgmt and gr2 was cache_grow

This was 2.6.11-rc3-pa5 freshly built with Kernel Hacking turned off.

HTH

Thibaut VARENE
The PA/Linux ESIEE Team
http://www.pateam.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
