From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Mon, 02 Nov 2009 23:43:24 +0100
Message-ID: <4AEF608C.9000402@gmx.de>
References: <20091102215027.07A81500F@hiauly1.hia.nrc.ca>	 <4AEF5B2D.7030906@gmx.de> <1257201072.9933.2.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1257201072.9933.2.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/02/2009 11:31 PM, James Bottomley wrote:
> On Mon, 2009-11-02 at 23:20 +0100, Helge Deller wrote:
>> On 11/02/2009 10:50 PM, John David Anglin wrote:
>>> sysfs: cannot create duplicate filename '/module/usbhid/sections/.text'
>>> ------------[ cut here ]------------
>>> Badness at fs/sysfs/dir.c:487
>>
>> Yes, this is known.
>> See here:
>> http://patchwork.kernel.org/patch/42190/
>> Would be nice if this could get fixed.
>
> Actually, it is fixed; the patch is upstream as commit
> 1b364bf438cf337a3818aee77d68c0713f3e1fc4
>
> The patch was designed to fix the panic that occurred.  This warn on is
> coming out of the sysfs code when we try to register a duplicate section
> name.  The panic that followed is what the patch fixed ... but we still
> get left with the warn on.

Yes, the crash is fixed, but still the warning is ugly.
Each time you load any module, this warning is filling up the log.
If you boot via serial console (like me) printing this warning with 9600 baud takes endless time (and you easily get up to 30 times this warning).

Helge
