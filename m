Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail1-haw-R.bigfish.com (mail-haw.bigfish.com [12.129.199.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F5904845
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Oct 2003 19:50:30 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Subject: RE: [parisc-linux] HP HSC J3516A (2 port) ethernet card  (supported??) ... And HP FC A3591 aka Mombasa GS
Date: Thu, 2 Oct 2003 20:48:59 -0500
Message-ID: <1289146742B56546AE580DFC6B711A83134826@PKDWB07C.ad.sprint.com>
From: "Padgett, Pat M [NTWK SVCS]" <PatPadgett@NMCC.SprintSpectrum.com>
To: "Matthew Wilcox" <willy@debian.org>
Cc: <parisc-linux@lists.parisc-linux.org>
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

Thanks, Matthew.  I will test with 2.6.0-test6-pa6 and share the
results.

Also, does anyone know which driver (if any) supports the follwing card
(HP Fibre Channel A3591).

The kernel reports them as :

2. Mombasa GS Add-on mass FC (A3591) (4) at 0xf1004000 [8/4], versions
0x18, 0x0, 0xa7
17. Mombasa GS Add-on mass FC (A3591) (4) at 0xf180c000 [10/12],
versions 0x18, 0x0, 0xa7

I have two R390's with two fibre channel cards each, all four cards are
connected to an FC-10.  My goal is to configure multiple paths to the
devices presented by the cards (via the multipathing personality in md).
I would then like to mirror the six 18GB drives I have (3 available, 3
for mirror, via md), and then stack LVM on top of the device(s) that md
makes available.

Multipath's would be configured like this :

/dev/sda and /dev/sdg -------- /dev/md0
/dev/sdb and /dev/sdh -------- /dev/md1
/dev/sdc and /dev/sdi -------- /dev/md2
/dev/sdd and /dev/sdj -------- /dev/md3
/dev/sde and /dev/sdk -------- /dev/md4
/dev/sdf and /dev/sdl -------- /dev/md5

Disks 1 and 2; 3 and 4; 5 and 6 would be mirrored (raid-1) :

/dev/md0 and /dev/md1 -------- /dev/md6
/dev/md2 and /dev/md3 -------- /dev/md7
/dev/md4 and /dev/md5 -------- /dev/md8

LVM on top of the mirrored disks :

/dev/md6 and /dev/md7 and /dev/md8 --- /dev/vg

Has anyone tried this before with success (assuming there are drivers
available that support my hardware)?

Thanks!

Pat Padgett

-----Original Message-----
From: Matthew Wilcox [mailto:willy@debian.org]=20
Sent: Thursday, October 02, 2003 10:47 AM
To: Padgett, Pat M [NTWK SVCS]
Subject: Re: [parisc-linux] HP HSC J3516A (2 port) ethernet card
(supported??)

On Thu, Oct 02, 2003 at 10:27:42AM -0500, Padgett, Pat M [NTWK SVCS]
wrote:
> I am trying to configure two HP J3516A's that I have in an R390.  They

> initially showed up while using the debian installation cd as eth0 and

> eth1 (the internal lan was eth2).  However, after reboot it seems that

> they are not being correctly initialized by the kernel (internal lan=20
> is now eth0).

I realise this probably isn't the answer you wanted to hear; but is
there any chance you could try 2.6 on this machine?  We just got GSC
Tulip cards working properly in 2.6 and it'd be really useful to know
that it works on your box too.  After we know that, we can try
backporting the changes to 2.4.
