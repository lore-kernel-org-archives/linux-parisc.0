From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [Fwd: [patch/hppa] Floating point exception
Date: Mon, 16 Jan 2006 19:18:53 -0700
Message-ID: <20060117021853.GA20607__3030.91414175487$1416623994$gmane$org@colo.lackof.org>
References: <20060116224337.GC22635@colo.lackof.org>
	<200601162252.k0GMqYA1009711@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org,
 debian-release@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200601162252.k0GMqYA1009711@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 16, 2006 at 05:52:34PM -0500, John David Anglin wrote:
> > >   The
> > > only reason they would need rebuilt after a glibc bug fix would be if the
> > > glibc ABI changed in the process, and that would be Very Bad<tm>.
> > 
> > Yeah, hopefully that doesn't happen.
> 
> As I have previously mentioned, there is a pending ABI issue affecting
> the passing of complex and vector floating point numbers on the PA
> (floats in particular on the 32-bit port, and both floats and doubles
> on the 64-bit port).  It turns out we are using the wrong registers
> to pass these types.

sorry - I forgot about that.
Anyay, it's not a disaster.


> I'm considering fixing this in GCC 4.1 (patch under test this weekend).
> We already have an ABI change under HP-UX in GCC 4.1 (dwarf2 exception
> support).  I've also observered that there is an incompatibility in
> libgcc under linux between 4.0 and 4.1.  I don't know if this is an ABI
> change or not.  For these reasons, now is the time to fix these issue.
> 
> If anybody feels strongly that the status quo should be maintained
> please let me know.  I'm going to bump the libgcc_s versions.


Debian "testing" (etch) is officially using gcc 4.0, right?
Does Debian promote binaries from "unstable" (using gcc 4.1) to "testing"?

If this ABI roll goes through, I can help track down debian packages that
need to be rebuilt if given an existing sample file to look at.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
