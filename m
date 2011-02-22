From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: binutils change break glibc build
Date: Tue, 22 Feb 2011 10:07:16 -0500
Message-ID: <AANLkTi=noWe9hcpQotdCXz-K2kQL935Ha8rR6f1Lwt-h@mail.gmail.com>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca>
	<20110210200044.203164E01@hiauly1.hia.nrc.ca>
	<20110212161846.GA24076@hiauly1.hia.nrc.ca>
	<20110213193934.GA28834@hiauly1.hia.nrc.ca>
	<20110215015852.GA6615@hiauly1.hia.nrc.ca>
	<AANLkTimZntmJQ5msVr56=V7P8pYGXizpVGinZYrvBsSt@mail.gmail.com>
	<20110217003032.GA26155@hiauly1.hia.nrc.ca>
	<20110218184030.GA15510@hiauly1.hia.nrc.ca>
	<AANLkTimD=2ESSMormpZ+coo40GyLDYGeNPrwvdYVM61G@mail.gmail.com>
	<20110222001355.GA21523@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James.Bottomley@hansenpartnership.com, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110222001355.GA21523@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 21, 2011 at 7:13 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> On Fri, 18 Feb 2011, Carlos O'Donell wrote:
>
>> > This fixes one source of inequivalent aliases at the expense of
>> > somewhat larger binaries.
>>
>> A minor loss for a significant gain :-)
>
> After rebuilding glibc with the new binutils, I no longer see any
> INEQUIVALENT ALIASES messages building and checking GCC.
>
> My suggestion to use VM_WRITE doesn't work as a method to distinguish
> aliases as gdb sets up writeable maps to text pages.

Excellent, does that mean that glibc does not create inequivalent
aliases with all of its tom-foolery with mmap?

Cheers,
Carlos.
