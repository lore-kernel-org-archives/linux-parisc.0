From: Graham Gower <graham.gower@gmail.com>
Subject: Re: PCI video card hangs during system boot
Date: Thu, 14 Apr 2016 09:48:09 +0930
Message-ID: <CAFk90B_oAkq=JD0msjm2ZM2oZWAUd6yqh-XnC1Kk4HKHGOBt0w@mail.gmail.com>
References: <CACrbsaAVBQw5zSiuS9xYo+vuP8sFk1a94FSXVz_sRGkMP+60Jg@mail.gmail.com>
	<1587186.CtnrnCsSzp@caliban.sf-tec.de>
	<570D38BF.7040307@bell.net>
	<CACrbsaBBT20+_GtJD3XMxob7Pz+mhdw7BE0h3uQSpKq-VSOHYA@mail.gmail.com>
	<570E5F69.4010203@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Simone Mannori <simone.mannori@gmail.com>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <570E5F69.4010203@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 14 April 2016 at 00:32, John David Anglin <dave.anglin@bell.net> wrote:
> On 2016-04-13 3:06 AM, Simone Mannori wrote:
>>>
>>> Maybe pulling FireGL X1 will help:
>>>
>>> https://lists.freedesktop.org/archives/dri-users/2015-February/000034.html
>>
>> Already done Dave: same error message during system boot. Just to be
>> clear, the error message is also indipendent by the PCI slot position.
>> Thanks for the hint, anyway.
>
> Just one further thought regarding FireGL X1.  The OLS article by Grant
> referenced in the above
> link indicated that a common problem in porting drivers to parisc was timing
> issues with I/O writes.
> This was fixed in a couple of drivers by doing a read after doing a write.
> Possibly, the radeon driver
> could be hacked to always read after write as a test.

I've tried this. It doesn't change the failure mode.
