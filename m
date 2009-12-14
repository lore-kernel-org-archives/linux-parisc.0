From: Michal Ludvig <mludvig@logix.net.nz>
Subject: Re: console handover: boot [ttyB0] -> real [ttyS0]
Date: Tue, 15 Dec 2009 12:39:06 +1300
Message-ID: <4B26CC9A.6040208@logix.net.nz>
References: <4B2362EB.2090409@logix.net.nz> <7d01f9f00912121247g376d54e9pb39d6023ddaaa878@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00912121247g376d54e9pb39d6023ddaaa878@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/13/2009 09:47 AM, Thibaut VARENE wrote:
> On Sat, Dec 12, 2009 at 10:31 AM, Michal Ludvig <mludvig@logix.net.nz> wrote:
>> I tried to pass serial=ttyS0 to the kernel but then the output stops a
>> wee while later as well:
> 
> Try ttyS1

That's it, thanks!

Now I'm a bit confused - where are all the serial ports? I've got
'remote', 'console' and 'ups' pigtails hanging off the back of the
server. Are they all usable as ttySx? Is there one more port hidden
somewhere?

Is it configurable which one of ttyS0 - ttyS3 turns the ttyB0 boot
console to?

Michal


