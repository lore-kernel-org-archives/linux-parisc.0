Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3739F48A8
	for <parisc-linux@parisc-linux.org>;
	Tue, 17 Feb 2004 14:28:12 -0700 (MST)
Date: Tue, 17 Feb 2004 16:27:40 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [parisc-linux] Job for someone
Message-ID: <20040217212740.GC12535@baldric.uwo.ca>
References: <20040217144206.GQ31168@parcelfarce.linux.theplanet.co.uk>
	<20040217150320.GA27567@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040217150320.GA27567@lst.de>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Feb 17, 2004 at 04:03:20PM +0100, Christoph Hellwig wrote:
> On Tue, Feb 17, 2004 at 02:42:06PM +0000, Matthew Wilcox wrote:
> > I was contacted by one of the Debian XFree86 people yesterday asking if
> > someone would like to look at the XFree86 loader for parisc so they could
> > rearrange the packaging to ship the modules separately from the server.
> > I don't have any great desire to work on a dynamic linker, but I bet
> > somebody else does ... ;-)
> 
> Maybe that someone should fix the issue right and switch XFree to use
> dlopen() for Linux.  If some other OSes want to keep the current junk
> it'll be their problem to fix it..

I spent time reviewing the loader code in XFree86 and the loader code in
glibc (when I fixed our relocation processing for COPY relocs).

So here are my two cents:

o As I understand it, the startup sequence of XFree86 is precarious, and
  loading the module via dlopen doesn't work because the symbol
  resolution order cannot follow the ELF standard 100%. It has to be done
  slightly out of order to bootstrap the server. This seems silly and
  should probably be fixed, but would require testing across all
  platforms. I figure it hasn't been done for that particular reason.

o It's not a horrible job to add our relocations to the XFree86 code,
  and I could probably do it given a couple of weeks. I almost started
  the job a year ago but lost steam when I blew the video out of my
  712/60.

So I'll set out the following challenge, if someone ships me a video
card for my c3k I'll fix the XFree86 loader. Short of that I imagine
that a 712/60 mobo with a working onboard video would be just as good :)

c.
