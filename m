Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 30 Dec 2002 12:43:50 -0700
To: "Buechler, Mark R" <Mark_R_Buechler@bausch.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] A3308 fibre SCSI bridge support
Message-ID: <20021230194350.GE20066@dsl2.external.hp.com>
References: <B0E6075E55C7D6119DDE0002A53F8BCE0DE458@blmsrocopc07.bausch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <B0E6075E55C7D6119DDE0002A53F8BCE0DE458@blmsrocopc07.bausch.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Mon, Dec 30, 2002 at 10:13:24AM -0500, Buechler, Mark R wrote:
> Configuring the MUX isn't a problem.

ok.

> What I'd like to do is access the SCSI
> devices connected to the MUX from Linux. From a Linux host I see the MUX as
> a single target.

Can you copy the output here?
I'm curious how it's reported.

> I wouldn't think any changes would be necessary for the FC
> driver but rather a separate driver would exist that scans for the MUX and
> uses the Linux sg driver to communicate with it.

the sg driver is a passthru interface and doesn't present a "random
access mass storage device" view. sg would be used to configure
the MUX and sd to access the devices behind it.

My point was the existing FC interface drivers already present FC
storage devices (eg disks or arrays) via "sd" driver and don't know how
to talk to devices that aren't "transperent" (ie invisible nodes in the
FC fabric).
