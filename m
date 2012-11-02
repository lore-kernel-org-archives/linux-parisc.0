From: Michel Lespinasse <walken@google.com>
Subject: Re: possible virtual aliasing issues on parisc ?
Date: Fri, 2 Nov 2012 04:20:48 -0700
Message-ID: <CANN689HPeQhYCDcFenTH35iBL8zV7vpHvsQUJQOD=Vz3Z9D3bQ@mail.gmail.com>
References: <CANN689E4p3woSkdLavyyPA2gZUmVvOAW4w0R6fo9exRPQDa=JA@mail.gmail.com>
	<1351848864.2439.18.camel@dabdike.int.hansenpartnership.com>
	<1351854504.2439.20.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1351854504.2439.20.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Nov 2, 2012 at 4:08 AM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Fri, 2012-11-02 at 09:34 +0000, James Bottomley wrote:
>> > Looking at the arch/parisc/kernel/sys_parisc.c implementation of
>> > get_shared_area(), I do have a concern though. The function basically
>> > ignores the pgoff argument, so that if one creates a shared mapping of
>> > pages 0-N of a file, and then a separate shared mapping of pages 1-N
>> > of that same file, both will have the same cache offset for their
>> > starting address.
>> >
>> > This looks like this would create obvious aliasing issues. Am I
>> > misreading this ? I can't understand how this could work good enough
>> > to be undetected, so there must be something I'm missing here ???
>>
>> No, I think it does.
>>
>> I also think the pgoff != 0 case is rare, so it doesn't show very often.
>> To test this, I booted up with a printk for every pgoff != 0 and it
>> didn't trigger, so it's probably not seen in the ordinary course of
>> events.
>
> I got it to show: Git uses mmap2 with large page offsets.  However, it
> seems to use offsets with a granularity of 16MB which is 4x our aliasing
> congruency, so an equivalency problem still wouldn't show up.

All right. Thanks for looking it up - I just wasn't sure if my reading
of the code was correct (and, I am surprised this isn't more common :)

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
