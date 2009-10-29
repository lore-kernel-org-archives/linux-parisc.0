From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Thu, 29 Oct 2009 21:46:26 +0100
Message-ID: <4AE9FF22.1090709@gmx.de>
References: <20091028221827.1B7774E38@hiauly1.hia.nrc.ca> <4AE8C918.8060908@gmx.de> <4AE8CCE3.1030503@gmx.de> <20091029191642.GA21129@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, carlos@systemhalted.org,
	randolph@tausq.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091029191642.GA21129@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/29/2009 08:16 PM, John David Anglin wrote:
> On Wed, 28 Oct 2009, Helge Deller wrote:
>
>> On 10/28/2009 11:43 PM, Helge Deller wrote:
>>> On 10/28/2009 11:18 PM, John David Anglin wrote:
>>>>>> and whether it follows inb in its .o. From my understanding of things,
>>>>>> it shouldn't be necessary to remove the unwind info for unused weak
>>>>>> symbols if they aren't garbage collected. A simple testcase would
>>>>>> be helpful.
>>
>> Attached is a testcase (t1.c and t2.c):
>> t1.c contains weak function f().
>> t2.c contains non-weak function f().
>>
>> hppa-linux-gcc -c t1.c t2.c
>> hppa-linux-ld -r -o all.o t1.o t2.o
>
> Attached is a patch for gas that seems to produce reasonable
> unwind info for the testcase when all.o is linked into a final
> executable.  I think it will fix the linux unwind problem.

Hi Dave,

Yes, this patch fixes the problem for vmlinux :-)
Just tested it with a 32bit  kernel build.

> Still need to look at readelf -u on .o's.

Yes, I see this too. readelf -u doesn't print any longer the second line of:
<arch_mod_section_prepend>: [0x1011fc4c-0x1011fc74]
           Entry_GR=1 Save_SP Total_frame_size=8

Thanks!

Helge
