From: John David Anglin <dave.anglin@bell.net>
Subject: Re: hppa: glibc and gcc 4.6, "error: _rtld_global_ro causes a section type conflict"
Date: Tue, 24 Apr 2012 19:55:11 -0400
Message-ID: <BLU0-SMTP9C263F5C55BC27550263497260@phx.gbl>
References: <CADZpyix39LFL7MccuovarhdbpVCO8aSmBMH1hjK+4bn=ZYsXaA@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	libc-ports@sourceware.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyix39LFL7MccuovarhdbpVCO8aSmBMH1hjK+4bn=ZYsXaA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 15-Apr-12, at 11:00 AM, Carlos O'Donell wrote:

> When compiling glibc on magnum with gcc-4.6 I get an odd failure about
> section type conflicts.


After discussing the issue with Jakub Jelinek,  it appears the bug is  
caused by placing
function labels (plabels) in the constant pool.  PA has done this for  
longer than I can
remember, but it doesn't appear necessary.  As you know, only ia64 and  
pa use plabels.
This causes the setting of default flags for .data.rel.ro which  
conflict with those needed
for _rtld_global_ro in the dynamic linker.  The problem doesn't have  
anything directly
to do with the handling of the variable _rtld_global_ro.  This was  
what was confusing
me as everything seemed generic.

I am testing a fix.  Your testcase compiles successfully with the fix.

The issue is incredibly subtle.  I would guess it was just a matter of  
luck that other targets
aren't affected given that the code in rtld.c is not exactly exactly  
kosher from GCC POV.

Regards,
Dave
--
John David Anglin	dave.anglin@bell.net



