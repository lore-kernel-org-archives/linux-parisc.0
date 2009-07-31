From: Helge Deller <deller@gmx.de>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset Table
 	overflow
Date: Fri, 31 Jul 2009 23:08:35 +0200
Message-ID: <4A735D53.6060803@gmx.de>
References: <20090731091729.1105.20608.reportbug@aragorn.fjphome.nl> <119aab440907311149j3e17466fy3782b86399142141@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Frans Pop <elendil@planet.nl>, 539378@bugs.debian.org,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Randolph Chung <randolph@tausq.org>,
	Debian Bug Tracking System <submit@bugs.debian.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440907311149j3e17466fy3782b86399142141@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 07/31/2009 08:49 PM, Carlos O'Donell wrote:
> [...]
> However, on 64-bit the long format of ldd has a 16-bit signed
> immediate offset (0xffff), meaning it can reach +0x7fff e.g. 4095 GOT
> slots.
>
> Do you have the time to test something out?
>
> * Make this conditional on 32-bit vs. 64-bit and allow for 4095 GOT
> entries on 64-bit.
> * Fix ELF_GOT_STUB for the 64-bit case. It needs to reassemble a
> 16-bit offset, the current code is IMO incorrect. i.e. it should be "&
> 0x7fff", and use a new reassemble_16 see the PA 2.0 book definition of
> ldd.
> * Build kernel.
> * Test loading NFS moudle.

Carlos, thanks a lot for those explanations (and keep up your work with NPTL :-)).
I'll know what you mean, and if it works it's a good idea.
I'll try to come up with a patch.

A few notes:
- the GOT table is only used for 64bit anyway, so no need to differentiate for 32/64bits
- Another possibility could be to sort the tables, so to reduce the number of needed entries.

Helge
