From: John David Anglin <dave.anglin@bell.net>
Subject: Re: PCI & AGP video options
Date: Sat, 10 Aug 2013 10:07:07 -0400
Message-ID: <BLU0-SMTP848CBA886F0C5E2BB6645697590@phx.gbl>
References: <199671375961574@web3d.yandex.ru> <52055C9E.9010503@gmx.de> <EE8284CE-E16F-48FA-BB55-D680CFC39484@p0n4ik.tk>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: gnidorah@p0n4ik.tk
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <EE8284CE-E16F-48FA-BB55-D680CFC39484@p0n4ik.tk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10-Aug-13, at 2:00 AM, gnidorah@p0n4ik.tk wrote:

>> I'm not sure if it makes much sense to use a PA-RISC
>> machine as desktop machine nowadays. Every Intel-based
>> machine is faster, cheaper, better supported (graphic cards)
>> and uses less power...
>
> Got your point.
> That's true. Still would be nice to use workstation model
> as workstation.

Yes, it's a bit of a cop out.

I still tend to think the bug is in the firmware load.  Is there any  
external way to confirm that it loads
correctly (e.g., a led on card)?  The error indicates that the command  
processor (CP) isn't working.

There is a manual "Radeon R5xx Acceleration" that might help debug.

Dave
--
John David Anglin	dave.anglin@bell.net



