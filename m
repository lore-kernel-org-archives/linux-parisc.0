From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Wed, 28 Oct 2009 23:00:03 +0100
Message-ID: <4AE8BEE3.1040706@gmx.de>
References: <20091027231909.74AEF4E0B@hiauly1.hia.nrc.ca> <4AE8BABC.80108@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, carlos@systemhalted.org,
	randolph@tausq.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AE8BABC.80108@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Dave,

> On 10/28/2009 12:19 AM, John David Anglin wrote:
>> From my understanding of things, it shouldn't be necessary to remove the
>>unwind info for unused weak  symbols if they aren't garbage collected.

What do you mean with "garbage collected" ?  "dropped from the executable" ?
AFAICS, the weak function was completely dropped from the vmlinux file.

Some more info:
The unwind function in the parisc linux kernel walks the (sorted!) unwind list.
If one entry is wrong this can lead to incorrect unwinding.

In this case:

<arch_mod_section_prepend>: [0x1011fc4c-0x1011fc74]   - non-weak function
           Entry_GR=1 Save_SP Total_frame_size=8
<arch_mod_section_prepend>: [0x1011fc4c-0x10167cf4]  - weak function
           Entry_GR=1 Save_SP Total_frame_size=8
<module_arch_cleanup>: [0x1011fc78-0x1011fcb8]
           Entry_GR=2 Save_SP Save_RP Total_frame_size=8

I see a those options:
a) drop the second (weak) unwind info entry
b) for the weak function, use the same start- and end-addresses as the non-weak entry.

Option b) would probably need some adjustments to the existing parisc
specific unwind function.

Helge
