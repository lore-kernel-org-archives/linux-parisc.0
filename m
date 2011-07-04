From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Inequivalent aliases when stracing tst-cputimer1.
Date: Mon, 4 Jul 2011 10:21:59 -0400
Message-ID: <BLU0-SMTP414C3D96581B1FAED8EE23975C0@phx.gbl>
References: <CADZpyixbjoptakCZrdF2_X3twOMtr=Jsh__Dx3A_98=D_XZneA@mail.gmail.com> <BLU0-SMTP9794777FA894A72C335DF0975C0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP9794777FA894A72C335DF0975C0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/4/2011 9:28 AM, John David Anglin wrote:
> On 7/3/2011 10:39 PM, Carlos O'Donell wrote:
>> This is a binutils head, building glibc head, with gcc 4.4.4. You 
>> need to update binutils to get new linker (actually, it's the default 
>> linker script that's changed).
>> The new linker script starts the data section on a page boundary.

Depending on how GCC is configured, it may or may not use your binutils 
head linker.  gcc -v should show
what's going on.

Dave
