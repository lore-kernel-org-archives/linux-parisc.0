Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3EB17482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 17:15:01 -0700 (MST)
Message-ID: <3BF9A080.C7DC7EB4@gmx.at>
Date: Tue, 20 Nov 2001 01:14:56 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: Thomas Marteau <marteaut@esiee.fr>,
	grundler@puffin.external.hp.com, ryan_bradetich@uswest.net,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: E55 status - NEW CVS DIFF (DRIVER)
References: <3B4396D8.9A33414F@gmx.at> <3BF4E38C.D59603FE@esiee.fr> <3BF98AD5.9BCB6861@gmx.at> <20011119233355.B652@parcelfarce.linux.theplanet.co.uk>
Content-Type: multipart/mixed;
 boundary="------------D1202EA6272D226F6FF46EFF"
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

This is a multi-part message in MIME format.
--------------D1202EA6272D226F6FF46EFF
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello again !

I have redone the stuff and have incorporated your commenst.
Further I have sent my two files as tar.gz, as the leading '>' may
also come from the mailer environment, as `-u' definitly does not
write '>' or '<', only +/-.

I have used the settings from the `.cvsrc' now.

Bye
Christoph P.



Matthew Wilcox wrote:
> 
> Let's try a quick audit...
> 
> On Mon, Nov 19, 2001 at 11:42:29PM +0100, Christoph Plattner wrote:
> > cvs server: Diffing .
> > cvs server: Diffing Documentation
> 
> could you use the cvsrc distributed as part of build-tools?  it removes
> this extra verbiage...
> 
> > +     /* wait for a keyboard (rs232)-input */
> > +     do {
> > +             unsigned long flags;
> > +
> > +             save_flags(flags);
> > +             cli();
> > +             status = real32_call(PAGE0->mem_kbd.iodc_io,
> > +                     (unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
> > +                     PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers),
> > +                     __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
> > +             restore_flags(flags);
> > +             ch = *iodc_dbuf;        /* save the character directly to ch */
> > +     } while (0) ;                   /* once !! */
> 
> please use spin_lock_irqsave/restore instead.
> 
> > #ifdef SERIAL_INLINE
> > #define _INLINE_ inline
> > #else
> > #define _INLINE_
> > #endif
> 
> i hate this.  all examples of this have been removed from our tree afaik..
> 
> have to go out now... back later.
> 
> --
> Revolutions do not require corporate support.

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
--------------D1202EA6272D226F6FF46EFF
Content-Type: application/x-gzip;
 name="palinux-outgoing-20011120.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="palinux-outgoing-20011120.tar.gz"

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
A+yqOZ0AeAAA
--------------D1202EA6272D226F6FF46EFF--
