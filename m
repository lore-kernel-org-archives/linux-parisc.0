From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] mmap and GCC precompiled headers
Date: Thu, 15 Jul 2004 22:50:15 +0100
Message-ID: <20040715215015.GO32326@parcelfarce.linux.theplanet.co.uk>
References: <20040715203946.GN32326@parcelfarce.linux.theplanet.co.uk>
	<200407152134.i6FLY3GU021049@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200407152134.i6FLY3GU021049@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jul 15, 2004 at 05:34:02PM -0400, John David Anglin wrote:
> > That's an unwarranted assumption.  If they want that, they need to
> > specify MAP_FIXED.
> 
> The problem with MAP_FIXED is that it replaces any previous mappings.
> I believe that the code in question doesn't want to do that.  It
> simply wants to fallback to not using PCH if the suggested value
> for START doesn't work out.

Oh, that's easy enough.  mmap() returns the address it got mapped at,
so just compare it to the address you asked for and decline to use PCH
in that case.

> Obviously, this isn't a problem on lots of other ports or everybody
> would be screaming.

Sparc and MIPS should have difficulties too...

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
