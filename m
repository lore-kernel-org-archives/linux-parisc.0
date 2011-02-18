From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: binutils change break glibc build
Date: Fri, 18 Feb 2011 14:39:57 -0500
Message-ID: <AANLkTimD=2ESSMormpZ+coo40GyLDYGeNPrwvdYVM61G@mail.gmail.com>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca>
	<20110210200044.203164E01@hiauly1.hia.nrc.ca>
	<20110212161846.GA24076@hiauly1.hia.nrc.ca>
	<20110213193934.GA28834@hiauly1.hia.nrc.ca>
	<20110215015852.GA6615@hiauly1.hia.nrc.ca>
	<AANLkTimZntmJQ5msVr56=V7P8pYGXizpVGinZYrvBsSt@mail.gmail.com>
	<20110217003032.GA26155@hiauly1.hia.nrc.ca>
	<20110218184030.GA15510@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James.Bottomley@hansenpartnership.com, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110218184030.GA15510@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Feb 18, 2011 at 1:40 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> On Wed, 16 Feb 2011, John David Anglin wrote:
>
>> I would like to apply the following binutils change to align data
>> segments to a page boundary. =A0However, it breaks building glibc.
>> Problem occurs in call_init trying to run constructors for new
>> libc.so.6.
>
> After investigation, I found that the change to emulparams/hppalinux.=
sh
> was not the cause of the glibc breakage. =A0So, I have committed the =
change
> to align data segments to a maxpagesize boundary (currently 0x1000).
>
> This fixes one source of inequivalent aliases at the expense of
> somewhat larger binaries.

A minor loss for a significant gain :-)

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
