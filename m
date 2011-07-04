From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Inequivalent aliases when stracing tst-cputimer1.
Date: Mon, 4 Jul 2011 09:28:42 -0400
Message-ID: <BLU0-SMTP9794777FA894A72C335DF0975C0@phx.gbl>
References: <CADZpyixbjoptakCZrdF2_X3twOMtr=Jsh__Dx3A_98=D_XZneA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyixbjoptakCZrdF2_X3twOMtr=Jsh__Dx3A_98=D_XZneA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/3/2011 10:39 PM, Carlos O'Donell wrote:
> James, Dave,
>
> While running some glibc tests on 2.6.39-rc3a+ I noticed the following:
> ~~~
> ...
> [ 7649.424000] INEQUIVALENT ALIASES 0x13000 and 0x14000 in file tst-cputimer1
> [ 7649.568000] INEQUIVALENT ALIASES 0x13000 and 0x14000 in file tst-cputimer1
> [ 7649.720000] INEQUIVALENT ALIASES 0x13000 and 0x14000 in file tst-cputimer1
> ...
> ~~~
>
> This is a binutils head, building glibc head, with gcc 4.4.4.
>
> This *only* happens when I strace the application.
>
> While the application is being strace'd it continually dumps the same
> message about inequivalent aliases.
>
> Any idea what's going on here?
>
> How can I fix it? :-)

You need to update binutils to get new linker (actually, it's the 
default linker script that's changed).
The new linker script starts the data section on a page boundary.

It's not GCC version dependent.  However, newer GCC versions have 
improved delay slot handling.

It's caused by overlapping mappings of text and data which you can see 
by dumping the maps file
for the process.  I think I may have back ported the fix.  If you build 
binutils head, you will have to
configure with --disable-initfini-array to build glibc.

I don't know all the circumstances under which the message appears.  It 
always occurs on a core
dump.  It occurs when a page needs to be flushed and there are two or 
more inequivalent aliases
to the page.

It's probably harmless on A500.  It affects PA8800/PA8900.

Dave
