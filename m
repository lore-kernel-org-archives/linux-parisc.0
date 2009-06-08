From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [RFC] remove dead code from sys_parisc32.c
Date: Mon, 8 Jun 2009 10:17:51 -0400 (EDT)
Message-ID: <20090608141752.7E16F4FC4@hiauly1.hia.nrc.ca>
References: <20090608073727.GA19976@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: hch@lst.de (Christoph Hellwig)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090608073727.GA19976@lst.de> from "Christoph Hellwig" at Jun 8, 2009 09:37:27 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, Nov 05, 2008 at 03:08:10PM +0100, Christoph Hellwig wrote:
> > Anyone wants to pick this one up?
> > 
> > On Sun, Aug 17, 2008 at 04:41:51AM +0200, Christoph Hellwig wrote:
> > > Unless I'm totally missing something get_fd_set32/set_fd_set32 are
> > > completely unused.

In theory, they were removed in 2004 by this proposed change:
http://lkml.org/lkml/2004/4/17/37

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
