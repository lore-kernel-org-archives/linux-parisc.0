From: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] new gcc-default for hppa
Date: Thu, 16 Jan 2003 14:37:46 +0000 (GMT)
Message-ID: <Pine.LNX.4.44.0301161427060.31815-100000__38222.7942850024$1416622126$gmane$org@sal.ucc.ie>
References: <20030116010620.GB8543@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: jsoe0708@tiscali.be, Randolph Chung <tausq@debian.org>,
	<parisc-linux@lists.parisc-linux.org>, <debian-hppa@lists.debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030116010620.GB8543@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, 15 Jan 2003, Grant Grundler wrote:

> On Wed, Jan 15, 2003 at 05:14:47PM +0100, jsoe0708@tiscali.be wrote:
> > >There are a lot of differences (do you want it I do not think it will be
> > >usefull)
> > >
> > >> or a default .config if that's closer?
> > >
> > >It will have to wait tommorrow (sorry)
>
> np. I also want you to look at something that is known
> to work before going too far.
>
> > I now add CONFIG_TULIP_MMIO=yes
>
> yes. that's what I meant.
>
> > (Randolph: Do you want I send you those new material: kernel, system.map,
> > ...?)
>
> Or make them available via http or ftp.
> Otherwise, posting what symbols the IAOQ/GR02 values point at
> is even better.
>
> > I also forget to recall: this only occurs for incoming ethernet trafic(ie
> > ssh, telnet, ftp, coming from an external server). The outgoing traffic
> > works fine (I just do a telnet and a ftp from this server to an external
> > one without crash)
>
> Interesting. "outgoing" has both inbound and outbound data.
> That doesn't sound like a tulip driver bug though it's certainly
> possible.

This is EXACTLY what happened to me when I conpiled a kernel for my C240
(just using the built-in network card) with a (buggy) gcc-3.2. Incoming
network traffic will crash the system, outgoing will work.

gcc-3.2 obviously miscompiles parts of the network code of the kernel,
whereas gcc-3.0 (with the very same kernel, same config) produced a
working kernel. I can't remember exactly what kernel/config and compiler,
but I sent the details to the list some months ago (I cann look them up
if somebody is interested).

Perhaps this helps to narrow down which part (driver or networking code)
of the kernel is affected by the miscompilation.
