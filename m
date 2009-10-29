From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Thu, 29 Oct 2009 23:22:04 +0100
Message-ID: <4AEA158C.10005@gmx.de>
References: <20091029210733.96E8B4E38@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091029210733.96E8B4E38@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/29/2009 10:07 PM, John David Anglin wrote:
>>> Still need to look at readelf -u on .o's.
>>
>> Yes, I see this too. readelf -u doesn't print any longer the second line of:
>> <arch_mod_section_prepend>: [0x1011fc4c-0x1011fc74]
>>             Entry_GR=1 Save_SP Total_frame_size=8
>
> Actually, the entries are still there.  For weak functions that
> are not used, they appear as "<foo+x>:" where foo is the closest
> preceding symbol before the unused weak function.  In practice,
> the code shouldn't be entered, so the lack of an associated function
> symbol shouldn't matter.
>
> I have a fix for the readelf -u bug.  See below.

Sorry, but I don't fully understand...

With your patch to gas, the unwind info for the weak functions are completely gone in the final executable (which is good).

But "readelf -u" doesn't show the "Entry_GR=..." lines for _any_ function any longer (in the final executable).
I really mean _all_ functions, weak, non-weak, standard, ...
The patch you attached only changes the start and end addresses of the symbols...?

Helge
