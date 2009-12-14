From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: console handover: boot [ttyB0] -> real [ttyS0]
Date: Tue, 15 Dec 2009 00:52:59 +0100
Message-ID: <7d01f9f00912141552t244525fal6837e9039021912d@mail.gmail.com>
References: <4B2362EB.2090409@logix.net.nz>
	 <7d01f9f00912121247g376d54e9pb39d6023ddaaa878@mail.gmail.com>
	 <4B26CC9A.6040208@logix.net.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: Michal Ludvig <mludvig@logix.net.nz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B26CC9A.6040208@logix.net.nz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 15, 2009 at 12:39 AM, Michal Ludvig <mludvig@logix.net.nz> wrote:
> On 12/13/2009 09:47 AM, Thibaut VARENE wrote:
>> On Sat, Dec 12, 2009 at 10:31 AM, Michal Ludvig <mludvig@logix.net.nz> wrote:
>>> I tried to pass serial=ttyS0 to the kernel but then the output stops a
>>> wee while later as well:
>>
>> Try ttyS1
>
> That's it, thanks!
>
> Now I'm a bit confused - where are all the serial ports? I've got
> 'remote', 'console' and 'ups' pigtails hanging off the back of the
> server. Are they all usable as ttySx? Is there one more port hidden
> somewhere?

This should answer your question:
http://wiki.parisc-linux.org/GuardianServiceProcessor

> Is it configurable which one of ttyS0 - ttyS3 turns the ttyB0 boot
> console to?

I'm not sure I can make sense of that question. At boot time you can
choose which physical port you want to hook your cable to (provided
it's a console port, see the above link) and it's then up to you to
make sure that you tell the kernel which UART you're connected to.

rp34xx machines' first ("default") console port is detected by the
linux kernel as ttyS1, this is due to inner workings of the kernel and
you have no control over that.


-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
