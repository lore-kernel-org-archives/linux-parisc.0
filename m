From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: kernel 4.15.7/64bit, C3600 is unstable during heavy I/O on PCI
Date: Sat, 17 Mar 2018 18:05:20 +0100
Message-ID: <CAP6odjhVVjutLY73QeCq+vjvUE1StmTBB50s_m5SN1Ad7OBD5Q@mail.gmail.com>
References: <CA+QBN9DxM5PYCnPJCRtgxQ8xGk75=jAtsE+VibUfFOv+Yah6Og@mail.gmail.com>
 <CA+QBN9D9vUA7Q=Sd=moi+bSAkQjGQ6nGa8wnb1=7qHudAY8L8g@mail.gmail.com>
 <20180317113655.GA30572@ls3530.fritz.box> <CAP6odjhTVFkFP0kzCjvpJZ81iwA+cxLNFB7AxK+hZfy_cKxjvw@mail.gmail.com>
 <CA+QBN9Bd69whK14_0jT0m=5F4i2FxNPyEbMv3mgUsox9pX3fKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: debian-hppa@lists.debian.org, linux-parisc <linux-parisc@vger.kernel.org>
To: Carlo Pisani <carlojpisani@gmail.com>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <CA+QBN9Bd69whK14_0jT0m=5F4i2FxNPyEbMv3mgUsox9pX3fKA@mail.gmail.com>
Resent-Message-ID: <gd0NYwuFKYL.A.NmC.P6UraB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAP6odjhVVjutLY73QeCq+vjvUE1StmTBB50s_m5SN1Ad7OBD5Q@mail.gmail.com

[adding lists back to CC since this is a public discussion]

On Sat, Mar 17, 2018 at 5:36 PM, Carlo Pisani <carlojpisani@gmail.com> wrote:
>> Would have to see dmesg output if the driver ever complains about
>> invalid MMIO read data (~0L).
>
> I repeat AGAIN
>
> I have tested different sATA controllers
> - via6421
> - SIL24
> - Adaptex 2410

Ah sorry - I missed that.

> none of them has never complained in dmesg ( i have the console
> redirected the serial port )

Thanks for confirming Carlo!

Having worked on mv7042 and SIL3124 (IIRC) driver support for almost 4
years, I can tell you most SATA drivers suck. Helge is most likely
correct that this is due to a SATA driver bug. Since Intel x86 (32 or
64bit) systems ONLY support "SoftFail" mode, many driver issues are
never exposed until something gets corrupted or HW totally wedges.

> and all of them showed the same behavior under heavy I/O

While the symptom (HPMC) looks the same, the details are likely
different for each card. It's been over 10 years but ISTR that "SER
PIM" command when entered at boot prompt will dump those details. Ah,
yes, that's correct:
   https://parisc.wiki.kernel.org/index.php/How_to_report_a_parisc-linux_kernel_problem#HPMC


BTW, HPMCs can also be due to devices DMAing to an invalid address
since the IOMMU is "strict" and requires all DMA be "mapped". IIRC,
these DMA failures are "imprecise events" meaning SER PIM is the only
way to determine what the target DMA address was. This is non-trivial
stuff to debug since it requires pretty deep understanding of the SATA
controller operations and how the driver works.

> the C3600 machine stops to work, and I see errors in the LCD
> without a line from the kernel on the serial console

Yes, HPMC due to IO errors (including DMA failures and PCI Master
Abort) will lock up all other IO including the serial console. SER PIM
is the only output that will lead to diagnosing the underlying driver
bug.

But in SoftFail mode, I was hoping one of the drivers might complain
about "invalid value" - but that is likely way too optimistic on my
part. The only drivers that look for ~0L on MMIO read are the ones
that support PCI hotplug (e.g. PCMCIA devices and some higher end PCI
IO devices which target data center/server market).

cheers,
grant

ps. I haven't looked at mvsata or sil3124 SATA controller code since
2010. But if you could find a MV7042 PCI (or PCI-X?) SATA controller,
I have more faith in that driver/HW combination partly because I
tested it pretty thoroughly at the time.
