From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [Vserver] Re: [parisc-linux] syscall number for vserver
Date: Fri, 19 Dec 2003 09:11:34 -0700
Message-ID: <20031219161134.GA24780__15578.9789664142$1416623069$gmane$org@colo.lackof.org>
References: <20031217221618.GC9313@MAIL.13thfloor.at>
	<20031218072506.GA8142@lst.de>
	<20031218150129.GA792@MAIL.13thfloor.at>
	<20031218160450.GJ15674@parcelfarce.linux.theplanet.co.uk>
	<20031218162809.GA2605@MAIL.13thfloor.at>
	<20031218195535.GA12591@colo.lackof.org>
	<20031219010035.GB7469@MAIL.13thfloor.at>
	<20031219020352.GA16266@colo.lackof.org>
	<20031219032455.GB8847@MAIL.13thfloor.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: vserver@list.linux-vserver.org, parisc-linux@lists.parisc-linux.org
To: Herbert Poetzl <herbert@13thfloor.at>
Return-Path: <grundler@lackof.org>
In-Reply-To: <20031219032455.GB8847@MAIL.13thfloor.at>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Dec 19, 2003 at 04:24:56AM +0100, Herbert Poetzl wrote:
...
> sure not, but gettimeofday for example, will
> return the current time, and this usually does
> not need an architecture specific interface

glibc

> (for sure it will require an arch specific
> implementation ;)

possible a different syscall.
Sounds like we agree.

...
> > to test with and enabling the kernel config options, right?
> 
> well, yeah, that is what I did to add the parisc(64)
> vserver support, except that it doesn't have
> a kernel config option yet ;)

That should be part of the patch to enable vserver.

> > BTW, I visited http://www.linux-vserver.org/ and didn't feel
> > I understood why it's more useful than say, user mode linux
> > (another form of virtualization) or vPARs. 
> 
> hmm, for UML you'll need a kernel for each vps,
> which eats up a lot of resources, where vserver
> even allow you to share the files between vps

Has anyone bothered to quantify how much resource?
In general, systems are memory starved, so this sounds
like a good thing.

> regarding vPARs, I didn't know that they work
> for Linux yet, can you give some hints on that?

Several arches are capable of running the OS via a "monitor"
that abstracts the HW (even emulating IO devices depending on
the implementation).  Thus allows several OS instances to run
at the same time.  It's not too different from UML except that
the monitor is "lighter weight" than a Linux kernel host and
can run different OSs (ie not just linux) at the same time.

Search for "vPARs" on www.hp.com if you want more details
on HPUX vPARs support.

grant
