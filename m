Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id B42BC482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 17:15:46 -0600 (MDT)
Message-Id: <200110202311.RAA22159@puffin.external.hp.com>
To: Steve.Grady@csiro.au
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Large SCSI disks on a 735/125 
In-Reply-To: Message from Steve.Grady@csiro.au
   of "Sun, 21 Oct 2001 08:05:16 +1000." <49AA3A3C863E5B4C911320AEF99E5DA3010CCBC0@wing-ep.tip.csiro.au>
Date: Sat, 20 Oct 2001 17:11:53 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Steve.Grady@csiro.au wrote:
> Hi,
> 
> I want to put a large SCSI disk either 9.1G or 18.2G SCSI disk on a HP
> 735/125 does anyone know if this will work under PARISC-linux and will I be
> able to see the whole disk?

large disks are not a problem.
The question is will you be able to find a 9 or 18GB disk
with either SE SCSI or HVD SCSI interface which the 735
can connect to.

grant
