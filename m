From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] mmap and GCC precompiled headers
Date: Thu, 15 Jul 2004 17:34:02 -0400 (EDT)
Message-ID: <200407152134.i6FLY3GU021049@hiauly1.hia.nrc.ca>
References: <20040715203946.GN32326@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: willy@debian.org (Matthew Wilcox)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040715203946.GN32326@parcelfarce.linux.theplanet.co.uk> from
	"Matthew Wilcox" at Jul 15, 2004 09:39:46 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Thu, Jul 15, 2004 at 04:25:01PM -0400, John David Anglin wrote:
> > Precompiled headers (PCH) seem to be broken at the moment on hppa-linux
> > on at least certain kernel versions (2.6.6-pa4) because of the following
> > assumption in the PCH implementation:
> > 
> >    This version assumes that the kernel honors the START operand of mmap
> >    even without MAP_FIXED if START through START+SIZE are not currently
> >    mapped with something.  */
> > 
> > int
> > mmap_gt_pch_use_address (void *base, size_t size, int fd, size_t offset)
> > {
> > 
> > Anybody have any ideas as to whether parisc-linux can support the
> > above?  It seems to break down for large PCH files.  START isn't
> > honored under hpux either.
> 
> That's an unwarranted assumption.  If they want that, they need to
> specify MAP_FIXED.

The problem with MAP_FIXED is that it replaces any previous mappings.
I believe that the code in question doesn't want to do that.  It
simply wants to fallback to not using PCH if the suggested value
for START doesn't work out.

At this point, I don't know if there is another mapping but I suspect
there isn't as the code tries to load the PCH file quite early.

Obviously, this isn't a problem on lots of other ports or everybody
would be screaming.

We can have hppa specific implementations of mmap_gt_pch_get_address
and mmap_gt_pch_use_address.  Under hpux, mmap_gt_pch_use_address was
failing because mmap returned a somewhat smaller memory address.

The address dependencies in the PCH file need to be fixed, but that's
non trivial.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
