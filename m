From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [Vserver] Re: [parisc-linux] syscall number for vserver
Date: Fri, 19 Dec 2003 04:24:56 +0100
Message-ID: <20031219032455.GB8847__39366.338044829$1416623067$gmane$org@MAIL.13thfloor.at>
References: <20031217221618.GC9313@MAIL.13thfloor.at>
	<20031218072506.GA8142@lst.de>
	<20031218150129.GA792@MAIL.13thfloor.at>
	<20031218160450.GJ15674@parcelfarce.linux.theplanet.co.uk>
	<20031218162809.GA2605@MAIL.13thfloor.at>
	<20031218195535.GA12591@colo.lackof.org>
	<20031219010035.GB7469@MAIL.13thfloor.at>
	<20031219020352.GA16266@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: vserver@list.linux-vserver.org, parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <herbert@13thfloor.at>
In-Reply-To: <20031219020352.GA16266@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Dec 18, 2003 at 07:03:52PM -0700, Grant Grundler wrote:
> On Fri, Dec 19, 2003 at 02:00:35AM +0100, Herbert Poetzl wrote:
> ...
> > I agree from a technical point of view, but not from 
> > the developer's perspective (who just want's a syscall 
> > for whatever arch independant use ...)
> 
> sorry - an "arch independent syscall" sounds like an oxymoron to me.

that's probably why most of the syscalls are
implemented outside of linux/arch/* (about 250)

> > > Binary compatibility with other OS's is an arch specific problem.
> > 
> > for sure it is, but I don't see a relation there ...
> 
> ok
> 
> > > In our case, any chance of support for HPUX would
> > > require reserving HPUX syscall numbers and provide
> > > appropriate wrappers in the kernel to support it.
> > 
> > so where is the problem, having an additional offset/info
> > in the macro defining the syscall can handle that, why
> > has it to be a different numbering for 'linux' syscalls?
> 
> Linux kernel doesn't need of implement any given syscall the same
> way for each arch.

sure not, but gettimeofday for example, will
return the current time, and this usually does
not need an architecture specific interface
(for sure it will require an arch specific
implementation ;)

> gettimeofday/settimeofday are popular ones to re-implement
> in glibc with alternative kernel support. performance sensitive
> "syscalls" are subject to a high level of customization
> given the resources and interest.
> 
> > > Just use the right header files and it should work on any arch.
> > 
> > right, but getting one syscall for every arch, seems
> > like a jigsaw puzzle, as the original thread shows ...
> 
> ah yes. Open source is self correcting in that regard.
> When someone decides it's important to have vserver syscall
> implemented on parisc, they can demonstrate it works and
> show it's useful.  

yes ;)

> If it's really arch independent, then implementing it 
> should be as easy as picking some random unused __NR_xxx 
> to test with and enabling the kernel config options, right?

well, yeah, that is what I did to add the parisc(64)
vserver support, except that it doesn't have
a kernel config option yet ;)

> BTW, I visited http://www.linux-vserver.org/ and didn't feel
> I understood why it's more useful than say, user mode linux
> (another form of virtualization) or vPARs. 

hmm, for UML you'll need a kernel for each vps,
which eats up a lot of resources, where vserver
even allow you to share the files between vps

regarding vPARs, I didn't know that they work
for Linux yet, can you give some hints on that?

> But I'm no security expert, just an IO/driver hacker.

security is just one aspect of this project ...
IO/driver hacking is fun sometimes ...

best,
Herbert

> grant
> _______________________________________________
> Vserver mailing list
> Vserver@list.linux-vserver.org
> http://list.linux-vserver.org/mailman/listinfo/vserver
