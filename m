From: Helge Deller <deller@gmx.de>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sun, 16 May 2010 22:22:02 +0200
Message-ID: <4BF053EA.8090503@gmx.de>
References: <20100511212628.59FFD505C@hiauly1.hia.nrc.ca> <4BE9CEF6.7010203@gmx.de> <20100515210251.GA16614@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	carlos@systemhalted.org, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100515210251.GA16614@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/15/2010 11:02 PM, John David Anglin wrote:
> On Tue, 11 May 2010, Helge Deller wrote:
> 
>> On 05/11/2010 11:26 PM, John David Anglin wrote:
>>>> On 05/10/2010 09:20 PM, Helge Deller wrote:
>>>>> On 05/10/2010 04:56 PM, John David Anglin wrote:
>>>>>> Yes, just after sending, I noticed gcc testsuite and minifail were
>>>>>> broken on gsyprf11.  [...]
>>>>>>
>>>>>> The attached works better on gsyprf11.  I haven't tested it on anything
>>>>>> else.
>>>>
>>>> Hi Dave,
>>>>
>>>> I still can see segfaults of the minifail_dave.cpp program.
> 
> I haven't seen any abnormal segfaults with the attached change on
> my rp3440 and gsyprf11.  Need to flush in pte_wrprotect for minifail,
> and to flush in copy_user_page to fix occasional segfaults in sh.
> The flushes in kmap/kunmap weren't sufficient.

I wish could report success as well....
But I still do see segfaults (although they seem to happen not as often as before).
Which kernel do you test? I'm on 2.6.33.3 + your patches.

Helge
