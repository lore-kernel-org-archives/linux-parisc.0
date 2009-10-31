From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Sat, 31 Oct 2009 08:39:43 +0100
Message-ID: <4AEBE9BF.6070403@gmx.de>
References: <4AEB6CEB.6010205@gmx.de> <20091031004132.CA8C34FE3@hiauly1.hia.nrc.ca> <20091031021925.GA425@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, carlos@systemhalted.org,
	randolph@tausq.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091031021925.GA425@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/31/2009 03:19 AM, John David Anglin wrote:
> On Fri, 30 Oct 2009, John David Anglin wrote:
>
>> There seems to a problem with readelf -u on 32-bit kernels.  The
>> address ranges are wrong.  The segment offset doesn't seem to be
>> being handled correctly.
>
> readelf -u uses the base address of the segment containing the
> .PARISC.unwind section.  On 64-bit kernels, the .PARISC.unwind
> section is in the same segment as the .text section, so the
> addresses print are correct.  However, on recent 32-bit kernels,
> this is not the case:
>
>   Section to Segment mapping:
>    Segment Sections...
>     00     .text .rodata .init.rodata __bug_table .pci_fixup .builtin_fw __ksymtab __ksymtab_gpl __kcrctab __kcrctab_gpl __ksymtab_strings __param
>     01     __ex_table .PARISC.unwind .data.read_mostly .data .got .data.vmpages .bss
>     02     .data.init_task .init.text .init.data .init.setup .initcall.init .con_initcall.init .exit.text
>     03
>
> .PARISC.unwind is readonly, so it shouldn't be in a W segment.


apply the patch in http://patchwork.kernel.org/patch/55797/ before testing.
.PARISC.unwind is then still in a RW segment, but at least you will get more reliable output.

Helge
