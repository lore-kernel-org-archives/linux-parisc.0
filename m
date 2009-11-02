From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Mon, 02 Nov 2009 23:52:04 +0100
Message-ID: <4AEF6294.5000705@gmx.de>
References: <20091102215027.07A81500F@hiauly1.hia.nrc.ca> <4AEF5B2D.7030906@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AEF5B2D.7030906@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/02/2009 11:20 PM, Helge Deller wrote:
>> Thanks for testing! I have built a 32-bit kernel with the revised
>> assembler and linker, and the readelf -u output looked good to me.
>>I will install the remaining two changes tonight (the assembler
>>change was installed a couple of days ago).
>
> I did tested the 64bit version now as well.
> It looks good too.

Hi Dave,

sadly I answered too early....
With 64bit kernel I get those unwind warnings again with nearly all kernel modules now:
WARNING: Out of order unwind entry! 0000000000d4ad40 and 0000000000d4ad50

Helge
