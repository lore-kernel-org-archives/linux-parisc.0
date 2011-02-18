From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: binutils change break glibc build
Date: Fri, 18 Feb 2011 00:32:36 -0500
Message-ID: <AANLkTikL=ANnoEE6=orNbqkinW4-pEngWKh6UkBLWx5v@mail.gmail.com>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca> <20110210200044.203164E01@hiauly1.hia.nrc.ca>
 <20110212161846.GA24076@hiauly1.hia.nrc.ca> <20110213193934.GA28834@hiauly1.hia.nrc.ca>
 <20110215015852.GA6615@hiauly1.hia.nrc.ca> <AANLkTimZntmJQ5msVr56=V7P8pYGXizpVGinZYrvBsSt@mail.gmail.com>
 <20110217003032.GA26155@hiauly1.hia.nrc.ca> <20110217010912.GA26425@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	"Carlos O'Donell" <carlos@systemhalted.org>,
	James.Bottomley@hansenpartnership.com, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110217010912.GA26425@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Feb 16, 2011 at 8:09 PM, John David Anglin wrote:
> On Wed, 16 Feb 2011, John David Anglin wrote:
>> I would like to apply the following binutils change to align data
>> segments to a page boundary. =A0However, it breaks building glibc.
>> Problem occurs in call_init trying to run constructors for new
>> libc.so.6.
>
> It's probably not a glibc issue:
>
> /home2/dave/debian/glibc/eglibc-2.11.2/build-tree/hppa-libc/libc.so.6=
: =A0 =A0 file
> format elf32-hppa-linux
>
> Contents of section .init_array:
> =A0159008 ffffffff 0015bee2 00000000 =A0 =A0 =A0 =A0 =A0 ............

glibc-2.12 and earlier (and perhaps 2.12.[12] too) are known to be
miscompiled by binutils versions newer than 2.21.50.xxx.  the issue
has been fixed in glibc-2.13 though ...

http://bugs.gentoo.org/351177
-mike
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
