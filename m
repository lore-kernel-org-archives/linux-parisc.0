From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Link error in CMake for HPPA1.1, wrong result for HPPA 2.0
Date: Mon, 29 Aug 2011 10:38:01 -0400
Message-ID: <4E5BA449.5050606@bell.net>
References: <99a9e4b224dc9020d16d0a33fea6096f.squirrel@webmail.sf-mail.de>    <4E5656E4.8000102@systemhalted.org> <4E566E6D.8060100@bell.net> <da1221fe3aa512ba4b0a139a89dd2e69.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <da1221fe3aa512ba4b0a139a89dd2e69.squirrel@webmail.sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 8/29/2011 4:12 AM, Rolf Eike Beer wrote:
>> On 8/25/2011 10:06 AM, Carlos O'Donell wrote:
>>> On 8/25/2011 6:37 AM, Rolf Eike Beer wrote:
>>>> const&)]+0xbc): cannot reach
>>>> 00004abb__ZNSt8_Rb_treeIN5cmsys6StringESt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_S_rightEPSt18_Rb_tree_node_base+0,
>>>> recompile with -ffunction-sections
>>> So did you recompile with -ffunction-sections?
>>>
>>> The basic problem is that the linker was unable to insert a jump
>>> to the requested function because it was too far away. Some targets
>>> like hppa have short branch distances and we use intermediate stub
>>> tables to get around that. However, we can't insert stub tables just
>>> anywhere, they need to go between sections. Therefore you need to
>>> break up this object file.
>> I think there is a real bug here but nobody has provided a test case.
>> -ffunction-sections
>> probably won't help.
> Confirmed, it is a regression in gcc 4.5. If I build using 4.4.6
> everything works fine. I'll file a bug report tonight.
>
Interesting, there's not much difference in the PA backend for these two 
versions.

Add me (danglin at gcc.gnu.org) to the CC list on the GCC bug report and 
I'll try to
duplicate the problem.

Thanks,
Dave

-- 
John David Anglin    dave.anglin@bell.net

