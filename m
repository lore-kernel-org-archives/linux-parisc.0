Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EISA 100/10 add-on card causes kernel BUG 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Sat, 16 Mar 2002 21:39:38 GMT." <20020316213938.B2179@parcelfarce.linux.theplanet.co.uk>
References: <3C92DD15.4060008@neuronet.pitt.edu> <raffo@neuronet.pitt.edu> <20020316184231.482C6482C@dsl2.external.hp.com>  <20020316213938.B2179@parcelfarce.linux.theplanet.co.uk> 
Date: Sat, 16 Mar 2002 22:38:38 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020317053838.683C7482D@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Matthew Wilcox wrote:
> Let me just explicitly discourage doing this (or, if you must, document
> it in Documentation/parisc/registers).  Use of sr3 to access userspace
> is subject to change and it'd be nice not to have to check every driver
> for use. 

Yeah - you are right

> It's bad enough that sba & ccio use sr1, but at least we found
> those :-)

oh - I forgot about those for filling the IO pdir entries...
that need to change in order to support zero copy?

We somehow need to pass the spaceID of the userspace buffer
to dma code if we want DMA to be cache coherent.
I don't have any good ideas for this.

> I cant imagine a good reason for using sr3.  copy_{to,from}_user are
> portable and obvious.

agreed.

thanks,
grant

--9B420482D.1016343457/dsl2.external.hp.com--
