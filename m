From: John David Anglin <dave.anglin@bell.net>
Subject: Re: HP-UX for C8000
Date: Sun, 8 Oct 2017 12:22:50 -0400
Message-ID: <E9BCD0C2-329E-4E93-B4B8-2B928C458BE0@bell.net>
References: <20170930152506.GA10542@alpha.franken.de> <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net> <20171001114626.GA16118@alpha.franken.de> <692A47DA-6F88-44E7-AA7C-2DE516387604@bell.net> <20171006143917.GA4906@alpha.franken.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20171006143917.GA4906@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-10-06, at 10:39 AM, Tom Bogendoerfer wrote:

> Now the challenge is to see, if it compiles and works on HP-UX the same
> way...

So far, I'm not having much success.  The system isn't setup with any additional tools
and only HP's 32 and 64-bit non-ansi compilers are available.  So, there are issues with
64-bit constants.  Never set up networking as well.

Using 64-bit "cc +DA2.0W", I get:

mmap: Invalid argument

If I change QUICKSILVER_ADDR to 0, I get:

mmap: No such device

So, I think mmap can't map "/dev/mem".

I tried dd with skip but this gives a bad address.  Maybe lseek + read would work in C code to copy page.

Dave
--
John David Anglin	dave.anglin@bell.net



