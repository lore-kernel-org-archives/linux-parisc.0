Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D28B482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Jan 2002 16:13:58 -0700 (MST)
Date: Tue, 22 Jan 2002 00:13:51 +0100 (CET)
From: Peter Mottram <peter@petescaff.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Peter Mottram <peter@petescaff.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] partitioned md to enable root on raid
In-Reply-To: <20020121203237.74F8C482A@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.42.0201220007440.13910-100000@r6.petescaff.com>
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

On Mon, 21 Jan 2002, Grant Grundler wrote:
> Peter Mottram wrote:
> > In order to use md on root devices with parisc there must be kernel
> > support for partitioned md (due to F0 partition).
>
> Are you implying that CONFIG_MD can only use full disks?
> linux/Documentation/Configure.help suggests CONFIG_MD only knows
> about the partitions you configure it for.

You can construct MD devices out of whole disks or partitions but you
cannot partition an MD device without Neil Brown's patches. What I would
like to achieve is to construct an MD device for use as a boot disk and
then partition it including the F0 partition in order that the LIF is also
mirrored. This cannot be done with a stock kernel.

OK - maybe the answer is to construct non-mirrored F0 partitions on both
boot disks and then use the rest of the disk for MD & boot from LVM
partitions. Here's the next question - does palo understand how to
boot from LVM?

PeteM
