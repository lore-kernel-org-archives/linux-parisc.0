Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Message-ID: <3D7A7171.CEA2FEAE@gmx.at>
Date: Sat, 07 Sep 2002 23:36:49 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux-cvs@lists.parisc-linux.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] Serial MUX support for Nova and K-Class
 systems.
References: <1029991787.4813.14.camel@beavis>
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

Hallo Ryan,

after that long time, I did the first experiment with
your new MUX driver ...

... and it fails on my E55.

But NO WONDER ! I already have the problem finding any
devices on the I/O interface card, and I had no time
since weeks now, to do further steps.

In general I have the problem in basic stuff and in
docu, special for the I/O scanning via PDC in more
details. In the normal PDC/IO there is not enough docu
for that. I was informed, that there is one more docu
handling this, bt I forgot the name, something like
"AIO" or so.

How we can go one step forward, as I also want to 
start (in slowly steps) the SCSI driver ... ?

Bye,
Christoph



Ryan Bradetich wrote:
> 
> Hello all,
> 
> I just committed support for the Serial MUX driver as linux-2.4.19-pa5.
> 
> This patch has been tested on my K460 and has been working well.  The
> driver uses the same /dev/ttyB0 device the PDC Software console that
> Christoph Plattner wrote and is available under the Non-standard serial
> ports section.
> 
> Currently the driver only supports the Eole CAP/MUX (A Direct) device
> since that is all I have to test with.  Additional devices can be added
> under this driver as people with systems have a chance to test.
> 
> I tried to document the driver with kerneldoc, but it would be nice if
> someone would check over my comment as I had to google/guess what most
> of the ioctls and tty flags were.
> 
> The committed patch can be found at:
>         ftp://ftp.parisc-linux.org/patches/serial_mux_v0.1.diff
> 
> Feedback greatly appreciated!
> 
> Thanks,
> 
> - Ryan
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
