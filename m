Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4CE7482A
	for <parisc-linux@parisc-linux.org>; Mon, 22 Oct 2001 12:05:59 -0600 (MDT)
Message-Id: <200110221801.MAA07129@puffin.external.hp.com>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Large SCSI disks on a 735/125 
In-Reply-To: Message from Matt Taggart <taggart@carmen.fc.hp.com>
   of "Sun, 21 Oct 2001 16:27:21 MDT." <20011021222721.6658837D25@carmen.fc.hp.com>
Date: Mon, 22 Oct 2001 12:01:57 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matt Taggart wrote:
> Last year sometime I saw Paul Bame install an 18GB 10k RPM LVD Seagate
> Cheetah drive in a 712 and install parisc-linux on it. It worked great :)

The LVD SCSI drives can also grok SE SCSI signal.
Not true for HVD drives.
But perhaps adding an SE SCSI interface to a 735 is possible.
(to address the original problem)

grant
