Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA20264
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Nov 1999 03:07:56 -0700
Date: Wed, 10 Nov 1999 11:10:49 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Alex deVries <adevries@thepuffingroup.com>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HIL status
Message-ID: <19991110111049.V25252@mencheca.ch.genedata.com>
References: <19991110004745.T25252@mencheca.ch.genedata.com> <Pine.LNX.4.10.9911100345000.11043-100000@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.9911100345000.11043-100000@vodka.thepuffingroup.com>; from Alex deVries on Wed, Nov 10, 1999 at 04:03:39AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Nov 10, 1999 at 04:03:39AM -0500, Alex deVries wrote:
> 
> Having ASP interrupts working will enable a lot of different boxes to be
> supported, mostly 715s.  I have a /50, /75 and probably /100 to test on.

The /50 and /75 are also Scorpio machines.  The /100 is either a Mirage or
a Turnip.  As such, I don't know if it has ASP.

> The closest things we have to ASP docs are:
> - take the portions of the Lasi docs that describe how Lasi is not like
> ASP, and read backwards

umm.. 4MB download this evening then...

> Hrm.  That's uncomfortable. So did it actually work at 0xf0800000?

Yep.

> The problem comes when we hit an ASP that's not at 0xf0800000, which I'd
> think might come up with ASP add on cards.

Do ASP add-in cards exist?  We could just refuse to support them until
we know more :-)

> I don't think that firmware is lying, though.  Perhaps we just need to
> subtract 0x2f000 for some reason.

Found out what this is in the mach sources.  It's called CORE_ASP:

/*
 * Structures defining memory-mapped registers in the Core IOSS (ASP).
 */
        vu_char reset;          /* (WO) IOSS reset */
        vu_char version;        /* (RO) version byte */
        vu_char scsi_dsync;     /* (WO) SCSI DSYNC enable bit (1:enable) */
        vu_char error;          /* bus errors while ASP masters SGC/VSC */
        vu_char lan_oen;        /* (WO) output enable Ethernet/FDDI */

Shortly below this is:

/*
 * Structures defining memory-mapped registers in the Core IOSS (LASI).
 */
struct core_lasi {
        vu_int  power;
        vu_int  error;
        vu_int  version;
        vu_int  reset;
        vu_int  arbmask;
};

which is defined to be at 0xF010C000.

> > Here's the driver list printed at boot on the 715 (is someone collecting
> > these somewhere?)
> 
> Within a week, I'll send some mail about The Puffin PA RISC Hardware
> Guide. Details to come.

Oh good.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
