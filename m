Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45228482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Sep 2002 02:49:30 -0600 (MDT)
Message-ID: <3D7B0F17.92F8A75A@gmx.at>
Date: Sun, 08 Sep 2002 10:49:27 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] Serial MUX support for Nova and K-Class
 systems.
References: <1029991787.4813.14.camel@beavis>  <3D7A7171.CEA2FEAE@gmx.at> <1031436239.581.19.camel@beavis>
Content-Type: text/plain; charset=us-ascii
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

Hello Ryan,

what I am looking for is the field definitions of the 
structures of the bus queries. I also have forgotten
the names here (I must go back to my "debug code"
and reread it !!!).
Oh, I have found it: 
	struct io_moudule
and
	struct bc_module
(especially for the second one, I have no idea, where
it comes from). All these structure (there are more)
are defined in `include/asm/hardware.h'.

I have to get back to my hacks, to know more details 
again.

Christoph


Ryan Bradetich wrote:
> 
> Hi Christoph,
> 
> I'm working on solving the problem why we do not find
> the MUX device.  The ESIEE team has generously given
> me access to an E35 so I could poke around the HP-UX
> iotree and see what I could find.
> 
> This is the summary of what I have found:
> 
> name_buffer instance hw_addr   parent  sibling    child
> "bc"               1      56 0x43b3a0 0xc15240 0xc15040
>   "scsi1"          0      52 0xc15000 0xe74140 0xc15080
>   ""              -1      53 0xc15000 0xc15200        0
>   "mux2"           0      56 0xc15000        0        0
> "bus_adapter"      0      60 0x43b3a0 0xe74240 0xc15280
>   "lan2"           0       6 0xc15240        0        0
> "processor"        0      62 0x43b3a0 0xe74280        0
> "memory"           0      63 0x43b3a0        0        0
> 
> The MUX sits at: 56/56 with HPA: 0xfffb8000
> 
> >From your boot logs posted to the mailing list:
> 
> ---- walk_native_bus:    testing hpa=0xfffb8000, i=56
> ---- walk_native_bus:    -- device not processed, mod = i !
> ------ alloc_pa_dev: entry
> -------------------------- find_parisc_device: entry, mod=56
> -------------------------- find_parisc_device:   bc[0]=-1
> -------------------------- find_parisc_device:   bc[1]=-1
> -------------------------- find_parisc_device:   bc[2]=-1
> -------------------------- find_parisc_device:   bc[3]=-1
> -------------------------- find_parisc_device:   bc[4]=-1
> -------------------------- find_parisc_device:   bc[5]=-1
> -- walk_lower_bus: entry
> -- walk_lower_bus: dev: hpa=0xfffb8000, io_io_low=0xfff00000,
> io_io_high=0xfff80000
> 
> You also found a device at 0xfffb8000 which I am assuming is the MUX.
> (I need to get back on the E35 at the ESIEE to verify my thoughts.)
> 
> The problem we are running into here is that 0xfffb8000 is on the
> Central BUS, not under the 56/ bus as the console wants to be in
> the HP-UX iotree.  It appears to me that the bc and the MUX exist
> at the same HPA and that is what is causing the confusion in the
> parisc-linux I/O tree.
> 
> The other thing that is curious to me is the "" devices under the
> bc between the scsi1 and the mux2 device.
> 
> I think I can get this problem solved once I get access to the
> ESIEE E35 and am able to boot some test kernels on the system to
> play with.
> 
> As for the scsi driver.  I have the bare-bones (ie. does not work)
> of both the skunk (8-bit) and the wizard (16-bit) drivers started from a
> while back.  I think you found a reference to the SPIFI chip that we
> could use in the driver to further progress the drivers and hopefully
> get them talking.
> 
> The document is the IOACD document I believe.  What are you looking for?
> Parts of the document are on the parisc-linux website, but if that is
> not enough info, I'll try to find it for you in the IOACD.
> 
> Thanks!
> 
> - Ryan
> 
> On Sat, 2002-09-07 at 15:36, Christoph Plattner wrote:
> > Hallo Ryan,
> >
> > after that long time, I did the first experiment with
> > your new MUX driver ...
> >
> > ... and it fails on my E55.
> >
> > But NO WONDER ! I already have the problem finding any
> > devices on the I/O interface card, and I had no time
> > since weeks now, to do further steps.
> >
> > In general I have the problem in basic stuff and in
> > docu, special for the I/O scanning via PDC in more
> > details. In the normal PDC/IO there is not enough docu
> > for that. I was informed, that there is one more docu
> > handling this, bt I forgot the name, something like
> > "AIO" or so.
> >
> > How we can go one step forward, as I also want to
> > start (in slowly steps) the SCSI driver ... ?
> >
> > Bye,
> > Christoph
> >
> >
> >
> > Ryan Bradetich wrote:
> > >
> > > Hello all,
> > >
> > > I just committed support for the Serial MUX driver as linux-2.4.19-pa5.
> > >
> > > This patch has been tested on my K460 and has been working well.  The
> > > driver uses the same /dev/ttyB0 device the PDC Software console that
> > > Christoph Plattner wrote and is available under the Non-standard serial
> > > ports section.
> > >
> > > Currently the driver only supports the Eole CAP/MUX (A Direct) device
> > > since that is all I have to test with.  Additional devices can be added
> > > under this driver as people with systems have a chance to test.
> > >
> > > I tried to document the driver with kerneldoc, but it would be nice if
> > > someone would check over my comment as I had to google/guess what most
> > > of the ioctls and tty flags were.
> > >
> > > The committed patch can be found at:
> > >         ftp://ftp.parisc-linux.org/patches/serial_mux_v0.1.diff
> > >
> > > Feedback greatly appreciated!
> > >
> > > Thanks,
> > >
> > > - Ryan
> > >
> > > _______________________________________________
> > > parisc-linux mailing list
> > > parisc-linux@lists.parisc-linux.org
> > > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
> > --
> > -------------------------------------------------------
> > private:      christoph.plattner@gmx.at
> > company:      christoph.plattner@alcatel.at
> >

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
