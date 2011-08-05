From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 2.6.39-rc3] parsic: Fix futex support
Date: Fri, 5 Aug 2011 17:44:03 -0400
Message-ID: <BLU0-SMTP8613717861B7E5D22BB762973C0@phx.gbl>
References: <4E177624.1030500@systemhalted.org> <201107081742.48874.vapier@gentoo.org> <4E1780EE.1010405@systemhalted.org> <BLU0-SMTP8777233F78FA13F6037090974E0@phx.gbl> <CADZpyixCFm7YUfihEJs+eR+gyUcw+S_ty+v4w2bK2s0jMFwUQg@mail.gmail.com> <2F6A03B7-0729-4774-AD1F-5D3C571DE51D@bell.net>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: "Carlos O'Donell" <carlos@systemhalted.org>,
	Mike Frysinger <vapier@gentoo.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2F6A03B7-0729-4774-AD1F-5D3C571DE51D@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 24-Jul-11, at 4:30 PM, John David Anglin wrote:

>
> On 24-Jul-11, at 2:42 PM, Carlos O'Donell wrote:
>
>> On Fri, Jul 22, 2011 at 5:51 PM, John David Anglin <dave.anglin@bell.net 
>> > wrote:
>>> Do you have a userspace patch?  There was the thread stack  
>>> allocation bug
>>> and possibly futex related issues.
>>
>> I do have a userspace patch, what would you like the patch against?
>
> The current version is unstable or 2.11.2-10.


I think we need a patch against the current unstable version (2.13-13).

I have been trying to fix the HPMCs caused by flush_cache_range.  I  
have modified it to
use flush_cache_page.  This didn't fix the HPMCs, so I added a check  
for inequivalent
aliases along the lines as that in flush_dcache_page.  Without that,  
I'm seeing warnings
like the following:

INEQUIVALENT ALIASES 0x40095000 and 0x40096000 in file pam_deny.so
INEQUIVALENT ALIASES 0x40096000 and 0x40095000 in file pam_deny.so
INEQUIVALENT ALIASES 0x40095000 and 0x40096000 in file pam_deny.so
INEQUIVALENT ALIASES 0x40096000 and 0x40095000 in file pam_deny.so
INEQUIVALENT ALIASES 0x40095000 and 0x40096000 in file pam_deny.so
INEQUIVALENT ALIASES 0x40092000 and 0x40093000 in file pam_permit.so
INEQUIVALENT ALIASES 0x40093000 and 0x40092000 in file pam_permit.so
INEQUIVALENT ALIASES 0x40092000 and 0x40093000 in file pam_permit.so
INEQUIVALENT ALIASES 0x40093000 and 0x40092000 in file pam_permit.so
INEQUIVALENT ALIASES 0x40092000 and 0x40093000 in file pam_permit.so
INEQUIVALENT ALIASES 0x40707000 and 0x40708000 in file pam_env.so
INEQUIVALENT ALIASES 0x4008b000 and 0x4008c000 in file pam_limits.so

I tried rebuilding pam from source but the only version I could find  
is 1.1.3-2.  It has
a dependency on multiarch-support.  While it builds, it won't install.
multiarch-support appears to be provided by eglibc 2.13.

I'm hoping this is the cause of the HPMCs as the messages appear  
somewhat randomly.

Another issue that I saw in debugging flush_cache_range is that it is  
sometimes
called with "64-bit" ranges.  There are no pte's and probably no page  
table for these
flushes.  Here's an example:

vm_start 0xfb0e9000, vm_end 0x7fff1001000
start 0x7fff0fff000, end 0x7fff1001000, cr25 0x3c376000
sr0 0x0, sr1 0x0, sr2 0x0, sr3 0x800
sr4 0x0, sr5 0x0, sr6 0x0, sr7 0x0

The first call and some occasional subsequent calls have this wierd  
range.

I am currently building 2.13 and will see what needs fixing.

Dave

--
John David Anglin	dave.anglin@bell.net


