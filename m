From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
Date: Thu, 8 Apr 2004 17:34:12 +0200
Message-ID: <20040408153412.GD31667__6731.31088628924$1416623345$gmane$org@dualathlon.random>
References: <Pine.LNX.4.44.0404081500520.7116-100000@localhost.localdomain>
	<1081435237.1885.144.camel@mulgrave>
	<20040408151415.GB31667@dualathlon.random>
	<1081438124.2105.207.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Hugh Dickins <hugh@veritas.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <andrea@suse.de>
In-Reply-To: <1081438124.2105.207.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Apr 08, 2004 at 10:28:44AM -0500, James Bottomley wrote:
> Exactly why wouldn't a simple spinlock to protect page->mapping work?  I
> know we don't want to bloat struct page, but such a thing could go in
> struct address_space?

yes, the spinlock in struct address_space would be enough, and that's
what 2.4 does too, Andrew changed it to a semaphore in 2.6 but it can be
made a spinlock again. Then you can fix it (as far as you never call it
from an irq and as far as you don't generate exceptions inside the
critical section, but I'm sure you don't).
