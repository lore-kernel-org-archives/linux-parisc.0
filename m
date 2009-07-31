From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset Table
	overflow
Date: Fri, 31 Jul 2009 14:49:27 -0400
Message-ID: <119aab440907311149j3e17466fy3782b86399142141@mail.gmail.com>
References: <20090731091729.1105.20608.reportbug@aragorn.fjphome.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Debian Bug Tracking System <submit@bugs.debian.org>
To: Frans Pop <elendil@planet.nl>, 539378@bugs.debian.org,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090731091729.1105.20608.reportbug@aragorn.fjphome.nl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jul 31, 2009 at 5:17 AM, Frans Pop<elendil@planet.nl> wrote:
> Affects both stable and unstable!
>
> kernel: Linux version 2.6.26-2-parisc64-smp [...]
> kernel: nfs: Global Offset Table overflow (used 1075, allowed 1023)
>
> kernel: Linux version 2.6.30-1-parisc64 [...]
> kernel: nfs: Global Offset Table overflow (used 1164, allowed 1023)
>
> The error comes from arch/parisc/kernel/module.c.
> Looks like it is a known issue:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2006-October/054826.html

CC'ing parisc-linux since this is a kernel issue.

Helge,

Did you ever work around the GOT limitations?

To give you a bit of background, position independent code (a module)
can't have any virtual addresses (they aren't known), therefore when
you need to compute the address of an object you do so using the
global offset table. After relocation processing the GOT allows you to
translate an object by name to a virtual address e.g. If you take the
address of a function, then relocations would cause a GOT entry to be
filled such that this entry contains the virtual address of the
function. The GOT stubs are pieces of code that load virtual addresses
from the GOT and call them. We use GOT stubs to call functions which
are not local to the module.

Only 32-bit targets have the 14-bit signed immediate offset (0x3fff),
which becomes a 13-bit limit when loading positive offsets e.g.
+0x1fff or 1023 GOT slots.

However, on 64-bit the long format of ldd has a 16-bit signed
immediate offset (0xffff), meaning it can reach +0x7fff e.g. 4095 GOT
slots.

Do you have the time to test something out?

* Make this conditional on 32-bit vs. 64-bit and allow for 4095 GOT
entries on 64-bit.
* Fix ELF_GOT_STUB for the 64-bit case. It needs to reassemble a
16-bit offset, the current code is IMO incorrect. i.e. it should be "&
0x7fff", and use a new reassemble_16 see the PA 2.0 book definition of
ldd.
* Build kernel.
* Test loading NFS moudle.

That should be it :-)

> I tried unloading other modules, but that made no difference
> ("used" value remained unchanged).

Unloading modules won't help, it's one GOT per module.

> Does this mean that using nfs on hppa is not possible at all?

No, I use nfs on my hppa system.

Cheers,
Carlos.
