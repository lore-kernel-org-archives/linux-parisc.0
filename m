Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2DCC24852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 18:01:33 -0700 (MST)
Date: Sat, 21 Feb 2004 18:01:31 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Jesse Dougherty <jesse@cypress-tech.com>
Subject: Re: [parisc-linux] HP A3312A High Availability Jamaica storage arrays
Message-ID: <20040222010131.GB30849@colo.lackof.org>
References: <40351470.90F0B475@cypress-tech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40351470.90F0B475@cypress-tech.com>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Feb 19, 2004 at 02:54:24PM -0500, Jesse Dougherty wrote:
> If anyone wants any, we are giving them away, I only ask
> that you pay for shipping out of Tampa (33762).

That's generous! Thanks!
(I have several sitting here and can reccomend them)

> They take either FWD or SE drives and the capacity is 8 low profile
> drives.

FYI, the disks inside are *USUALLY* Single Ended (ie LVD) SCSI with 80pin
SCA connectors. An additional circuit in the disk "carrier" (aka "sled")
converts to HVD or forces to SE mode. I'm using 73G SCSI drives in such
a Jamaica disk enclosure today. Problem is HVD and SE SCSI only support
up to 40 MB/s.

IIRC, this was the first HP disk enclosure which supported hotplug on HPUX.

grant
