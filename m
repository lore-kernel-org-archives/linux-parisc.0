Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: marc@centraltx.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel Panic 
In-Reply-To: Message from "marc " <marc@centraltx.com>
   of "Sat, 07 Sep 2002 15:46:25 CDT." <200209071546.AA210633180@mail.centraltx.com>
References: <200209071546.AA210633180@mail.centraltx.com> 
Date: Sat, 07 Sep 2002 16:08:43 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020907220843.24818482A@dsl2.external.hp.com>
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

"marc " wrote:
> It looks like the st is no longer a loadable kernel module?

Right. It's not:
CONFIG_CHR_DEV_ST=y

See arch/parisc/debian-configs/* for default configs.

> st0: Error on write filemark.
> st0: Error with sense data: Current st09:00: sns = 70  4
> ASC=44 ASCQ= 0
> Raw sense data:0x70 0x00 0x04 0x00 0x00 0x00 0x00 0x12 0x00 0x00 0x00 0x00 0x
>   44 
> 0x00 0x00 0x00 0xa3 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
> tar: /dev/st0: Warning: Cannot close: Input/output error

Seagate (and other vendors) publishes the subset of SCSI spec they implement.
It includes Sense Key/ASC/ASCQ encodings.
Look for "scsi2_seagate.pdf" on www.seagate.com web site.

Sense Key  = 0x04 == "Hardware Error"
ASC/ASCQ = 0x44/0 == "Internal Target Failure"

You need to find the programming manual for your tape device
and hopefully it explains exactly what this means.

grant
