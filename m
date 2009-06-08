From: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC] remove dead code from sys_parisc32.c
Date: Mon, 8 Jun 2009 16:20:39 +0200
Message-ID: <20090608142039.GA3806@lst.de>
References: <20090608073727.GA19976@lst.de> <20090608141752.7E16F4FC4@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Christoph Hellwig <hch@lst.de>, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090608141752.7E16F4FC4@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 08, 2009 at 10:17:51AM -0400, John David Anglin wrote:
> > On Wed, Nov 05, 2008 at 03:08:10PM +0100, Christoph Hellwig wrote:
> > > Anyone wants to pick this one up?
> > > 
> > > On Sun, Aug 17, 2008 at 04:41:51AM +0200, Christoph Hellwig wrote:
> > > > Unless I'm totally missing something get_fd_set32/set_fd_set32 are
> > > > completely unused.
> 
> In theory, they were removed in 2004 by this proposed change:
> http://lkml.org/lkml/2004/4/17/37

The users were removed, the helpers stayed.  Kyle promised to put the
patch to remove them in last year, but somehow the patch got lost a
couple of times :)

