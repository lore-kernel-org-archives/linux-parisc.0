Return-Path: <hch@lst.de>
Received: from mail.lst.de (verein.lst.de [212.34.189.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 16ACD4854
	for <parisc-linux@parisc-linux.org>;
	Tue, 17 Feb 2004 08:03:34 -0700 (MST)
Date: Tue, 17 Feb 2004 16:03:20 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Job for someone
Message-ID: <20040217150320.GA27567@lst.de>
References: <20040217144206.GQ31168@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040217144206.GQ31168@parcelfarce.linux.theplanet.co.uk>
Cc: parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Feb 17, 2004 at 02:42:06PM +0000, Matthew Wilcox wrote:
> I was contacted by one of the Debian XFree86 people yesterday asking if
> someone would like to look at the XFree86 loader for parisc so they could
> rearrange the packaging to ship the modules separately from the server.
> I don't have any great desire to work on a dynamic linker, but I bet
> somebody else does ... ;-)

Maybe that someone should fix the issue right and switch XFree to use
dlopen() for Linux.  If some other OSes want to keep the current junk
it'll be their problem to fix it..
