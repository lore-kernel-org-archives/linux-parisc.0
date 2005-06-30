From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Why gas kills the hppa-linux kernel and what you
	can
Date: Thu, 30 Jun 2005 15:17:43 -0400
Message-ID: <20050630191743.GN5269@systemhalted.org>
References: <20050630183559.GK5269@systemhalted.org>
	<200506301907.j5UJ7UAx029747@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200506301907.j5UJ7UAx029747@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jun 30, 2005 at 03:07:30PM -0400, John David Anglin wrote:
> >  IAOQ[0]: memset+0x24/0xac
> >  IAOQ[1]: memset+0x28/0xac
> 
> It looks like memset has been passed a bad address.
> 

Who passed the bad page?

I see this from the userspace/kernel side:

as-new        D 10109D08     0  1065    748                     (NOTLB)
Backtrace:
 [<10100eac>] schedule+0x4a0/0x6f8
 [<10101b10>] io_schedule+0x3c/0x68
 [<101404d8>] sync_page+0x40/0x68
 [<10102078>] __wait_on_bit_lock+0xdc/0xf0
 [<101410a4>] __lock_page+0x98/0xa4
 [<101532fc>] do_swap_page+0x36c/0x400
 [<10153c94>] handle_mm_fault+0x120/0x204
 [<10103558>] do_page_fault+0x214/0x2a4
 [<10104fd4>] handle_interruption+0x2bc/0x5e8
 [<1010a088>] intr_check_sig+0x0/0xc
 [<1014c388>] __pagevec_lru_add_active+0xfc/0x144
 [<10129e98>] tasklet_action+0x70/0xe0
 [<10162fd4>] dentry_open+0x120/0x1c0
 [<10162fd4>] dentry_open+0x120/0x1c0
 [<10162fd4>] dentry_open+0x120/0x1c0
 [<10162fd4>] dentry_open+0x120/0x1c0

Clearly as-new is toast and swapping the system like made.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
