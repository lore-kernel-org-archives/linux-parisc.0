From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
Date: Thu, 8 Apr 2004 17:14:15 +0200
Message-ID: <20040408151415.GB31667__11616.9146764607$1416623344$gmane$org@dualathlon.random>
References: <Pine.LNX.4.44.0404081500520.7116-100000@localhost.localdomain>
	<1081435237.1885.144.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Hugh Dickins <hugh@veritas.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <andrea@suse.de>
In-Reply-To: <1081435237.1885.144.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Apr 08, 2004 at 09:40:37AM -0500, James Bottomley wrote:
> Whatever seems most convenient that won't impact the flushing fast path,
> I suppose.  It's one of the hottest paths in the system since all data
> transfers go through it for user visibility.

you'd need to take a semaphore there to be safe, so it's basically
unfixable since you can't sleep or just trylock.
