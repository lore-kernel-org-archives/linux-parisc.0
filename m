Return-Path: <mpshenoy@vsnl.com>
Received: from rwcrmhc11.comcast.net (rwcrmhc11.comcast.net [204.127.198.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 93D78483C
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 29 Mar 2004 20:47:49 -0700 (MST)
From: "Prakash Shenoy" <mpshenoy@vsnl.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] HP 9000 Visualize C180 Workstation display does not
	appear.
Date: Mon, 29 Mar 2004 22:47:59 -0500
Message-ID: <OFEELBIMFFDMJBJFHICCKELICEAA.mpshenoy@vsnl.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Thanks. Using tab key I could sucessfully bring the display up.
I also installed Debian 2.4 using net-iso
(palinux-2.4.21-pa6-20030718-netinst.iso).
The installation gets completed without any problem but the system does not
come up after
reboot.

I have two SCSI hard disks on the workstation and debian installed on drive
0. The system
stops at ISL prompt.

Please help.

Prakash


On Thu, Mar 25, 2004 at 10:06:35PM -0500, Prakash Shenoy wrote:
> Hi!
>
> I recently bought a HP 9000 Visualize C180 workstation from a vendor on
eBay
> and EVC to VGA Video Adapter Cable from another vendor. Both claim that
Non
> DOA on arrival.
>
> The workstation appears to boot properly but no display appears. Has any
one
> come across this situation.

Have you tried hitting <tab> key at power up?
That should let you cycle through the various supported
graphics modes.

Have you tried with a serial console?
disconnect the keyboard before doing this.

This is a FAQ but it's not in the parisc-linux FAQ.
If someone has a moment to submit a patch against
cvs.parisc-linux.org's web/src/faq/index.x I'll be
happy to edit/submit it.

thanks,
grant
