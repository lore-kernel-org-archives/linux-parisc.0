Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7F614840
	for <parisc-linux@parisc-linux.org>;
	Sat, 31 Jan 2004 21:52:10 -0700 (MST)
Date: Sat, 31 Jan 2004 21:52:09 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: "AYAZ, MOHAMMED ASIF" <asifayaz@hp.com>
Subject: Re: [parisc-linux] UNable to boot the cd.
Message-ID: <20040201045209.GB3730@colo.lackof.org>
References: <8BF7471D09AA9B4190A9C96778BC2A1748D21C@qcaexc02.asiapacific.cpqcorp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <8BF7471D09AA9B4190A9C96778BC2A1748D21C@qcaexc02.asiapacific.cpqcorp.net>
Cc: parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Feb 01, 2004 at 04:46:01AM +0530, AYAZ, MOHAMMED ASIF wrote:
> Hello . 
> I have downloaded  the  iso images from
> ftp.de.debian.org/debian-cd/3.0_r0/hppa
> and made a bootable cd of the image..

Can you elaborate (give precise steps) on how you accomplished this?
The ISO images are "raw" files. ie burn them bit-for-bit to the CD.
On a linux box, use
	cdrecord -v dev=0,0,0 -data debian-30r0-hppa-binary-1.iso

where "0,0,0" matches the output from "cdrecord -scanbus".


> All I  did  is to search for ipl from the PDC main menu. but it
> doesnt show the cdrom as an ipl device. 

It will show up. If you absolutely can't get this work,
start thinking about doing a bootp/net install.

> I'm testing this on a A class server !! 

Which one? A180 or A500?
It doesn't really matter since palo is "smart" and will pick
the right kernel (32 vs 64 bit). I'm just curious.

grant
