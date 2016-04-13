From: John David Anglin <dave.anglin@bell.net>
Subject: Re: PCI video card hangs during system boot
Date: Wed, 13 Apr 2016 11:02:01 -0400
Message-ID: <570E5F69.4010203@bell.net>
References: <CACrbsaAVBQw5zSiuS9xYo+vuP8sFk1a94FSXVz_sRGkMP+60Jg@mail.gmail.com>
 <1587186.CtnrnCsSzp@caliban.sf-tec.de> <570D38BF.7040307@bell.net>
 <CACrbsaBBT20+_GtJD3XMxob7Pz+mhdw7BE0h3uQSpKq-VSOHYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Simone Mannori <simone.mannori@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CACrbsaBBT20+_GtJD3XMxob7Pz+mhdw7BE0h3uQSpKq-VSOHYA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-04-13 3:06 AM, Simone Mannori wrote:
>> Maybe pulling FireGL X1 will help:
>> https://lists.freedesktop.org/archives/dri-users/2015-February/000034.html
> Already done Dave: same error message during system boot. Just to be
> clear, the error message is also indipendent by the PCI slot position.
> Thanks for the hint, anyway.
Just one further thought regarding FireGL X1.  The OLS article by Grant 
referenced in the above
link indicated that a common problem in porting drivers to parisc was 
timing issues with I/O writes.
This was fixed in a couple of drivers by doing a read after doing a 
write.  Possibly, the radeon driver
could be hacked to always read after write as a test.

I also read somewhere ia64 linux using zx1 chipset did work at one 
time.  This link gives some history
on ia64 and might give some hints about other things to try:
http://comments.gmane.org/gmane.linux.debian.ports.ia64/3031

>
> My conclusion is that the "vanilla-PC" ATI RADEON 9200 128M PCI is not
> "BIOS compatible" with the c8000.
Agreed.  There's no way to change the c8000 BIOS.   I'd hoped that 
removing the X1 might free up
I/O space and allow 9200 to work.

Dave

-- 
John David Anglin  dave.anglin@bell.net

