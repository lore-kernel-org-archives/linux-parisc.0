Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5966F4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 11:20:03 -0700 (MST)
Date: Mon, 11 Nov 2002 13:20:12 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org, tausq@debian.org
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111182012.GN8848@systemhalted>
References: <20021111171255.GI8848@systemhalted> <200211111736.gABHaP7E002352@hiauly1.hia.nrc.ca> <20021111180016.D29998@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021111180016.D29998@parcelfarce.linux.theplanet.co.uk>
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

On Mon, Nov 11, 2002 at 06:00:16PM +0000, Matthew Wilcox wrote:
> On Mon, Nov 11, 2002 at 12:36:25PM -0500, John David Anglin wrote:
> > > Looks like we need some __asm format fixes?
> > 
> > These are the changes that I had for glibc-2.2.5-14 to build with gcc-3.3.
> > The string literal change makes the asms ugly but I think we have to live
> > with it.  I don't know the ins and outs of why the change was necessary
> > but I know the cpp people will not change back.
> 
> > +	stw	%rp,-20(%sp)\n\
> > +	stwm	%r4,64(%sp)\n\
> > +	stw	%r19,-32(%sp)\n\
> 
> By and large we've preferred the following style which is less ugly, IMO:
> 
> "	stw	%rp,-20(%sp)\n"
> "	stwm	%r4,64(%sp)\n"
> "	stw	%r19,-32(%sp)\n"
> 

All of Uli's fixes have been the ugly way, though I'll change
pt-initfini the nice and pretty way and hope they take the patch :)

c.
