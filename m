From: John David Anglin <dave.anglin@bell.net>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Fri, 5 Oct 2012 20:15:55 -0400
Message-ID: <BLU0-SMTP295F5F9A4C15D2959F5B0D978A0@phx.gbl>
References: <20121004045150.GH23473@ZenIV.linux.org.uk> <1349343019.2706.3.camel@dabdike.int.hansenpartnership.com> <1349435268.3638.42.camel@dabdike.int.hansenpartnership.com> <1349444664.3638.46.camel@dabdike.int.hansenpartnership.com> <20121005144819.GO23473@ZenIV.linux.org.uk> <BLU0-SMTP36BD50597936314A689A99978B0@phx.gbl> <20121005233252.GD2616@ZenIV.linux.org.uk>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20121005233252.GD2616@ZenIV.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 5-Oct-12, at 7:32 PM, Al Viro wrote:

> On Fri, Oct 05, 2012 at 06:54:02PM -0400, John David Anglin wrote:
>> On 5-Oct-12, at 10:48 AM, Al Viro wrote:
>>
>>> What are you using for toolchain, BTW?  With gcc 4.3 / binutils 2.20
>>> (cross-builds) I'm getting panics from mainline kernel on parisc32  
>>> all
>>> way back to 2.6.28...
>>
>>
>> Current debian unstable tools are available in
>> shirka.esiee.fr:/home/dave/archives
>> and shirka.esiee.fr:/home/dave/archives-new.  It's pretty straight
>> forward to update
>> binutils, gcc, libc, etc.
>>
>> gcc 4.4, 4.5, 4.6 and 4.7 are available.  In particular, 4.6 and 4.7
>> have significant
>> bug fixes.
>>
>> James seems to have an account on shirka.
>>
>> I don't have any place to distribute the debs that are on shirka, or
>> the time to remove
>> obsolete builds.  Any volunteers?
>
> Hmm...  debian-ports would be a natural place, but TBH I'd very much  
> prefer
> to deal with cross-builds - doing kernel builds on a 100MHz 7100LC  
> with
> 96M of RAM is really not fun...
>

Right...

I had setup a buildd system system on lafayette.esiee.fr but  
unfortunately
a processor module died.  I also never received a response from debian- 
ports
(several emails) about restarting buildd for parisc.

I've continued to build packages on the rp3440 that I have at home.   
It doesn't have
much trouble keeping up with unstable.  At the same time, I use it for  
gcc testing
and development.

I would say you should be able to build cross tools using the binutils  
2.22 branch
and gcc 4.6 or 4.7.  They should work better than gcc 4.3 with  
binutils 2.20.

The reason I say that is I have built many debian packages with the  
current tools
and I have been slowly chipping away at the toolchain bugs that I have  
found.

Dave
--
John David Anglin	dave.anglin@bell.net



