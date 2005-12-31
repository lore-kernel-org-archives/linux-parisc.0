From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] sym2 changes between 2.6.12 and 2.6.15
Date: Fri, 30 Dec 2005 20:18:35 -0700
Message-ID: <20051231031835.GB19769@parisc-linux.org>
References: <7d01f9f00512291016k67676c59i759121abdfa0cf24@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00512291016k67676c59i759121abdfa0cf24@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Dec 29, 2005 at 07:16:19PM +0100, Thibaut VARENE wrote:
> I recently got 2.6.15-rc7-pa0 booting up on my rp3440 and noticed sym
> wasn't initializing HDs as it previously was, in fact it was
> initializing in Narrow mode instead of wide:

You should probably try kernels either side of:

http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2005-December/036342.html

to be sure we're debugging the right problem.  Or take out the
"         spi_max_width(tp->starget) = tp->usr_width;" line from sym_glue.c

> at which point jejb said:
> <jejb> OK, it's picking up narrow as an nvram setting
> <jejb> that's a new feature of the driver (believing the nvram)
> <jejb> there's probably some secret PDC call we should be doing instead

But we already are -- see sym_read_parisc_pdc() and sym_nvram_setup_host().

Could you dump the contents of nvram->data.parisc ?

I have a feeling we're not doing something right though, because we
should only be setting width on a 9000/785 (ie C3000-family).

Debugging needed, please!
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
