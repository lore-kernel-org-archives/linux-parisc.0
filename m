From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
Date: Thu, 8 Apr 2004 20:18:38 +0200
Message-ID: <20040408181838.GN31667__38189.5877574154$1416623349$gmane$org@dualathlon.random>
References: <20040408151415.GB31667@dualathlon.random>
	<1081438124.2105.207.camel@mulgrave>
	<20040408153412.GD31667@dualathlon.random>
	<1081439244.2165.236.camel@mulgrave>
	<20040408161610.GF31667@dualathlon.random>
	<1081441791.2105.295.camel@mulgrave>
	<20040408171017.GJ31667@dualathlon.random>
	<1081446226.2105.402.camel@mulgrave>
	<20040408175158.GK31667@dualathlon.random>
	<1081447654.1885.430.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Hugh Dickins <hugh@veritas.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <andrea@suse.de>
In-Reply-To: <1081447654.1885.430.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Apr 08, 2004 at 01:07:31PM -0500, James Bottomley wrote:
> On Thu, 2004-04-08 at 12:51, Andrea Arcangeli wrote:
> > that path can take as long as timeslice to run, not taking interrupts
> > for a whole scheduler timeslice is pretty bad.
> 
> OK, now I'm confused.  Where's the whole timeslice bit coming from? the
> parisc flush_dcache_code better not take a timeslice to execute
> otherwise we're in very serious performance trouble.
> 
> Does it take as long as a timeslice to do mmap[_shared] list insertion?

it enterely depends on the workload. On a desktop machine there may be
only some hundred entries in those lists at maximum with glibc being the
biggest offender:

cat /proc/*/maps | grep libc.so.6 | wc -l

with shared memory on some server there can be easily several thousand
entries for some inode even on 64bit, but a timeslice was probably
exaggerated (the timeslice was for the walking of the ptes in each
mapping too, I don't think you need to look at every pte).
