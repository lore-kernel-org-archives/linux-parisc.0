Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 29 Dec 2002 23:45:22 -0700
To: "Mark R. Buechler" <mgandalf@mentasm.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] A3308 fibre SCSI bridge support
Message-ID: <20021230064522.GG30857@dsl2.external.hp.com>
References: <1041195758.2916.30.camel@pc1.mentasm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1041195758.2916.30.camel@pc1.mentasm.com>
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

On Sun, Dec 29, 2002 at 04:02:38PM -0500, Mark R. Buechler wrote:
> I recently purchased a SCSI bridge (4/2 A3308) thinking I could use this
> with Linux but when I tried I found that it requires a driver. I can see
> the MUX and all devices connected to it from an HP workstation with the
> MUX driver loaded, but I'd really like to use this from Linux.

uhm...did you check to see which utilities you might need to manage
and configure the FC/SCSI mux?
http://www.software.hp.com/products/FCMAN/fcm3over.html

BTW, The A3308 usermanual (A3308-96011) is available here:
	http://www.software.hp.com/products/FCMAN/pdf/96011.pdf

> I'm wondering if anyone is working on a driver for this device and would
> it work with x86 as well?

The main FC HBA vendors (except Agilent?) seem to work fine on both x86 and
ia64 (HP ZX1, near cousin to HP PARISC platforms). I would expect them
to work fine on i386/parisc-linux too. I've only had time to play with
Agilent based (tachlite 5100/5166/5200 series) HBAs on parisc.

AFAICT, "FC 4/2 MUX" is only supported under HPUX.
I get the impression one would need to heavily modify an existing
FC driver in order to support the MUX functionality. But I don't
know how the A3308 presents SCSI devices and that will make/break
the support story.

hth,
grant
