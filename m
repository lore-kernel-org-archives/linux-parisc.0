From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: Gcc bug or I missunderstand? [ftsd %fr22,
	56(%sr0, %r20) failed to build?]
Date: Wed, 15 Dec 2004 11:04:36 -0700
Message-ID: <20041215180436.GD27818@colo.lackof.org>
References: <418A80250000FC28@mail-2-bnl.tiscali.it>
	<20041215163907.GZ29171@tausq.org>
	<20041215171813.GA28058@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: dave@hiauly1.hia.nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041215171813.GA28058@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Dec 15, 2004 at 05:18:13PM +0000, Matthew Wilcox wrote:
> Quick look at page 9-24 of the Kane book indicates that for d between +15
> and -16 we use format 42 and for d outside that range, we use format 3.
> Looks like nobody bothered to teach binutils about this longer form yet.
> Is it possible it's only available for PA2.0 processors?

Yes - that seems to be the case.
FSTD is PA2.0 Mnemonic. Page J-4 of the same book.

The two corresponding PA 1.1 ops are FSTDS and FSTDX.
FSTDS is the short form (5 bits immediate).
We could use FSTDX but it will require another register in the asm.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
