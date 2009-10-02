From: Helge Deller <deller@gmx.de>
Subject: Re: Build failure?
Date: Fri, 02 Oct 2009 20:53:42 +0200
Message-ID: <4AC64C36.7030901@gmx.de>
References: <20091002014346.D73A14E38@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Carlos O'Donell <carlos@systemhalted.org>, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091002014346.D73A14E38@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/02/2009 03:43 AM, John David Anglin wrote:
>> drivers/char/agp/parisc-agp.c:220: error:
>> 'parisc_agp_page_mask_memory' undeclared here (not in a function)
>> make[3]: *** [drivers/char/agp/parisc-agp.o] Error 1
>> make[2]: *** [drivers/char/agp] Error 2
>> make[1]: *** [drivers/char] Error 2
>> make: *** [drivers] Error 2
>>
>> I haven't looked into this yet.
>
> I seem to recall there is a patch in Kyle's tree that may fix this.

No, it's not in Kyle's tree, but available here:
http://patchwork.kernel.org/patch/50348/

Btw, I've started to collect not-yet-applied patches to various trees here:
http://userweb.kernel.org/~deller/parisc/patches.still-needed/
The AGP-Patch is in the 2.6.32 subtree.

Helge
