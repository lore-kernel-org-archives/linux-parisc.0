From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] parisc: unbreak automounter support on 64-bit kernel with
 32-bit userspace
Date: Fri, 1 Feb 2013 14:51:30 +0000
Message-ID: <CAHkRjk5TC+iqdJxJu1N5D-nMkb=UTff7dBVzSpdxoLMF0uN29Q@mail.gmail.com>
References: <20130131200110.GA6032@p100.box> <1359668524.2468.12.camel@dabdike>
 <510AE623.7000609@zytor.com> <1470501.uiZyX6kBKo@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ian Kent <raven@themaw.net>,
	autofs@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1470501.uiZyX6kBKo@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 31 January 2013 22:10, Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:
> H. Peter Anvin wrote:
>> On 01/31/2013 01:42 PM, James Bottomley wrote:
>> > On Thu, 2013-01-31 at 13:29 -0800, H. Peter Anvin wrote:
>> >> On 01/31/2013 12:26 PM, James Bottomley wrote:
>> >>> [adding autofs list and maintainer for their perusal and ack, although
>> >>> this is an obvious fix to me
>> >>>
>> >>> James]
>> >>
>> >> The #if list probably should be inverted, and only specific platforms
>> >> should have unsigned long...
>> >
>> > The whitelist is 64 bit only platforms, like ia64, isn't it?  So yes,
>> > they're far less numerous.
>>
>> Correct.  It is basically the 64-bit platforms without any 32-bit
>> userspace, like Alpha and IA64.
>
> Arm64?

It supports 32-bit user-space (CONFIG_COMPAT). But we missed this
#ifdef for arm64. I'm not familiar with the autofs subsystem but at a
first look it seems that autofs_wqt_t types are not shared with user
space as part of a structure. It can come as an argument for an ioctl
command but as long as we don't expect this type to hold data larger
than 32-bit it should be ok.

-- 
Catalin
