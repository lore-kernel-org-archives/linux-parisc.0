From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes) and more
Date: Sun, 26 Mar 2006 18:09:22 +0000
Message-ID: <4426D8D2.8040209@tiscali.be>
References: <e6eae0290603251932l142222f2n@mail.gmail.com>	<20060326040516.GA27713@hiauly1.hia.nrc.ca> <200603261858.56874.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org,
 John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Matthias Klose <doko@cs.tu-berlin.de>
To: Helge Deller <deller@gmx.de>
Return-Path: <soete.joel@tiscali.be>
In-Reply-To: <200603261858.56874.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

Hello Matthias,

Helge Deller wrote:
> On Sunday 26 March 2006 06:05, John David Anglin wrote:
> 
>>>Regarding the segfault, I can't help you there ... although I have seen many
>>>applications not longer working on my Debian/testing system lately
>>>(segfault, 'unresolvable relocation error 0x42' most of the time).
>>
>>This should be fixed in libc6 2.3.6-3 which has support for the above
>>relocation.  If it's still occurring, there needs to be a new bug report.
>>In the situations that I've seen the relocations are coming from
>>/usr/lib/Scrt1.o when pie code is being used.
> 
> 
> Hi Dave,
> 
> I'm running libc6-2.3.6-4 and see some strange crashes. Might it be related, or does  2.3.6-4 doesn't includes your fix ?
> 
Do you know in which gcc-4.0 dpkg release the jda patch 
(<http://lists.parisc-linux.org/pipermail/parisc-linux/2006-March/028548.html>) was in?
I can so check in buildd with which compiler this new glibc-2.3.6-4 was build ;-)

TIA,
	Joel
