Return-Path: <herbert@13thfloor.at>
Received: from mail.13thfloor.at (MAIL.13thfloor.at [212.16.62.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA452484B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Dec 2003 18:00:46 -0700 (MST)
Date: Fri, 19 Dec 2003 02:00:35 +0100
From: Herbert Poetzl <herbert@13thfloor.at>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [Vserver] Re: [parisc-linux] syscall number for vserver
Message-ID: <20031219010035.GB7469@MAIL.13thfloor.at>
References: <20031217221618.GC9313@MAIL.13thfloor.at>
	<20031218072506.GA8142@lst.de>
	<20031218150129.GA792@MAIL.13thfloor.at>
	<20031218160450.GJ15674@parcelfarce.linux.theplanet.co.uk>
	<20031218162809.GA2605@MAIL.13thfloor.at>
	<20031218195535.GA12591@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031218195535.GA12591@colo.lackof.org>
Cc: Matthew Wilcox <willy@debian.org>, vserver@list.linux-vserver.org,
	Christoph Hellwig <hch@lst.de>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Dec 18, 2003 at 12:55:35PM -0700, Grant Grundler wrote:
> On Thu, Dec 18, 2003 at 05:28:09PM +0100, Herbert Poetzl wrote:
> > personally, I believe that the whole syscall number
> > allocation per architecture is broken by design,
> 
> No it's definitely not.

since you removed it from the original context ...

I agree from a technical point of view, but not from 
the developer's perspective (who just want's a syscall 
for whatever arch independant use ...)

> Binary compatibility with other OS's is an arch specific problem.

for sure it is, but I don't see a relation there ...

> In our case, any chance of support for HPUX would
> require reserving HPUX syscall numbers and provide
> appropriate wrappers in the kernel to support it.

so where is the problem, having an additional offset/info
in the macro defining the syscall can handle that, why
has it to be a different numbering for 'linux' syscalls?

> And I don't see why the value of a syscall matters.

it doesn't matter, and it doesn't matter to me ...

> Just use the right header files and it should work on any arch.

right, but getting one syscall for every arch, seems
like a jigsaw puzzle, as the original thread shows ...

best,
Herbert

> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
