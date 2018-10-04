From: Helge Deller <deller@gmx.de>
Subject: Re: [GIT PULL] parisc fixes for kernel v4.19
Date: Thu, 4 Oct 2018 16:38:46 +0200
Message-ID: <52a7db47-ec60-76e7-a71c-8d95c83df471@gmx.de>
References: <20181002210213.GA17826@ls3530.fritz.box>
 <20181002211645.GA6454@kroah.com>
 <ad45f249-e064-d5a4-c658-eaa03bb3a04a@gmx.de>
 <20181002222452.GB11788@kroah.com>
 <dbfa0162-8ed1-b16e-a418-da3b92c76230@gmx.de>
 <20181003181612.GB28575@kroah.com>
 <CAK8P3a2ntPX4+LbYWJbDG1k-8NwkhyY0nYk-mfZU2FBF_h23Yw@mail.gmail.com>
 <20181003230226.GB27729@kroah.com>
 <ed8a12d5-604f-c938-f65d-051e05561dc6@gmx.de>
 <CAK8P3a3HCBY8+xK_o50aswFsrb1EVCFATV4zwqfNqHUDqtDa_w@mail.gmail.com>
 <9ba92a5e-c447-f894-5263-3d7220716f87@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: gregkh <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        James.Bottomley@hansenpartnership.com,
        John David Anglin <dave.anglin@bell.net>
To: Arnd Bergmann <arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9ba92a5e-c447-f894-5263-3d7220716f87@gmx.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04.10.2018 16:30, Helge Deller wrote:
> On 04.10.2018 15:34, Arnd Bergmann wrote:
>> On Thu, Oct 4, 2018 at 10:42 AM Helge Deller <deller@gmx.de> wrote:
>>> On 04.10.2018 01:02, gregkh wrote:
>>>> On Wed, Oct 03, 2018 at 09:49:08PM +0200, Arnd Bergmann wrote:
>>>>> On Wed, Oct 3, 2018 at 8:16 PM Greg Kroah-Hartman
>>>>> <gregkh@linuxfoundation.org> wrote:
>>>>>> On Wed, Oct 03, 2018 at 04:47:30PM +0200, Helge Deller wrote:
>>>>>>> On 03.10.2018 00:24, Greg Kroah-Hartman wrote:
>>>>>>>> On Tue, Oct 02, 2018 at 11:46:11PM +0200, Helge Deller wrote:
>>>>> Or to put it another way: If the argument is
>>>>> that there won't ever be a 64-bit user space for parisc
>>>
>>> FYI, I was planning to try a 64-bit user space at some point.
>>> Just see my recent patches and mails, e.g.
>>> b6fc0cccb6b35815a7d1cfc9279cdbfc2c61d00d
>>> 5b00ca0b8035e49ef7c466e959c5cb457a654351
>>> and
>>> https://www.spinics.net/lists/linux-parisc/msg09070.html
>>>
>>>>> and we don't care about it,
>>>
>>> I (and a few others) do care about it.
>>>
>>>>> then we'd be better of removing all native 64-bit
>>>>> syscalls from arch/parisc/kernel/syscall_table.S.
>>>>
>>>> Ok, then let's treat this like any other arch/driver/subsystem that we
>>>> remove.  Drop the file(s) in a -rc1 merge window and then if anyone
>>>> object to it later on because they really were using it, you can easily
>>>> revert that change.
>>>
>>> As a maintainer of this port, I object to this.
>>> You suggest to remove a working, functional and maintained interface for no good use.
>>> Removing it won't save lots of bytes in the executable (or source code)
>>> but will make my life as maintainer harder.
>>
>> Makes sense. I was basing my thoughts on the observation that
>> nobody did this in the last 18 years that he port has been around,
>> but if you still plan to do this, then we should not regress.
>>
>> What is your current estimate for how many more patches
>> are required to get it working reasonably well? 
> 
> I'm not aware of missing functionality which requires additional patches
> for the Linux kernel.
> It's userspace which needs work, e.g. binutils needs to be fixed
> to get multiple stub section support, and glibc.
> 
>> Did you plan
>> to have commit 5b00ca0b8035 ("parisc: Restore possibility
>> to execute 64-bit applications") backported to stable kernels,
>> or just get it working in future versions?
> 
> A backport of this patch is not needed.
> The patch fixes the 64-bit loader which I broke a few days before 
> when I switched to the generic binfmt implementation with commit
> 71d577db01a5 ("parisc: Switch to generic COMPAT_BINFMT_ELF").

Actually, to be correct here, backporting my commit 5b00ca0b8035
to v4.17, v4.18 and v4.19 would be the right thing.

>> I suppose we either want to backport that patch and mine,
>> or neither of them.

Agreed. Both would be best.

Helge
