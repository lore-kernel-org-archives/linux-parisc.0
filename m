Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C96EA482A
	for <parisc-linux@parisc-linux.org>; Tue, 14 Aug 2001 10:02:17 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15Wgdw-00061N-00; Tue, 14 Aug 2001 17:02:12 +0100
Date: Tue, 14 Aug 2001 17:02:12 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] iotree thoughts
Message-ID: <20010814170212.A22144@parcelfarce.linux.theplanet.co.uk>
References: <willy@debian.org> <200108091506.JAA13380@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200108091506.JAA13380@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Thu, Aug 09, 2001 at 09:06:43AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 09, 2001 at 09:06:43AM -0600, Grant Grundler wrote:
> Yes. AFAIK, LASI sub-devices are listed by PDC. For Dino HPUX makes
> a special hvers PDC call. Need to look at the HPUX code or Raven PDC ERS.

If you could dig those out for me, that'd be great.  I'm not familiar with
the layout of the HPUX source tree yet.

> > 
> > Here's my plan:
> > 
> >  * From setup_arch, call PDC to get a list of devices.  Put them in a
> >    table (marked __init, will be freed later).
> 
> Why not start building a tree with "place holder" nodes directly?
> Do we need the intermediate table because of memory issues?
> 
> ie build a "sparse" tree and have Native Bus walk fill in (or update
> wrong) info for devices it finds.

Two reasons: first, kmalloc isn't initialised at this point.  Changing
this would be moderately hard and would require a large reorganisation
of the initialisation code.  Secondly, building a sparse tree would take
more code :-)

> >  * In the badly-named gsc_init, or perhaps in pcibios_init, start the
> >    ABW at 0xFFF80000 -- this seems to be the defined location for the
> >    central bus.
> 
> My long term goal is to be able to build a kernel w/o CONFIG_PCI defined.
> And renaming gsc_init to native_bus_init() sounds like a good idea.

That's a good point.  A good step towards that would be..

Index: include/asm-parisc/io.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/io.h,v
retrieving revision 1.22
diff -u -p -r1.22 io.h
--- io.h        2001/07/15 22:30:29     1.22
+++ io.h        2001/08/14 15:59:37
@@ -43,9 +43,6 @@
 #endif /* USE_HPPA_IOREMAP */
 
 #if defined(CONFIG_PCI) || defined(CONFIG_ISA)
-/*
- *     So we get clear link errors 
- */
 extern unsigned char inb(unsigned long addr);
 extern unsigned short inw(unsigned long addr);
 extern unsigned int inl(unsigned long addr);
@@ -54,6 +51,13 @@ extern void outb(unsigned char b, unsign
 extern void outw(unsigned short b, unsigned long addr);
 extern void outl(unsigned int b, unsigned long addr);
 
+#else
+#define inb(a) BUG()
+#define inw(a) BUG()
+#define inl(a) BUG()
+#define outb(a) BUG()
+#define outw(a) BUG()
+#define outl(a) BUG()
 #endif
 
 extern void memcpy_fromio(void *dest, unsigned long src, int count);


-- 
Revolutions do not require corporate support.
