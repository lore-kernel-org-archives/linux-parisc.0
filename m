From: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
Date: 08 Apr 2004 12:43:45 -0500
Message-ID: <1081446226.2105.402.camel__40232.6537333012$1416623348$gmane$org@mulgrave>
References: <Pine.LNX.4.44.0404081500520.7116-100000@localhost.localdomain>
	<1081435237.1885.144.camel@mulgrave>
	<20040408151415.GB31667@dualathlon.random>
	<1081438124.2105.207.camel@mulgrave>
	<20040408153412.GD31667@dualathlon.random>
	<1081439244.2165.236.camel@mulgrave>
	<20040408161610.GF31667@dualathlon.random>
	<1081441791.2105.295.camel@mulgrave>
	<20040408171017.GJ31667@dualathlon.random>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Hugh Dickins <hugh@veritas.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
To: Andrea Arcangeli <andrea@suse.de>
Return-Path: <James.Bottomley@SteelEye.com>
In-Reply-To: <20040408171017.GJ31667@dualathlon.random>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, 2004-04-08 at 12:10, Andrea Arcangeli wrote:
> I said above per-arch abstraction, a per-arch abstraction isn't an irq
> safe spinlock, we cannot add an irq safe spinlock there, it'd be too bad
> for all the common archs that don't need to walk those lists (actually
> trees in my -aa tree) from irq context.

I think we agree on the abstraction thing.  I was more wondering what
you thought was so costly about an irq safe spinlock as opposed to an
ordinary one?  Is there something adding to this cost I don't know
about?  i.e. should we be thinking about something like RCU or phased
tree approach to walking the mapping lists?

James
