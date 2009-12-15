From: Michal Ludvig <mludvig@logix.net.nz>
Subject: Re: console handover: boot [ttyB0] -> real [ttyS0]
Date: Tue, 15 Dec 2009 21:13:50 +1300
Message-ID: <4B27453E.7050408@logix.net.nz>
References: <4B2362EB.2090409@logix.net.nz> <7d01f9f00912121247g376d54e9pb39d6023ddaaa878@mail.gmail.com> <4B26CC9A.6040208@logix.net.nz> <20091215055247.GC31805@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091215055247.GC31805@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
> On Tue, Dec 15, 2009 at 12:39:06PM +1300, Michal Ludvig wrote:
> ...
>> Is it configurable which one of ttyS0 - ttyS3 turns the ttyB0 boot
>> console to?
> 
> ttyB0 is the "PDC Console" device name - linux kernel is using PDC
> to push characters to the device defined in PDC (aka BIOS) to be console.
> Interrupt the autoboot process and look at "in all".
> 
> ttyS0-ttyS3 are enumerations of Serial devices that the linux kernel
> discovers when respective drivers are loaded. ttyB0 and ttyS<n> are
> just different drivers accessing the same HW - preferably not at the
> same time and that's why the kernel stops using ttyB0 later.
> 
> That make more sense?

Yes it does :-) Thanks!

Michal
