Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: =?ISO-8859-1?Q?Bj=F8rn_Djupvik?= <bjorn@sunshine.equant.no>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Question about RAID array 
In-Reply-To: Message from =?ISO-8859-1?Q?Bj=F8rn_Djupvik?= <bjorn@sunshine.equant.no>
   of "Thu, 07 Feb 2002 12:20:38 +0100." <Pine.LNX.4.30.0202071217510.26774-100000@sunshine.equant.no>
References: <Pine.LNX.4.30.0202071217510.26774-100000@sunshine.equant.no> 
Date: Thu, 07 Feb 2002 09:22:40 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020207162240.52CB6482A@dsl2.external.hp.com>
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

=?ISO-8859-1?Q?Bj=F8rn_Djupvik?= wrote:
> Hi, I am considering migrating a few boxes from hp-ux to parisc-linux as I
> have done this successfully on a 712/100 already.. The boxes in question
> are D-class servers (220,230,250,etc) and some of them have jurassic-era
> (ancient) C2300 disk arrays attached to them, which I know very little
> about.

1) D-class is quite a different beast than 712.
   Has anyone tried installing 0.9.3 on a D-class?
   Are all the interface cards you care about supported with linux drivers?

2) can someone confirm C2300 disk array  == "Cascade" from 1991-93?
   If so, it has utilities/daemon running that monitors the health of
   the array. I highly doubt that utility will ever get ported since it
   needs kernel driver support for a non-existant LUN 5 or 7 (I forgot).
   Consider replacing the array with SCSI JBOD. You'd get an order of
   magnitude increase in storage capacity and performance.

> Can anyone confirm that this is going to work under parisc-linux,
> I'd like to see a "success story" before I rip out hpux and install Linux
> =)

yeah - that's a good idea.

grant
