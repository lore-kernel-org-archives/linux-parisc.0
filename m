From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: PCI patch breaks boot on rp2470 (2xPA8700)
Date: Tue, 23 Feb 2010 22:32:34 -0500
Message-ID: <119aab441002231932l2c09e37bt2965a7d9304f39d9@mail.gmail.com>
References: <119aab441002221525m4595b37w875891cd8f95e633@mail.gmail.com>
	 <da824cf31002221654if698808i88709293223b5cd3@mail.gmail.com>
	 <20100223014958.GI16620@ihatethathostname.lab.bos.redhat.com>
	 <119aab441002230456v12891012y85ca6ffc3ba8c0b5@mail.gmail.com>
	 <20100224005841.GL16620@ihatethathostname.lab.bos.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Grant Grundler <grundler@google.com>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Matthew Wilcox <matthew@wil.cx>
To: Kyle McMartin <kmcmartin@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100224005841.GL16620@ihatethathostname.lab.bos.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Feb 23, 2010 at 7:58 PM, Kyle McMartin <kmcmartin@redhat.com> wrote:
> On Tue, Feb 23, 2010 at 07:56:23AM -0500, Carlos O'Donell wrote:
>> You're welcome!
>>
>> I'm building directly from here:
>> git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git
>>
>> Is this correct? My assumption is that you keep this branch up to date
>> as you pull/test for parisc?
>>
>
> I will, yes. I haven't pushed out an update since I haven't managed to
> build/boot test it yet, but it's chugging away right now.

Sorry Kyle, I hope you didn't think I was impling that you were slow
to update. You're doing a great job. I'm just a toolchain dude, my
happy day involves a kernel that doesn't eat my filesystem. I'm have
fun fixing the userspace bits.

Now that I can boot a recent kernel I'm back to fixing vfork/execve
issues as reported by debian. Wish me luck.

Cheers,
Carlos.
