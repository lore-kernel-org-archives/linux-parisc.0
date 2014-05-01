From: Helge Deller <deller@gmx.de>
Subject: Re: [GIT PULL] parisc updates for v3.15
Date: Thu, 01 May 2014 23:55:14 +0200
Message-ID: <5362C2C2.9040602@gmx.de>
References: <20140501183822.GA24823@p100.fritz.box> <CA+55aFw+0_Wf+_2EAdi=OhVK3cZdMwsCV5cditaLz7LJroeByA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CA+55aFw+0_Wf+_2EAdi=OhVK3cZdMwsCV5cditaLz7LJroeByA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

On 05/01/2014 09:23 PM, Linus Torvalds wrote:
> On Thu, May 1, 2014 at 11:38 AM, Helge Deller <deller@gmx.de> wrote:
>>
>> - Make mmap() behave similiar to other architectures: If a file hasn't been
>>   mapped yet, we can now map it at any given page-aligned address.
> 
> Ugh, so I pulled this, but I'm going to unpull it, because I dislike
> your new "i_mmap_lastmap" field.
> 
> Now, the i_mmap_lastmap field itself, I could probably live with, but
> this change to generic code:
> 
>   +       if (vma->vm_flags & VM_SHARED) {
>                   mapping->i_mmap_writable--;
>   +#ifdef CONFIG_MMAP_TRACKING
>   +               if (mapping->i_mmap_writable == 0)
>   +                       mapping->i_mmap_lastmmap = 0;
>   +#endif
>   +       }
> 
> makes me just gouge my eyes out. It's not only uglifying generic code,
> it's _stupid_ even when it's used.
> 
> What's magic about "i_mmap_lastmmap" having the value zero? Nothing.
> Maybe somebody wants to map stuff at that zero value, and has the
> permissions to do so.
> 
> So zeroing it is wrong. It's also entirely unnecessary, since you can
> just look at the "mapping->i_mmap_writable" value instead. So instead
> of checking "is i_mmap_lastmmap zero" as a way to check whether you
> can now use any virtual address, which is wrong _anyway_, you should
> have checked "is i_mmap_writable zero".
> 
> Now, I *also* suspect that you could just get rid of i_mmap_lastmmap
> _entirely_, and instead just make "GET_LAST_MMAP()" just look up the
> first shared mapping it can find in the rb tree (if i_mmap_writable is
> non-null).
> 
> But if it was just that one (unnecessary) field in the "struct
> address_space", I probably wouldn't mind, and say "ok, parisc has
> broken virtual caches, what else is new". But the fact that it adds
> code to the generic file just adds insult to injury and makes me go
> "no, I don't want to pull this".
> 
> Mind fixing this? Here's a TOTALLY UNTESTED patch that may or may not
> work, but might at least act as a starting point.

I agree that this idea looks much better.
I will try to rewrite this code as you suggested (it sadly didn't worked out of the box).
But since it will take me some time, do you mind to pull in the other two remaining patches?
They fix a bug with GNU make on our debian build servers and I would like one of them to be backported into stable for 3.14...

Here is the *new* pull request (I dropped the patch above!):

Hi Linus,
please pull the latest parisc architecture fixes for kernel 3.15 from: 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.15-3

Those two patches drop the architecture-specifc value for_STK_LIM_MAX to 
fix stack related problems with GNU make.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (1):
      parisc: Use generic uapi/asm/resource.h file

John David Anglin (1):
      parisc: remove _STK_LIM_MAX override

 arch/parisc/include/uapi/asm/Kbuild     | 3 ++-
 arch/parisc/include/uapi/asm/resource.h | 7 -------
 2 files changed, 2 insertions(+), 8 deletions(-)
 delete mode 100644 arch/parisc/include/uapi/asm/resource.h

