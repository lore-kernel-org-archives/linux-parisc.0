From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPMC running CMake Nightly tests
Date: Wed, 26 Oct 2011 10:16:42 -0600
Message-ID: <20111026161641.GA32419@parisc-linux.org>
References: <d21336a9332d91f209ba666bd94f3acd.squirrel@webmail.sf-mail.de> <20111012043201.GA22657@parisc-linux.org> <335757fae9d67623b229652e74aba015.squirrel@webmail.sf-mail.de> <1c7b6eb5f6657272fe96ad90b79f215f.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1c7b6eb5f6657272fe96ad90b79f215f.squirrel@webmail.sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Oct 21, 2011 at 10:26:57AM +0200, Rolf Eike Beer wrote:
> Ok, I have another one. I removed all those parts that did not show any
> errors or where the register contents were all zeros.
> 
> Timestamp =
>   Thu Oct  20 09:05:52 GMT 2011    (20:11:10:20:09:05:52)
...
> System Responder Address     = 0x000000fff4008040

MMIO Address that wasn't responding.  Note that it's 40 bits.
The 32-bit address used by OS is "F-extended" by HW (CPU I think).


> System Requestor Address     = 0xfffffffffffa0000

Address of CPU that was requesting the MMIO address.

This is enough info to identify what I believe is the "victim".
It's not likely to be the root cause.

Historically, this type of HPMC happens because a device
attempted to DMA to an unmapped address and the IOMMU
went "fatal" (stopped routing traffic to PCI busses).


> '9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:
> 
> Check Summary                = 0xcb81041008000000
> Available Memory             = 0x0000000020000000
> CPU Diagnose Register 2      = 0x0301000000000004
> CPU Status Register 0        = 0x2420c20000000000
> CPU Status Register 1        = 0x8002000000000000
> SADD LOG                     = 0x4b023fd9e8190951
> Read Short LOG               = 0xc1af00fff4008040
> ERROR_STATUS                 = 0x0000000000100010
> MEM_ADDR                     = 0x000001ff3fffffff
> MEM_SYND                     = 0x0000000000000000
> MEM_ADDR_CORR                = 0x000001ff3fffffff
> MEM_SYND_CORR                = 0x0000000000000000
> RUN_DATA_HIGH                = 0xc1bff0fffed08040
> RUN_DATA_LOW                 = 0xc1bff0fffed08040
> RUN_CTRL                     = 0x0000021c00001418
> RUN_ADDR                     = 0xc1bff0fffed08040
> System Responder Path        = 0x00ffffff0a000c00

This part could yield another clue if we had the magic decoder ring. :(


> HPMC PIM Analysis Information:
> 
> Timestamp =
>   Thu Oct  20 09:05:52 GMT 2011    (20:11:10:20:09:05:52)
> 
> 
> '9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:
> 
> A Data I/O Fetch Timeout occurred while CPU 0 was
> requesting information from a device at the path 10/0/12/0 (built-in PCI
> device).

Doing "in io" at the BCH prompt should list all devices including 10/0/12/0
Google search is failing to find a posting with that content. :/


> '9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:
> 
>  Rope     Word1        Word2            Word3
> ------ ------------ ------------
>    0    0x00000000   0x0e0cc2a9   0x00000000fed30048
>    1    0x00000000   0x1e0cc009   0x00000000fed32048
>    2    ----------   0x2e0cc009   ------------------
>    3    ----------   0x3e0cc009   ------------------
>    4    0x00000000   0x4e0cc009   0x00000000fed38048
>    5    ----------   0x5e0cc009   ------------------
>    6    0x00000000   0x6e0cc009   0x00000000fed3c048
>    7    ----------   0x7e0cc009   ------------------

"HP c3750 | hp workstation c3700 and c3650 - service handbook" in a 
couple of different places says:
 "I/O Error log word 3 contains the error address"

I'm assuming this is just the last accessed address by that PCI bus.

cheers,
grant
