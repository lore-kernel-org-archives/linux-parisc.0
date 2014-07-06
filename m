From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] fix fanotify_mark() breakage on big endian 32bit kernel
Date: Sun, 6 Jul 2014 11:08:41 -0400
Message-ID: <BLU436-SMTP16549AF626A4BCCDD6D82097020@phx.gbl>
References: <20140704151235.GA22454@ls3530.dhcp.wdf.sap.corp> <20140706091530.GA3589@osiris>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Helge Deller <deller@gmx.de>, Eric Paris <eparis@redhat.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140706091530.GA3589@osiris>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 6-Jul-14, at 5:15 AM, Heiko Carstens wrote:

>> But for the CONFIG_COMPAT=n case (32bit kernel & userspace),
>> compat_fanotify_mark() isn't used and the fanotify_mark syscall  
>> implementation
>> is used directly. In that case the upper and lower 32 bits of the  
>> 64bit mask
>> parameter is still swapped on big endian machines and thus leads to
>> fanotify_mark failing with -EINVAL.
>
> Why do you think upper and lower 32 bits are swapped on big endian  
> machines?
> At least an s390 the C ABI defines that 64 bit values are split into  
> an
> even odd register pair, where the most significant bits are in the  
> even numbered
> register.


On hppa, there is no specific rule as to which registers are used to  
hold 64-bit integer values
on 32-bit machines except for the first two call arguments which are  
passed in registers.
For example, r25 and r26 contain the first argument and the most  
significant bits are in r25
and the least significant bits in r26..

In GCC, we typically have an odd even register pair to hold 64-bit  
values as register
r0 is not usable.

The rules are different for float values.

Dave
--
John David Anglin	dave.anglin@bell.net



