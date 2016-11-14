From: Jeff Law <law@redhat.com>
Subject: Re: Change call ABI on PA-RISC
Date: Mon, 14 Nov 2016 01:21:45 -0700
Message-ID: <06f2cef7-6946-911e-53d8-375637d54096@redhat.com>
References: <0E3ABDFC-D082-4DA8-9D5B-12FC7E95335F@bell.net>
 <bf499ea2-6148-9cf8-eba3-b0f6de5cf309@gmx.de>
 <93610ddc-78d3-f456-9ca0-59362ac7b355@redhat.com>
 <2d705201-5651-b4e7-9e92-6d0f175b44b9@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2d705201-5651-b4e7-9e92-6d0f175b44b9@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/13/2016 12:48 PM, Helge Deller wrote:
> On 13.11.2016 19:56, Jeff Law wrote:
>> On 11/13/2016 11:37 AM, Helge Deller wrote:
>>> If you are going to change the ABI, maybe we can add more things as well?
>>> Which comes to my mind here is for example an optimized mcount() function
>>> which allows changing the return pointer (see -mmcount-ra-address on MIPS) ?
>
>> As in twiddling RP to return to a different point?
>
> No, that's not the use case for me.
>
> I was working on the ftrace functionality in the Linux kernel.
> I'd need to look up the full details again, but as far as I remember one of
> the tracers wants to know the function to which the caller of mcount() would return,
> so some kind of simple __builtin_return_address(2).
Ah.  Isn't that going to be sitting at sp-20 or something like that.  My 
PA is rusty, but my recollection is that's supposed to be at a fixed 
location in the frame.
jeff
