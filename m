From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [Vserver] Re: [parisc-linux] syscall number for vserver
Date: Fri, 19 Dec 2003 18:03:51 +0100
Message-ID: <20031219170351.GB16572__13767.8677485839$1416623069$gmane$org@MAIL.13thfloor.at>
References: <20031217221618.GC9313@MAIL.13thfloor.at>
	<20031218072506.GA8142@lst.de>
	<20031218150129.GA792@MAIL.13thfloor.at>
	<20031218160450.GJ15674@parcelfarce.linux.theplanet.co.uk>
	<20031218162809.GA2605@MAIL.13thfloor.at>
	<20031218195535.GA12591@colo.lackof.org>
	<20031219010035.GB7469@MAIL.13thfloor.at>
	<20031219020352.GA16266@colo.lackof.org>
	<20031219032455.GB8847@MAIL.13thfloor.at>
	<20031219161134.GA24780@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: vserver@list.linux-vserver.org, parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <herbert@13thfloor.at>
In-Reply-To: <20031219161134.GA24780@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Dec 19, 2003 at 09:11:34AM -0700, Grant Grundler wrote:
> On Fri, Dec 19, 2003 at 04:24:56AM +0100, Herbert Poetzl wrote:
> ...
> 
> That should be part of the patch to enable vserver.
> 
> > > BTW, I visited http://www.linux-vserver.org/ and didn't feel
> > > I understood why it's more useful than say, user mode linux
> > > (another form of virtualization) or vPARs. 
> > 
> > hmm, for UML you'll need a kernel for each vps,
> > which eats up a lot of resources, where vserver
> > even allow you to share the files between vps
> 
> Has anyone bothered to quantify how much resource?
> In general, systems are memory starved, so this sounds
> like a good thing.

well, just as a small example, a single CPU
2GHz Pentium machine with 1GB RAM works reasonably
well with 30-40 vservers, each one running sshd, 
apache, php, postfix and mysql ...
 
a dual CPU 1.5GHz machine with 2GB RAM can
provide shelter for about 60-80 vservers, with
good responsiveness ...

a test patch for 2.4.23-pa3 can be found at
http://vserver.13thfloor.at/Stuff/patch-2.4.23-pa3-vs1.22.diff
(tools need some tweaking ...)

> > regarding vPARs, I didn't know that they work
> > for Linux yet, can you give some hints on that?
> 
> Search for "vPARs" on www.hp.com if you want more details
> on HPUX vPARs support.

heard of it for HPUX, and it seems that XEN
is somewhat compareable to that, but that didn't
answer my question: are they available for Linux
or 'just' for HPUX?

TIA,
Herbert

> grant
