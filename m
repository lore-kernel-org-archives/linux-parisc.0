From: John David Anglin <dave.anglin@bell.net>
Subject: Re: glibc updated
Date: Tue, 18 Jul 2017 10:32:17 -0400
Message-ID: <23667583-845e-3ce9-f327-456fd042cc32@bell.net>
References: <DFA251E0-F7AD-4F50-8012-13FD30535EC2@bell.net>
 <CAE2sS1hWWdMMWMUeC3LwMJtiY8_V5ugNO7G9sz5mRHcoF7JeQg@mail.gmail.com>
 <e2995a78-a001-c142-4fbd-0c09abf3b9be@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Parisc List <linux-parisc@vger.kernel.org>,
        Helge Deller <deller@gmx.de>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <e2995a78-a001-c142-4fbd-0c09abf3b9be@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-07-17 12:33 PM, John David Anglin wrote:
> I would like to know if the gentoo folks would consider fixing the 
> __gmon_start__ bug:
> https://sourceware.org/bugzilla/show_bug.cgi?id=19170
>
> There is some risk in applying the patch as rebuilding a library 
> package may break other
> packages which depend on the library.  This could break critical tools 
> such as binutils and
> gcc.  In which case, some manual intervention may be needed. However, 
> the transition
> on Debian went fairly smoothly.  As a result, we no longer have the 
> external symbol
> __gmon_start exposed and we have correct library dependencies.
>
> The issues with _init referred to in the BZ report are fixed.  It is 
> now PIC; and PIE applications
> work on hppa thanks to Alan Modra.
Helge: we need to add PIE load address to the kernel TODO list if it's 
not already there.
>
> Although not ideal, we could keep the __gmon_start__ patch in Debian.
>
The other approach is to install the __gmon_start__ patch and let gentoo 
revert it.  I'm starting
to think this is best.

Dave

-- 
John David Anglin  dave.anglin@bell.net

