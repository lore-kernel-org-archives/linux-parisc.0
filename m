From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] mmap and GCC precompiled headers
Date: Thu, 15 Jul 2004 18:26:30 -0400 (EDT)
Message-ID: <200407152226.i6FMQVK4029018@hiauly1.hia.nrc.ca>
References: <20040715215015.GO32326@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: willy@debian.org (Matthew Wilcox)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040715215015.GO32326@parcelfarce.linux.theplanet.co.uk> from
	"Matthew Wilcox" at Jul 15, 2004 10:50:15 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Thu, Jul 15, 2004 at 05:34:02PM -0400, John David Anglin wrote:
> > > That's an unwarranted assumption.  If they want that, they need to
> > > specify MAP_FIXED.
> > 
> > The problem with MAP_FIXED is that it replaces any previous mappings.
> > I believe that the code in question doesn't want to do that.  It
> > simply wants to fallback to not using PCH if the suggested value
> > for START doesn't work out.
> 
> Oh, that's easy enough.  mmap() returns the address it got mapped at,
> so just compare it to the address you asked for and decline to use PCH
> in that case.

Well, that's exactly what it does.  However, it doesn't work.  The
start address is selected as follows:

/* Default version of HOST_HOOKS_GT_PCH_GET_ADDRESS when mmap is present.
   We temporarily allocate SIZE bytes, and let the kernel place the data
   wherever it will.  If it worked, that's our spot, if not we're likely
   to be in trouble.  */

However, when GCC tries to remap the PCH file to this location, it
sometimes fails.  This is currently a fatal error (i.e., it does not
fallback as described above).  This needs looking at.  Almost all
the libstdc++ tests failed in the last build that I did.  I think if
it successfully loads the PCH file and finds that it's not valid,
it does fallback.

>>From what you and Randolph have said, PCH in its current incarnation
isn't going to work on hppa.  If it works, I belive that it provides
a significant performance enhancement in compiling c++ code.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
