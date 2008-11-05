From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [RFC] remove dead code from sys_parisc32.c
Date: Wed, 5 Nov 2008 10:10:29 -0500
Message-ID: <20081105151029.GA12146@bombadil.infradead.org>
References: <20080817024151.GA24129@lst.de> <20081105140810.GA5411@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081105140810.GA5411@lst.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Nov 05, 2008 at 03:08:10PM +0100, Christoph Hellwig wrote:
> Anyone wants to pick this one up?
> 
> On Sun, Aug 17, 2008 at 04:41:51AM +0200, Christoph Hellwig wrote:
> > Unless I'm totally missing something get_fd_set32/set_fd_set32 are
> > completely unused.
> > 

Heh, sorry. Applied.
