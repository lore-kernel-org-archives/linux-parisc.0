From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Change call ABI on PA-RISC
Date: Mon, 14 Nov 2016 12:02:12 -0500
Message-ID: <471a4789-12bf-2bec-83e8-895fb7f15e59@bell.net>
References: <0E3ABDFC-D082-4DA8-9D5B-12FC7E95335F@bell.net>
 <bf499ea2-6148-9cf8-eba3-b0f6de5cf309@gmx.de>
 <93610ddc-78d3-f456-9ca0-59362ac7b355@redhat.com>
 <2d705201-5651-b4e7-9e92-6d0f175b44b9@gmx.de>
 <06f2cef7-6946-911e-53d8-375637d54096@redhat.com>
 <77ee085f-205e-5fcb-d5e8-86bc95d5b9eb@bell.net>
 <491e8502-17a3-f203-0c9a-273a988ee0ee@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>, Jeff Law <law@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <491e8502-17a3-f203-0c9a-273a988ee0ee@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-11-14 11:24 AM, Helge Deller wrote:
> On 14.11.2016 16:11, John David Anglin wrote:
>> On 2016-11-14 3:21 AM, Jeff Law wrote:
>>> On 11/13/2016 12:48 PM, Helge Deller wrote:
>>>> On 13.11.2016 19:56, Jeff Law wrote:
>>>>> On 11/13/2016 11:37 AM, Helge Deller wrote:
>>>>>> If you are going to change the ABI, maybe we can add more
>>>>>> things as well? Which comes to my mind here is for example an
>>>>>> optimized mcount() function which allows changing the return
>>>>>> pointer (see -mmcount-ra-address on MIPS) ?
>>>>> As in twiddling RP to return to a different point?
>>>> No, that's not the use case for me.
> I was wrong.
> It's actually the use case to modify the RP...
>
>>>> I was working on the ftrace functionality in the Linux kernel.
>>>> I'd need to look up the full details again, but as far as I
>>>> remember one of the tracers wants to know the function to which
>>>> the caller of mcount() would return, so some kind of simple
>>>> __builtin_return_address(2).
>>> Ah.  Isn't that going to be sitting at sp-20 or something like
>>> that.  My PA is rusty, but my recollection is that's supposed to be
>>> at a fixed location in the frame.
> Yes, sp-10.
It's sp-0x10 on 64-bit and sp-0x14 on 32-bit.
>
> 0000000000000000 <irq_to_desc>:
>     0:   08 03 02 41     copy r3,r1
>     4:   0f c2 12 c1     std rp,-10(sp)
>     8:   08 1e 02 43     copy sp,r3
>     c:   73 c1 00 a8     std,ma r1,50(sp)
>    10:   37 dd 00 20     ldo 10(sp),ret1
>    14:   0c 65 12 d0     std r5,8(r3)
>    18:   00 00 14 b9     mfia r25
>    1c:   db 45 0b e0     extrd,u,* r26,63,32,r5
>    20:   70 64 00 20     std r4,10(r3)
>    24:   08 02 02 5a     copy rp,r26
>    28:   37 39 3f d1     ldo -18(r25),r25
>    2c:   08 1b 02 44     copy dp,r4
>    30:   2b 60 00 00     addil L%0,dp,r1
>    34:   50 21 00 00     ldd 0(r1),r1
>    38:   0c 20 10 c1     ldd 0(r1),r1
>    3c:   50 22 00 20     ldd 10(r1),rp
>    40:   e8 40 f0 00     bve,l (rp),rp
>    44:   50 3b 00 30     ldd 18(r1),dp
>
>
>> The return address of the the function to which the caller of
>> mcount() would return is passed to mcount() in %r26.  The saved value
>> in the frame is not directly useful as one lacks the frame offset of
>> the routine calling mcount.
> What I want to archieve is to modify the return pointer, in order
> to be able to track when the function returns to his caller.
> The kernel ftracer uses this then to generate call stacks and to
> time the function.
> Looking at the above code, it should then be possible for me
> to modify -10(r3), but is there a guarantee that it's always at
> -10(r3) and that r3 is used?
The location for the for saving the return pointer is defined and always 
the same.

If routine is compiled with "-fno-omit-frame-pointer", there will always 
be a
frame pointer and it should be %r3.  Otherwise, there's no guarantee 
that the
frame pointer won't be eliminated.

Since the routine calls mcount, I believe the return pointer will be 
always be saved
and restored from the frame marker.  So, it should be possible the 
return address
on the stack to detect when the routine completes..

> That's the reason I asked if we could modify mcount to
> give the address (in the stack) of the return pointer, but maybe
> it's just overkill for this use case ?

If "-fno-omit-frame-pointer" works, then you have what you need.

Dave

-- 
John David Anglin  dave.anglin@bell.net

