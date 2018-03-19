From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: kernel 4.15.7/64bit, C3600 is unstable during heavy I/O on PCI
Date: Mon, 19 Mar 2018 20:30:24 +0100
Message-ID: <CAP6odjj4DTSox4K9318OT2nMqvhSw3Fhz6DY+iYduvfj6m6W2w@mail.gmail.com>
References: <CA+QBN9DxM5PYCnPJCRtgxQ8xGk75=jAtsE+VibUfFOv+Yah6Og@mail.gmail.com>
 <CA+QBN9D9vUA7Q=Sd=moi+bSAkQjGQ6nGa8wnb1=7qHudAY8L8g@mail.gmail.com>
 <20180317113655.GA30572@ls3530.fritz.box> <CAP6odjhTVFkFP0kzCjvpJZ81iwA+cxLNFB7AxK+hZfy_cKxjvw@mail.gmail.com>
 <b2fd86ec-a83a-5133-fa66-29229595851c@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Helge Deller <deller@gmx.de>, Carlo Pisani <carlojpisani@gmail.com>, debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <b2fd86ec-a83a-5133-fa66-29229595851c@bell.net>
Resent-Message-ID: <O9OTjeipRsN.A.RF.8PBsaB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAP6odjj4DTSox4K9318OT2nMqvhSw3Fhz6DY+iYduvfj6m6W2w@mail.gmail.com

Hi John!

On Sat, Mar 17, 2018 at 6:47 PM, John David Anglin <dave.anglin@bell.net> wrote:
> Hi Grant,
>
> On 2018-03-17 12:12 PM, Grant Grundler wrote:
>>
>> "Master Abort" means the MMIO
>> transaction timed out - usually due to the device not responding to an
>> MMIO read.
>
> In lba_pci.c and sba_iommu.c, it says "BE WARNED: register writes are
> posted" and need to be followed by a read.  It seems there are a some
> routines in these modules that have writes that aren't followed by a read.
> One is lba_wr_cfg(). Another might be the macro
> LBA_CFG_RESTORE().  Are these okay?

I looked through the two examples you point out and I *think* both are
ok.   lba_wr_cfg() issues an mmio write and immediately after calls
LBA_CFG_MASTER_ABORT_CHECK() which performs an MMIO read from the same
base address.

The LBA_CFG_RESTORE() is "lazy" - the next MMIO read will flush those
three writes and (I believe) any following MMIO writes will still be
issued in order.

Typically, the problem with posted MMIO writes is DMA or other events
don't start until the MMIO write is "seen" by the device. This is
important when specific timing between MMIO transactions is required
OR some magic (e.g. device reset, updates Frame Buffer, etc) happens.

> It seems probable that the problem that Carlo is having is a conflict
> between devices.

Hrm. I don't know. I haven't yet looked at the latest dump that Carlo
helpfully provided as I'm still traveling. Why do you suspect this?

I'm skeptical about "conflict between devices" (due to lba_wr_cfg())
for two reasons:
1) configuration space accesses are usually not part of normal IO
device transaction processing.
2) I've nearly always found that PCI Master Aborts (on MMIO reads) are
usually just a symptom of something else going wrong and not the root
cause.

Typically, the issues I recall running into are around the drivers
hitting a corner case where the device is still performing DMA to an
address that gets unmapped by the driver.  This will wedge the IOMMU
(sba) and then following MMIO reads will generate an HPMC.

The hard part is to determine what the corner case is based on a DMA
address (as reported in SER PIM output). It requires deeper
understanding of the DMA programming for the given SATA controller
(driver directing HW what to do), how transaction completions are
reported (SATA controller HW) and handled (driver operation).

In the past, I've sorted several of these issues out for tg3 and tulip
NIC drivers and I can with confidence say that some issues still
remain in the tulip driver shutdown path. But I gave up on trying to
fix those and lost interest later.

cheers,
grant
