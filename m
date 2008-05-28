From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [bug] gcc-4.[23] miscompiling causing networking to bugger up
Date: Wed, 28 May 2008 18:55:29 -0400
Message-ID: <119aab440805281555n7d16c1ccn4a2d73f267c3b686@mail.gmail.com>
References: <20080528190946.GA30501@phobos.i.cabal.ca>
	 <20080528200035.GB30501@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080528200035.GB30501@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, May 28, 2008 at 4:00 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> On Wed, May 28, 2008 at 03:09:46PM -0400, Kyle McMartin wrote:
>> So I've narrowed the regression down to a miscompilation (presumably) of
>> net/ipv4/ip_output.o, in the sense that
>>
>>       cp linux-2.6-gcc34/net/ipv4/ip_output.o
>>               linux-2.6-gcc43/net/ipv4/ip_output.o
>>       touch linux-2.6-gcc43/net/ipv4/ip_output.o
>>       make vmlinux
>>
>> fixes the issue.
>>
>
> Apparently I was on glue and gcc-4.2 is not problematic.

If you compile ip_output.c with -O0 does it work with gcc-4.3?

Cheers,
Carlos.
