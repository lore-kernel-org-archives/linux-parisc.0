Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from crack.them.org (crack.them.org [65.125.64.184])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0E96F487A
	for <parisc-linux@parisc-linux.org>; Mon, 24 Feb 2003 11:48:19 -0700 (MST)
Date: Mon, 24 Feb 2003 13:47:47 -0500
From: Daniel Jacobowitz <dan@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: law@redhat.com, Alan Modra <amodra@bigpond.net.au>,
	binutils@sources.redhat.com, parisc-linux@parisc-linux.org
Message-ID: <20030224184747.GA3272@nevyn.them.org>
References: <20030224182328.M2938@parcelfarce.linux.theplanet.co.uk> <200302241839.h1OIdqBf016932@localhost.redhat.com> <20030224184225.N2938@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030224184225.N2938@parcelfarce.linux.theplanet.co.uk>
Subject: [parisc-linux] Re: [PATCH] space register 0 changes for hppa
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

On Mon, Feb 24, 2003 at 06:42:25PM +0000, Matthew Wilcox wrote:
> On Mon, Feb 24, 2003 at 11:39:52AM -0700, law@redhat.com wrote:
> > Err, I built it without difficulty a few months ago (I don't do nearly as
> > much PA work as I used to).  Presumably you have an HPUX box, right?  That's
> > the easiest way to get it build and running.
> 
> nope, no hpux, only i386-linux and hppa-linux around here.  trying to
> get binutils cvs to build a cross i386->hppa gdb dies in tix (no tk8.4
> directory), trying with just `make all-binutils all-gdb' dies being
> unable to find dl.h or machine/save_state.h.
> 
> so switch to trying native on an hppa-linux host with gdb-5.3.  that dies
> claiming hppa-linux is unsupported.  apply the debian patches.  that build
> dies trying to find texc.pro.
> 
> i'm willing to put in a certain amount of time & effort, but this is
> too much.

That means the version of texinfo install on that machine is broken. 
It was fixed in Debian/unstable some months ago.

-- 
Daniel Jacobowitz
MontaVista Software                         Debian GNU/Linux Developer
