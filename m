From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Mon, 02 Nov 2009 22:02:31 +0100
Message-ID: <4AEF48E7.9090504@gmx.de>
References: <20091029233501.152D1500F@hiauly1.hia.nrc.ca> <4AEB6CEB.6010205@gmx.de> <20091101231654.GA11493@hiauly1.hia.nrc.ca> <20091102014025.GA12169@hiauly1.hia.nrc.ca> <20091102023432.GA12425@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, carlos@systemhalted.org,
	randolph@tausq.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091102023432.GA12425@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/02/2009 03:34 AM, John David Anglin wrote:
> On Sun, 01 Nov 2009, John David Anglin wrote:
>
>> On Sun, 01 Nov 2009, John David Anglin wrote:
>>
>>> On Fri, 30 Oct 2009, Helge Deller wrote:
>>>
>>>> But when compiling the kernel something is still wrong.
>>>> I tried it a few times now, recompiled binutils, the kernel and so on.
>>>> I'm not 100% sure that I did everything correct, but I still think there is
>>>> something wrong...
>>>
>>> I believe that you are correct but I think we have another unrelated bug.
>>> It appears that the unwind data is getting messed up in the link of
>>> built-in.o.
>>
>> It seems the unwind data is being sorted by ld -r.
>
> Does the attached patch fix the problem?

Yes, it does :-)

All of your patches applied seem to work 100% OK.

Helge

PS: I only tested 32bit, but I assume 64bit will then work as well.
