Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from blaprocopc08.bausch.com (unknown [161.242.9.34])
	by dsl2.external.hp.com (Postfix) with SMTP id 3C171482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Dec 2002 08:13:38 -0700 (MST)
Message-ID: <B0E6075E55C7D6119DDE0002A53F8BCE0DE458@blmsrocopc07.bausch.com>
From: "Buechler, Mark R" <Mark_R_Buechler@bausch.com>
To: 'Grant Grundler' <grundler@dsl2.external.hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Mon, 30 Dec 2002 10:13:24 -0500
Subject: RE: [parisc-linux] A3308 fibre SCSI bridge support
MIME-Version: 1.0
Content-Type: text/plain
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

Configuring the MUX isn't a problem. What I'd like to do is access the SCSI
devices connected to the MUX from Linux. From a Linux host I see the MUX as
a single target. I wouldn't think any changes would be necessary for the FC
driver but rather a separate driver would exist that scans for the MUX and
uses the Linux sg driver to communicate with it.

I've found mention of a SCSI/MUX driver on this mailing list in the archives
but I don't know what MUX they were referring to.

- Mark.

-----Original Message-----
From: parisc-linux-admin@lists.parisc-linux.org
[mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of Grant
Grundler
Sent: Monday, December 30, 2002 1:45 AM
To: Mark R. Buechler
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] A3308 fibre SCSI bridge support


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
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux










EMAIL DISCLAIMER 

Please Note: The information contained in this message may be privileged and
confidential, protected from disclosure, and/or intended only for the use of
the individual or entity named above. If the reader of this message is not
the intended recipient, or an employee or agent responsible for delivering
this message to the intended recipient, you are hereby notified that any
disclosure, distribution, copying or other dissemination of this
communication is strictly prohibited. If you received this communication in
error, please immediately reply to the sender, delete the message and
destroy all copies of it.

Thank You
