Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABCA84845
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Jul 2002 04:22:06 -0600 (MDT)
Date: Sat, 20 Jul 2002 12:21:54 +0200 (CEST)
From: Peter Mottram <peter@petescaff.com>
To: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	parisc list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110, kernel Panics, still more tears ;-(
In-Reply-To: <3D393310.D3AB411A@ruhr-west.de>
Message-ID: <Pine.LNX.4.44.0207201218410.21970-100000@r6.petescaff.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Sat, 20 Jul 2002, Juergen Braukmann wrote:

[snip]

> I dreaded that question. ;-) This is a rescue-workststion that would
> have been dumped otherwise. I have only 64 MB RAM. There are two modules
> 32 MB each, straigt in front of the ventilator (it used to be more, but
> they took some 128 MB off). Is there some relevant placing of the
> modules? In total, there are 8 memory slots. Processor in front, it is
> J1-J2-J3-J4, space J5-J6-J7-J8. My modules are placed in slot 6 and 8.
> (If you look at them from the other side, they are numbered 0A, 2A, 0B,
> 2B, space 1A, 3A, 1B, 3B. I use slots 0A and 0B, that should be fine)

Yes - this is the correct placing for memory - these systems should always
use equal-sized pairs of memory which should be placed (largest first)
starting in the lowest numbered slots.

[snip]

> Apart from two ventilarors and plenty of dust that describes the content
> of my box. The SCSI bus connects to my HP2490A disc, I disconnected the
> two Ultra (or whatever) SCSI drive with HP-UX.

The internal disks are fast-wide differential & the external SCSI ports
are FW-diff & single-ended. I don't know the 2490A.

R.
PeteM
