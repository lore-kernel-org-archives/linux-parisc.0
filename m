From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Does there exists any 32bit-only PARISC SMP machines?
Date: Thu, 05 Sep 2013 12:24:09 -0400
Message-ID: <5228B029.8060807@bell.net>
References: <521F9848.4010404@gmx.de> <1377830541.2331.5.camel@dabdike> <20130903155643.GA1430@glitch> <trinity-b7a0d82a-16b9-4204-be6e-2873db548248-1378282389073@3capp-gmx-bs28> <20130904140705.GA30223@glitch> <20130904142847.GA2893@glitch> <5227548F.5090909@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5227548F.5090909@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9/4/2013 11:41 AM, John David Anglin wrote:
> On 9/4/2013 10:28 AM, Domenico Andreoli wrote:
>> BTW, this is the most detailed investigation I'm aware of:
>>
>> https://lkml.org/lkml/2008/4/20/251
> I have the sense that MEM_RENDEZ_HI may not be set correctly for your 
> machine:
>
>         /* Set the smp rendezvous address into page zero.
>         ** It would be safer to do this in init_smp_config() but
>         ** it's just way easier to deal with here because
>         ** of 64-bit function ptrs and the address is local to this file.
>         */
>         load32          PA(smp_slave_stext),%r10
>         stw             %r10,0x10(%r0)  /* MEM_RENDEZ */
>         stw             %r0,0x28(%r0)   /* MEM_RENDEZ_HI - assume addr 
> < 4GB */
>
> This is possibly due to a change in memory range detection:
>
> --- dmesg.txt 2008-04-21 11:19:16.000000000 +0200
> +++ dmesg2.txt 2008-04-21 15:27:46.000000000 +0200
> @@ -1,6 +1,7 @@
> -Linux version 2.6.22-3-parisc64-smp (Debian 2.6.22-6) 
> (maks@debian.org) (gcc version 4.1.3 20071019 (prerelease) (Debian 
> 4.1.2-17)) #2 SMP Mon Nov 12 21:04:20 CET 2007
> +Linux version 2.6.25 (cavok@ska) (gcc version 4.1.3 20080308 
> (prerelease) (Debian 4.1.2-21)) #8 SMP Mon Apr 21 12:25:50 CES8
Kyle more or less confirmed that smp_slave_stext is not being call.  The 
firmware documentation
indicates that this might occur if memory isn't "properly" initialized.  
It would be helpful if you did a regression search
for the change that broke the cpu release.

Dave

-- 
John David Anglin    dave.anglin@bell.net

