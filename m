From: Helge Deller <deller@gmx.de>
Subject: Re: HP J5600/J6750 64bit SMP CPU#1 stuck problems [was: Does there
 exists any 32bit-only PARISC SMP machines?]
Date: Sun, 27 Oct 2013 00:06:55 +0200
Message-ID: <526C3CFF.2070005@gmx.de>
References: <521F9848.4010404@gmx.de> <1377830541.2331.5.camel@dabdike> <20130903155643.GA1430@glitch> <trinity-b7a0d82a-16b9-4204-be6e-2873db548248-1378282389073@3capp-gmx-bs28> <20130904140705.GA30223@glitch> <20130904142847.GA2893@glitch> <52658989.5090508@gmx.de> <BLU0-SMTP632514F697DEA3A182EE9897010@phx.gbl> <526590F0.8040504@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Dave Land <xmechanic@landcomp.net>
To: John David Anglin <dave.anglin@bell.net>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Domenico Andreoli <cavokz@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <526590F0.8040504@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/21/2013 10:39 PM, Helge Deller wrote:
>>> On 09/04/2013 04:28 PM, Domenico Andreoli wrote:
>>>>>>> J5600 is SMP capable in both 32bit and 64bit mode.
>>>>>>> mine doesn't boot 64bit SMP since 2.6.22. I've never been able to trace
>>>>>>> it down but can confirm it happens also on more recent kernels.
>>>>> I confirm that smp parisc64 v3.11 doesn't bring up both the cpus on my
>>>>> system but at least it boots one, something that didn't happen in some
>>>>> darker moments since 2.6.22.
>>>>>
>>>>> similar "SMP: CPU:1 is stuck." happens also with debian v3.10-parisc64-smp kernel.
>>>> BTW, this is the most detailed investigation I'm aware of:
>>>> https://lkml.org/lkml/2008/4/20/251

I think we finally found the reason and a fix for the "CPU:1 is stuck" problem :-)

See the patch I've just sent to the mailing list:
[PATCH] parisc: Do not crash 64bit SMP kernels on machines with >= 4GB RAM
https://patchwork.kernel.org/patch/3099061/

It would be nice if those people who had problems could verify if this fixes it.
At least on the J6750 from Dave Land I was now able to successfully boot the 64bit SMP kernel.

I think this should even fix the SuperDome SMP problem - if someone can test? 

If you might be too lazy to build yourself a kernel, just try my 3.10.17-based installer image:
http://ftp.parisc-linux.org/debian-ports/unstable-boot-image/lifimage
To select the 64bit kernel at boot, choose in IPL "0/vmlinux64" as kernel image.
Usually palo would otherwise choose the 32bit kernel...

In case you want to run a full installation, the instructions are available at 
http://wiki.parisc-linux.org/Debian_Ports_Installation

Helge
