Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 49FC7484B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Dec 2003 19:03:54 -0700 (MST)
Date: Thu, 18 Dec 2003 19:03:52 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org,
	vserver@list.linux-vserver.org
Subject: Re: [Vserver] Re: [parisc-linux] syscall number for vserver
Message-ID: <20031219020352.GA16266@colo.lackof.org>
References: <20031217221618.GC9313@MAIL.13thfloor.at>
	<20031218072506.GA8142@lst.de>
	<20031218150129.GA792@MAIL.13thfloor.at>
	<20031218160450.GJ15674@parcelfarce.linux.theplanet.co.uk>
	<20031218162809.GA2605@MAIL.13thfloor.at>
	<20031218195535.GA12591@colo.lackof.org>
	<20031219010035.GB7469@MAIL.13thfloor.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031219010035.GB7469@MAIL.13thfloor.at>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Dec 19, 2003 at 02:00:35AM +0100, Herbert Poetzl wrote:
...
> I agree from a technical point of view, but not from 
> the developer's perspective (who just want's a syscall 
> for whatever arch independant use ...)

sorry - an "arch independent syscall" sounds like an oxymoron to me.

> > Binary compatibility with other OS's is an arch specific problem.
> 
> for sure it is, but I don't see a relation there ...

ok

> > In our case, any chance of support for HPUX would
> > require reserving HPUX syscall numbers and provide
> > appropriate wrappers in the kernel to support it.
> 
> so where is the problem, having an additional offset/info
> in the macro defining the syscall can handle that, why
> has it to be a different numbering for 'linux' syscalls?

Linux kernel doesn't need of implement any given syscall the same
way for each arch.
gettimeofday/settimeofday are popular ones to re-implement
in glibc with alternative kernel support. performance sensitive
"syscalls" are subject to a high level of customization
given the resources and interest.

> > Just use the right header files and it should work on any arch.
> 
> right, but getting one syscall for every arch, seems
> like a jigsaw puzzle, as the original thread shows ...

ah yes. Open source is self correcting in that regard.
When someone decides it's important to have vserver syscall
implemented on parisc, they can demonstrate it works and
show it's useful.  If it's really arch independent, then
implementing it should be as easy as picking some random
unused __NR_xxx to test with and enabling the kernel config
options, right?

BTW, I visited http://www.linux-vserver.org/ and didn't feel
I understood why it's more useful than say, user mode linux
(another form of virtualization) or vPARs. But I'm no
security expert, just an IO/driver hacker.

grant
