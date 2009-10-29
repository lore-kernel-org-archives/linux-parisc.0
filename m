From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Out of order unwind entry warning
Date: Wed, 28 Oct 2009 22:11:22 -0400
Message-ID: <20091029021122.GA16387@hiauly1.hia.nrc.ca>
References: <20091028221827.1B7774E38@hiauly1.hia.nrc.ca> <4AE8C918.8060908@gmx.de> <4AE8CCE3.1030503@gmx.de>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, carlos@systemhalted.org,
	randolph@tausq.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AE8CCE3.1030503@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 28 Oct 2009, Helge Deller wrote:

> On 10/28/2009 11:43 PM, Helge Deller wrote:
>> On 10/28/2009 11:18 PM, John David Anglin wrote:
>>>>> and whether it follows inb in its .o. From my understanding of things,
>>>>> it shouldn't be necessary to remove the unwind info for unused weak
>>>>> symbols if they aren't garbage collected. A simple testcase would
>>>>> be helpful.
>
> Attached is a testcase (t1.c and t2.c):
> t1.c contains weak function f().
> t2.c contains non-weak function f().
>
> hppa-linux-gcc -c t1.c t2.c
> hppa-linux-ld -r -o all.o t1.o t2.o
>
> hppa-linux-readelf -s t1.o gives:
> Symbol table '.symtab' contains 10 entries:
>    Num:    Value  Size Type    Bind   Vis      Ndx Name
>      6: 00000000    28 FUNC    GLOBAL DEFAULT    1 a
>      7: 0000001c    32 FUNC    WEAK   DEFAULT    1 f
>      8: 0000003c    28 FUNC    GLOBAL DEFAULT    1 z
>      9: 00000058    80 FUNC    GLOBAL DEFAULT    1 main
>
> hppa-linux-readelf -s t2.o  gives:
> Symbol table '.symtab' contains 7 entries:
>    Num:    Value  Size Type    Bind   Vis      Ndx Name
>      6: 00000000    32 FUNC    GLOBAL DEFAULT    1 f
>
> hppa-linux-readelf -s all.o  gives:
> Symbol table '.symtab' contains 11 entries:
>    Num:    Value  Size Type    Bind   Vis      Ndx Name
>      7: 00000000    32 FUNC    GLOBAL DEFAULT    3 f
>      8: 0000003c    28 FUNC    GLOBAL DEFAULT    1 z
>      9: 00000058    80 FUNC    GLOBAL DEFAULT    1 main
>     10: 00000000    28 FUNC    GLOBAL DEFAULT    1 a
>
>
> hppa-linux-readelf -u all.o  gives:
> Unwind section '.PARISC.unwind' at offset 0xfc contains 5 entries:
> <a>: [0x0-0x30]
>         Entry_GR=1 Save_SP Total_frame_size=8
> <f>: [0x0-0x70]
>         Entry_GR=1 Save_SP Total_frame_size=8
> <z>: [0x3c-0xa8]
>         Entry_GR=1 Save_SP Total_frame_size=8
> <main>: [0x58-0x148]
>         Entry_GR=2 Save_SP Save_RP Total_frame_size=8
> <f>: [0x0-0x38]
>         Entry_GR=1 Save_SP Total_frame_size=8
>
> Function f() is listed twice and with different lengths.
> Sadly in this example f() starts at offset 0. I think if you tweak
> the example, try to see what you get when the start of f() is not zero.

Looking at all.o with objdump, the code for <f> is still present.
I would say the regions should be:

<a>: [0x0-0x18]
<f>: [0x1c-0x38]
<z>: [0x3c-0x54]
<main>: [0x58-0xa4]
<f>: [0x0-0x1c]

There are two .text sections, so the offsets for the second <f>
are relative to the start of this section.

My compilation probably differs a bit from yours but I see the same
readelf -u output.  Suspect readelf is broken.  The end values seem
off by a factor 2.

Need to see why start for first <f> is wrong and what happens in final link.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
