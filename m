From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: glibc updated
Date: Tue, 18 Jul 2017 17:13:20 +0200
Message-ID: <7d699079b866802cfcbe1a98c1dea56d@sf-tec.de>
References: <DFA251E0-F7AD-4F50-8012-13FD30535EC2@bell.net>
 <CAE2sS1hWWdMMWMUeC3LwMJtiY8_V5ugNO7G9sz5mRHcoF7JeQg@mail.gmail.com>
 <e2995a78-a001-c142-4fbd-0c09abf3b9be@bell.net>
 <23667583-845e-3ce9-f327-456fd042cc32@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <23667583-845e-3ce9-f327-456fd042cc32@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Am 2017-07-18 16:32, schrieb John David Anglin:
> On 2017-07-17 12:33 PM, John David Anglin wrote:
>> I would like to know if the gentoo folks would consider fixing the 
>> __gmon_start__ bug:
>> https://sourceware.org/bugzilla/show_bug.cgi?id=19170
>> 
>> There is some risk in applying the patch as rebuilding a library 
>> package may break other
>> packages which depend on the library.  This could break critical tools 
>> such as binutils and
>> gcc.  In which case, some manual intervention may be needed. However, 
>> the transition
>> on Debian went fairly smoothly.  As a result, we no longer have the 
>> external symbol
>> __gmon_start exposed and we have correct library dependencies.
>> 
>> The issues with _init referred to in the BZ report are fixed.  It is 
>> now PIC; and PIE applications
>> work on hppa thanks to Alan Modra.
> Helge: we need to add PIE load address to the kernel TODO list if it's
> not already there.
>> 
>> Although not ideal, we could keep the __gmon_start__ patch in Debian.
>> 
> The other approach is to install the __gmon_start__ patch and let
> gentoo revert it.  I'm starting
> to think this is best.

I don't think there will be a big problem for Gentoo to accept it, as 
long as there is a working upgrade path like "build glibc with flag 
-special-foo, rebuild system, remove flag and rebuild glibc again". And 
of course a hint in the release notes so it will be obvious to the 
packagers what they have to take care of. That flag thing is something 
that Gentoo probably can add to their build scripts, something that e.g. 
keeps the symbol in the lib without exporting it during linking, so it 
would be resolvable first and the reference goes away on rebuild. Or 
whatever ;)

Eike
