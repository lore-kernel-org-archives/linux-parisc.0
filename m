From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: kernel 4.15.7/64bit, C3600 is unstable during heavy I/O on PCI
Date: Mon, 19 Mar 2018 20:37:49 +0100
Message-ID: <CAP6odjhfy0qwH5p_VyNLBw8w9mc_wsWFpR=RH2daJocW6Cn+vA@mail.gmail.com>
References: <CA+QBN9DxM5PYCnPJCRtgxQ8xGk75=jAtsE+VibUfFOv+Yah6Og@mail.gmail.com>
 <CA+QBN9D9vUA7Q=Sd=moi+bSAkQjGQ6nGa8wnb1=7qHudAY8L8g@mail.gmail.com>
 <20180317113655.GA30572@ls3530.fritz.box> <CAP6odjhTVFkFP0kzCjvpJZ81iwA+cxLNFB7AxK+hZfy_cKxjvw@mail.gmail.com>
 <CA+QBN9Bd69whK14_0jT0m=5F4i2FxNPyEbMv3mgUsox9pX3fKA@mail.gmail.com>
 <CAP6odjhVVjutLY73QeCq+vjvUE1StmTBB50s_m5SN1Ad7OBD5Q@mail.gmail.com> <CA+QBN9A_0x6_0Ayo6YtkdC=j1ssa9mD7NTzU5+Jie0dYabp3bQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: debian-hppa@lists.debian.org, linux-parisc <linux-parisc@vger.kernel.org>
To: Carlo Pisani <carlojpisani@gmail.com>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <CA+QBN9A_0x6_0Ayo6YtkdC=j1ssa9mD7NTzU5+Jie0dYabp3bQ@mail.gmail.com>
Resent-Message-ID: <TMukNZTaliB.A.cZH.kVBsaB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAP6odjhfy0qwH5p_VyNLBw8w9mc_wsWFpR=RH2daJocW6Cn+vA@mail.gmail.com

[adding public lists back to CC since I can't sort this by myself any more]

On Sat, Mar 17, 2018 at 6:45 PM, Carlo Pisani <carlojpisani@gmail.com> wrote:
>> While the symptom (HPMC) looks the same, the details are likely
>> different for each card. It's been over 10 years but ISTR that "SER
>> PIM" command when entered at boot prompt will dump those details.
>
> this is an old log
> http://93.55.217.0/wonderland/chunk_of/user/ivelegacy/hppa-dev/ser-prim-2018-03-12--sata-crash

Awesome - thank you!

Can you tell me which SATA controller was installed when this crash was taken?

> my C3600 is now busy, compiling 4.16.*, a couple of branches with two
> different configurations, so I can't force a crash to have a fresh log
> at the moment, but I will with several SATA card!

No worries - start with one. :)

> what about SAS kernel modules? are them better than SATA?

In general, I expect they are better supported but I never worked with
SAS controllers.

> and what about SCSI (adaptec 29320, PCI-X)?

Sorry: I don't have any experience with adaptec - only the LSI SCSI
controllers, Marvel 7042 SATA controller, and Silicon Image 3124
(IIRC). The SI3124 was a PoS. MV7042 worked well and was reliable "at
scale".

> I am waiting for an array of disks, I can test the SCSI card under
> heavy I/O to see
> - performance
> - stability
>
> it will be delivered here for the end of the next week

Ok! Sounds like fun! :D

cheers,
grant
