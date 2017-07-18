From: John David Anglin <dave.anglin@bell.net>
Subject: Re: glibc updated
Date: Tue, 18 Jul 2017 16:26:37 -0400
Message-ID: <374e365f-a708-2474-2ddd-df77029b818e@bell.net>
References: <DFA251E0-F7AD-4F50-8012-13FD30535EC2@bell.net>
 <7d699079b866802cfcbe1a98c1dea56d@sf-tec.de>
 <f00975c4-8a3b-06c6-79b4-ad8559828e98@bell.net>
 <4158728.XctjvHHbYe@daneel.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
To: Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4158728.XctjvHHbYe@daneel.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-07-18 3:39 PM, Rolf Eike Beer wrote:
> John David Anglin wrote:
>> On 2017-07-18 11:13 AM, Rolf Eike Beer wrote:
>>> Am 2017-07-18 16:32, schrieb John David Anglin:
>>>> On 2017-07-17 12:33 PM, John David Anglin wrote:
>>>>> I would like to know if the gentoo folks would consider fixing the
>>>>> __gmon_start__ bug:
>>>>> https://sourceware.org/bugzilla/show_bug.cgi?id=19170
>>>>>
>>>>> There is some risk in applying the patch as rebuilding a library
>>>>> package may break other
>>>>> packages which depend on the library.  This could break critical
>>>>> tools such as binutils and
>>>>> gcc.  In which case, some manual intervention may be needed.
>>>>> However, the transition
>>>>> on Debian went fairly smoothly.  As a result, we no longer have the
>>>>> external symbol
>>>>> __gmon_start exposed and we have correct library dependencies.
>>>>>
>>>>> The issues with _init referred to in the BZ report are fixed. It is
>>>>> now PIC; and PIE applications
>>>>> work on hppa thanks to Alan Modra.
>>>> Helge: we need to add PIE load address to the kernel TODO list if it's
>>>> not already there.
>>>>
>>>>> Although not ideal, we could keep the __gmon_start__ patch in Debian.
>>>> The other approach is to install the __gmon_start__ patch and let
>>>> gentoo revert it.  I'm starting
>>>> to think this is best.
>>> I don't think there will be a big problem for Gentoo to accept it, as
>>> long as there is a working upgrade path like "build glibc with flag
>>> -special-foo, rebuild system, remove flag and rebuild glibc again".
>>> And of course a hint in the release notes so it will be obvious to the
>>> packagers what they have to take care of. That flag thing is something
>>> that Gentoo probably can add to their build scripts, something that
>>> e.g. keeps the symbol in the lib without exporting it during linking,
>>> so it would be resolvable first and the reference goes away on
>>> rebuild. Or whatever ;)
>> I'm not sure you fully understand the issue.  It doesn't involve doing
>> anything special in building glibc.
>>
>> The issue is this code in glibc's crtn.S:
>>
>> /* Note that we cannot have a weak undefined __gmon_start__, because
>>      that would require this to be PIC, and the linker is currently not
>>      able to generate a proper procedure descriptor for _init.  Sad but
>>      true.  Anyway, HPPA is one of those horrible architectures where
>>      making the comparison and indirect call is quite expensive (see the
>>      comment in sysdeps/generic/initfini.c). */
>>           .text
>>           .align 4
>>           .weak   __gmon_start__
>>           .type    __gmon_start__,@function
>> __gmon_start__:
>>           .proc
>>           .callinfo
>>           .entry
>>           bv,n %r0(%r2)
>>           .exit
>>           .procend
>>
>> The above hunk of code results in a weak __gmon_start__ function in
>> every shared library.
>> The function needs to be removed.
>>
>> As can be seen, the function does nothing.  It is called once when a
>> shared library is loaded.
>>
>> In an application link, __gmon_start__ is resolved to one of the shared
>> libraries used by the application.
> So, this would be a problem if the application only links to glibc (and it's
> libraries), no? The problem is not rebuilding, Gentoo is actually totally
> about rebuilding your system every now and then ;) The point is: what must be
> done to have an upgrade path from the old glibc to the new one that will not
> break the system on the way.
It's not a problem for applications that only link against libc, but for 
other libraries.  I'm
not aware of any way to avoid some breakage other than retaining the old 
behavior.  The new
glibc doesn't break anything directly.  The breakage occurs when 
libraries are linked with
the new crt* files.

One could build up a minimal system in a chroot.  When you are sure that 
it works, then
these tools could be used to get past any breakage.  I don't know the 
gentoo build system
so I don't know how easy this would be.

Dave

-- 
John David Anglin  dave.anglin@bell.net

