Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 05EDA482A
	for <parisc-linux@parisc-linux.org>; Fri,  1 Jun 2001 11:33:01 -0600 (MDT)
To: Thomas Marteau <marteaut@esiee.fr>
Cc: Nicolai Leymann <n.leymann@berkom.de>,
	"parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] palinux 0.9 on 715/64 STI 
In-Reply-To: Your message of "Fri, 01 Jun 2001 13:14:58 +0200."
             <3B177932.235F76E4@esiee.fr>
References: <NDBBKPOMPCLCKIFPPHMNKEBKCOAA.n.leymann@berkom.de>  <3B177932.235F76E4@esiee.fr> 
Date: Fri, 01 Jun 2001 11:32:59 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E155snD-0008EK-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

I've corrected the ISO image with the STI problem (the file /narrowsti.conf
is still wrong -- see the errata).  If you have an old copy of this ISO, you
can patch it by downloading

http://puffin.external.hp.com/pub/parisc/cd-images/palinux-0.9-32sti.iso.sector0

    and running:

dd if=palinux-0.9-32sti.iso of=palinux-0.9-32sti.iso.sector0 conv=notrunc bs=512

    *** Do Not Omit the 'conv=notrunc'!!!!
