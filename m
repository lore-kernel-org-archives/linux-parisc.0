Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 24 Oct 2002 13:36:10 +0200
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.5 varenet
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v546)
Cc: parisc-linux@lists.parisc-linux.org,
	parisc-linux-cvs@lists.parisc-linux.org,
	Laurent Canet <canetl@esiee.fr>
To: Richard Hirst <rhirst@linuxcare.com>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20021024071800.GG603@sleepie.demon.co.uk>
Message-Id: <CAF57F6C-E744-11D6-BB9C-0030656F07A2@esiee.fr>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Le jeudi, 24 oct 2002, =E0 09:18 Europe/Paris, Richard Hirst a =E9crit :

> On Wed, Oct 23, 2002 at 10:46:11AM -0600, Thibaut Varene wrote:
>> CVSROOT:	/var/cvs
>> Module name:	linux-2.5
>> Changes by:	varenet	02/10/23 10:46:11
>>
>> Modified files:
>> 	include/asm-parisc: param.h
>>
>> Log message:
>> Switched to HZ =3D=3D 1000 for CONFIG_PA20.
>> Patch submitted by Laurent Canet.
>
> Don't know if this was simply a #define change, but if so...
> Robert Love has been arguing lately that you can't just do that as
> various userspace stuff is compiled with a knowledge of the kernel HZ
> value for your specific arch and uses that in interpreting various
> entries in /proc.  He had a patch that kept the userspace view
> consistent.  That was 2.4 though; maybe 2.5 is better in this respect.

Hm, I'm not sure we really broke something, we added the lines marked=20
'->':

#ifdef __KERNEL__
-># ifdef CONFIG_PA20
->#  define HZ            1000            /* Faster machines */
-># else
#  define HZ            100             /* Internal kernel timer=20
frequency */
-># endif
# define USER_HZ        100             /* .. some user interfaces are=20=

in "ticks
" */
# define CLOCKS_PER_SEC (USER_HZ)       /* like times() */
#endif

#ifndef HZ
#define HZ 100
#endif

As you can see, these defines are protected by a #ifdef __KERNEL__,=20
otherwise HZ is 100 in all cases. Since userspace stuff isn't supposed=20=

to define __KERNEL__ at compile time, HZ from a userspace point of view=20=

hasn't changed.

If you look at other archs (like i386, ppc64) they also have different=20=

HZ vs USER_HZ and *__KERNEL__* HZ.

In 2.4, there wasn't such #ifdef protection, so such change could have=20=

broken things.
In 2.5, I think this is quite safe IMHO.

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/=
