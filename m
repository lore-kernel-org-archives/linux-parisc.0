From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Changes to fcntl.h and F_* numbers?
Date: Fri, 20 Nov 2009 17:57:01 -0500
Message-ID: <119aab440911201457j1727576blde3c62569f927711@mail.gmail.com>
References: <119aab440911181222v79ad775ena36a4140e80847e3@mail.gmail.com>
	 <20091119032220.GG28962@bombadil.infradead.org>
	 <119aab440911190900t62122ed8m987c55821ca64062@mail.gmail.com>
	 <1258651414.6363.12.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1258651414.6363.12.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Nov 19, 2009 at 12:23 PM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Thu, 2009-11-19 at 12:00 -0500, Carlos O'Donell wrote:
>> On Wed, Nov 18, 2009 at 10:22 PM, Kyle McMartin <kyle@mcmartin.ca> w=
rote:
>> > On Wed, Nov 18, 2009 at 03:22:15PM -0500, Carlos O'Donell wrote:
>> >> Kyle, Helge,
>> >>
>> >> I've seen some recent churn regarding the kernel fcntl.h and F_* =
numbers.
>> >>
>> >> If our numbers change please keep me in the loop so I can update =
the C
>> >> library side.
>> >>
>> >
>> > ?
>>
>> http://marc.info/?l=3Dlinux-api&m=3D125688056905828&w=3D2
>
> But this isn't parisc specific ... it's a bug CodeSourcery reported i=
n
> the ABI assignment in asm-generic.

Yes, that's correct, the original issue doesn't apply to parisc.

I pull from kyle's tree here:
git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git

In kyle's tree I see:
"arch/parisc/include/asm/fcntl.h"
#define F_GETOWN_EX     15
#define F_SETOWN_EX     16

The original message that Joseph Myers at CodeSourcery posted here:
http://marc.info/?l=3Dlinux-api&m=3D125466028819859&w=3D2

Does not apply to us.

> We already look to have this sorted out locally in our fcntl.h ... so
> we're not going to be changing anything, are we? =A0Or are you saying
> (because we could get into trouble in future) that we should adopt th=
e
> asm generic ones?

I don't think we have to change anything.

It would probably be less maintenance for Kyle in the future if we
adopted the generic ones for future flags.

The message I referenced here:
http://marc.info/?l=3Dlinux-api&m=3D125688056905828&w=3D2

by Stephen Rothwell <sfr@canb.auug.org.au>, has a parisc specific piece=
 here:

~~~
diff --git a/arch/parisc/include/asm/fcntl.h b/arch/parisc/include/asm/=
fcntl.h
index 5f39d55..1e1c824 100644
--- a/arch/parisc/include/asm/fcntl.h
+++ b/arch/parisc/include/asm/fcntl.h
@@ -28,8 +28,6 @@
 #define F_SETOWN	12	/*  for sockets. */
 #define F_SETSIG	13	/*  for sockets. */
 #define F_GETSIG	14	/*  for sockets. */
-#define F_GETOWN_EX	15
-#define F_SETOWN_EX	16

 /* for posix fcntl() and lockf() */
 #define F_RDLCK		01
~~~

I don't know why he wants to remove bits from our fcntl.h.

The intent of my original email was to say "Hi! I'm the libc
maintainer, I'll fix things if you notice a problem."

I'm pretty sure I'm on linux-api, but I missed this issue.

Cheres,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
