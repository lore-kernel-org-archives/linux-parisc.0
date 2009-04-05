From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc: remove CVS keywords
Date: Sat, 4 Apr 2009 22:49:02 -0400
Message-ID: <20090405024902.GA17936@bombadil.infradead.org>
References: <20090403014922.GA28891@orion> <20090403175849.GJ14159@bombadil.infradead.org> <20090404060958.GA1116@lackof.org> <20090404191426.GA13748@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Alexander Beregalov <a.beregalov@gmail.com>,
	linux-parisc@vger.kernel.org
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090404191426.GA13748@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Apr 04, 2009 at 01:14:27PM -0600, Matthew Wilcox wrote:
> I'm comfortable with removing the $Id$ tags too.  Generally these have
> been in copy-and-pasted files; we weren't relying on them for anything.
> 
> Acked-by: Matthew Wilcox <willy@linux.intel.com>
> 

Yeah, looks like cvs.parisc-linux.org had -ko set for *ages* anyway,
so they're even stale wrt cvs.

nuked.

cheers, Kyle
