From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: parisc: flush pages through tmpalias space
Date: Wed, 5 Jan 2011 12:37:04 -0500
Message-ID: <AANLkTikC_1OGzzUkFpiCGx+F=29E9BZnyzU8xL0V-JU0@mail.gmail.com>
References: <1293034931.3019.8.camel@mulgrave.site>
	<20101229042346.GA973@hiauly1.hia.nrc.ca>
	<1293634281.2803.4.camel@fuzzy>
	<20101230155640.GA7058@hiauly1.hia.nrc.ca>
	<20101230160944.GA7360@hiauly1.hia.nrc.ca>
	<20110101183108.GA19035@hiauly1.hia.nrc.ca>
	<20110105034922.GA4120@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110105034922.GA4120@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jan 4, 2011 at 10:49 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> On Sat, 01 Jan 2011, John David Anglin wrote:
>
>> On Thu, 30 Dec 2010, John David Anglin wrote:
>>
>> > On Thu, 30 Dec 2010, John David Anglin wrote:
>> >
>> > > Attached is an application that triggers similar errors:
>>
>> Here is a simpler testcase:
>>
>> int main ()
>> {
>> =A0 asm ("stw %r0,0(%r0)"); /* Generate null pointer exception */
>> =A0 return 0;
>> }
>>
>> With the above, I get the following INEQUIVALENT ALIASES messages:
>>
>> Jan =A01 10:23:19 gsyprf11 kernel: [135942.140000] INEQUIVALENT ALIA=
SES 0x406b1000 and 0x406b0000 in file libc-2.11.2.so
>> Jan =A01 10:23:19 gsyprf11 kernel: [135942.224000] INEQUIVALENT ALIA=
SES 0x406b1000 and 0x406b0000 in file libc-2.11.2.so
>
> This is what I see in the tasks maps file in /proc:
>
> 00010000-00011000 r-xp 00000000 08:30 6613687 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/home2/dave/inequiv/xxx1
> 00011000-00012000 rwxp 00000000 08:30 6613687 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/home2/dave/inequiv/xxx1
> 40000000-40005000 rw-p 00000000 00:00 0
> 4002b000-4004b000 r-xp 00000000 08:03 2502157 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/lib/ld-2.11.2.so
> 4004b000-4004f000 rwxp 0001f000 08:03 2502157 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/lib/ld-2.11.2.so
> 4004f000-40050000 rwxp 00000000 00:00 0
> 40138000-40291000 r-xp 00000000 08:03 2502172 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/lib/libc-2.11.2.so
> 40291000-40298000 rwxp 00158000 08:03 2502172 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/lib/libc-2.11.2.so
> 40298000-4029a000 rwxp 00000000 00:00 0
> fe09b000-fe0be000 rwxp 00000000 00:00 0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[stack]
>
> As can be seen, there are duplicate maps with different protections f=
or xxx1,
> etc. =A0So, it's clear why we have the inequivalent aliases. =A0The m=
ap can
> be accessed by the application (probably just for lines in the cache)=
=2E
> I have seen some discussions that even a read may lead to cache corru=
ption.
>
> These inequivalent maps are coming from glibc:
>
> dave@gsyprf11:~/inequiv$ strace /lib/ld-2.11.2.so ./xxx1
> execve("/lib/ld-2.11.2.so", ["/lib/ld-2.11.2.so", "./xxx1"], [/* 17 v=
ars */]) =3D 0
> brk(0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0=3D 0x4119a000
> open("./xxx1", O_RDONLY) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 3
> read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\2\0\17\0\0\0\1\0\1\3T\0\0\=
0004"..., 512) =3D 512
> fstat64(3, {st_mode=3D0, st_size=3D4380866642020, ...}) =3D 0
> getcwd("/home2/dave/inequiv", 128) =A0 =A0 =A0=3D 20
> mmap(0x10000, 4096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DE=
NYWRITE, 3, 0) =3D 0x10000
> mmap(0x11000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_F=
IXED|MAP_DENYWRITE, 3, 0) =3D 0x11000
> ...
>
> Carlos what do you think? =A0arch_get_unmapped_area() accepts MAP_FIX=
ED
> requests even if it would violate cache aliasing constraints. =A0I do=
n't
> understand the purpose of the region at 0x11000.

I'm currently on the South Rim of the Grand Canyon with limited access
to my systems. I'll be back in touch near the end of January and look
into this.

What does the application look like e.g. readelf -a?

The 0x11000 region looks like .data?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
