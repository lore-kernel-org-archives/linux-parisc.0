From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [Vserver] Re: [parisc-linux] syscall number for vserver
Date: Thu, 18 Dec 2003 12:55:35 -0700
Message-ID: <20031218195535.GA12591__17736.6123687991$1416623065$gmane$org@colo.lackof.org>
References: <20031217221618.GC9313@MAIL.13thfloor.at>
	<20031218072506.GA8142@lst.de>
	<20031218150129.GA792@MAIL.13thfloor.at>
	<20031218160450.GJ15674@parcelfarce.linux.theplanet.co.uk>
	<20031218162809.GA2605@MAIL.13thfloor.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Matthew Wilcox <willy@debian.org>,
	Christoph Hellwig <hch@lst.de>, parisc-linux@lists.parisc-linux.org,
	vserver@list.linux-vserver.org
Return-Path: <grundler@lackof.org>
In-Reply-To: <20031218162809.GA2605@MAIL.13thfloor.at>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Dec 18, 2003 at 05:28:09PM +0100, Herbert Poetzl wrote:
> personally, I believe that the whole syscall number
> allocation per architecture is broken by design,

No it's definitely not.
Binary compatibility with other OS's is an arch specific problem.

In our case, any chance of support for HPUX would
require reserving HPUX syscall numbers and provide
appropriate wrappers in the kernel to support it.

And I don't see why the value of a syscall matters.
Just use the right header files and it should work on any arch.

grant
