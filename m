Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0302A482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Jun 2001 07:19:41 -0600 (MDT)
Sender: Jes.Sorensen@cern.ch
To: Keith Owens <kaos@ocs.com.au>
Cc: sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SCSI in arch/{m68k,parisc,sparc*}/config.in
References: <2105.993214803@ocs3.ocs-net>
From: Jes Sorensen <jes@sunsite.dk>
Date: 22 Jun 2001 15:18:57 +0200
In-Reply-To: Keith Owens's message of "Fri, 22 Jun 2001 23:00:03 +1000"
Message-ID: <d3ofrgbqke.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Keith" == Keith Owens <kaos@ocs.com.au> writes:

Keith> cc: kaos@ocs.com.au please, I am not on these lists.
Keith> arch/{m68k,parisc,sparc*}/config.in have their own SCSI list
Keith> instead of using drivers/scsi/Config.in.  Cleaning up the SCSI
Keith> config file is on my 2.5 TODO list, can you tell me why these
Keith> architectures have their own list of SCSI devices?

Keith> If it is because only some SCSI drivers work on these
Keith> architectures, do you really need to be this specific?  Other
Keith> architectures source drivers/scsi/Config.in without checking
Keith> for arch dependent drivers.  If the need is to support extra
Keith> arch specific drivers, use the same technique as acorn :-

For the m68k it's because we do not support any PCI/ISA devices and
all the SCSI drivers in drivers/scsi/Config.in at least used to not be
protected by CONFIG_ISA, CONFIG_PCI etc. hence we would end up with
200 questions about SCSI drivers that do not work. If you can convince
Linus to take a patch that puts CONFIG_{ISA,PCI,SBUS,NUBUS,ZORRO} in
drivers/scsi/Config.in then we can move it no problem.

Jes
