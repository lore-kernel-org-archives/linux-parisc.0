From: John David Anglin <dave.anglin@bell.net>
Subject: Re: hppa atomic support in gcc?
Date: Sun, 1 Sep 2013 14:19:53 -0400
Message-ID: <BLU0-SMTP69B19758B3BB4407E8D2A597370@phx.gbl>
References: <CAE2sS1iGfx7RgreM9VB7mPPDkzg=huhFuAtVSyxPz3xQ_3t_8Q@mail.gmail.com> <5213894D.1020508@bell.net> <CAE2sS1gzxWs-5ab9+L+vHY2n2F-XbXRYO3wWQRwbDjXPVR8TBg@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1gzxWs-5ab9+L+vHY2n2F-XbXRYO3wWQRwbDjXPVR8TBg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 21-Aug-13, at 1:57 PM, Carlos O'Donell wrote:

> On Tue, Aug 20, 2013 at 11:20 AM, John David Anglin
> <dave.anglin@bell.net> wrote:
>> Hi Carlos,
>>
>> Yes, it been there for many years but it doesn't use glibc's  
>> atomic.h.  It
>> directly
>> does light-weight system calls into kernel.  The implementation is  
>> very
>> similar to arm.
>> See: libgcc/config/pa/linux-atomic.c.
>>
>> Helge did the initial implementation and I have fixed a few bugs in  
>> it.
>>
>> I changed to using this atomic support in the qt4-x11 package  
>> because the
>> existing
>> ldcw based locking broke the qt4smoke package build.  I need to  
>> submit my
>> patch
>> somewhere.
>
> Awesome. Responded to Guy Martin with this info.


I noticed today that the /usr/bin/dot command was dropping core.  It  
generates several
threads when it runs.

Looking at one of the dumps, it turned out that the exception was in  
g_private_get.  This
involves various atomic operations.  Looking at the glib2.0 atomic  
implementation,
I see it depends on the GCC cpp define  
__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.
Because of the library implementation, this symbol isn't being  
defined.  So, glib2.0's
atomic support isn't atomic.

I'm looking at a GCC change to define the above.  Maybe this will  
help.  The situation might
be similar for other packages.

Dave
--
John David Anglin	dave.anglin@bell.net



