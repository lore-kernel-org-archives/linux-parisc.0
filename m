From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] fix compile breakage caused by linux/smp.h header
 definition problem
Date: Wed, 23 Mar 2011 13:59:42 -0400
Message-ID: <AANLkTikw3VheuSuY5epDOa6TZViKw8Ev8whqahU6MECx@mail.gmail.com>
References: <1300893119.15899.15.camel@mulgrave.site> <20110323105031.8967ff2f.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@suse.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Amerigo Wang <amwang@redhat.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110323105031.8967ff2f.akpm@linux-foundation.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Mar 23, 2011 at 1:50 PM, Andrew Morton wrote:
> On Wed, 23 Mar 2011 10:11:58 -0500 James Bottomley wrote:
>> The problem is this:
>>
>> =A0 CC =A0 =A0 =A0arch/parisc/kernel/asm-offsets.s
>> In file included from include/linux/sched.h:71,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from arch/parisc/kernel/asm-offse=
ts.c:31:
>> include/linux/smp.h:117: error: expected '=3D', ',', ';', 'asm' or '=
__attribute__' before 'setup_nr_cpu_ids'
>> include/linux/smp.h:118: error: expected '=3D', ',', ';', 'asm' or '=
__attribute__' before 'smp_init'
>> =A0 HOSTLD =A0scripts/mod/modpost
>> make[1]: *** [arch/parisc/kernel/asm-offsets.s] Error 1
>>
>> It's caused by two __init attributes on function prototypes,
>
> Heiko sent a patch for this which adds the #include.

thanks, this broke Blackfin SMP too

>> which
>> shouldn't be there (__init should only mark functions not prototypes=
).
>
> Nope. =A0We've had build failures in the past (on arm) where the
> assembler generated a short-addressed branch to a function in the
> "same" section but the linker discovered that it was too far away,
> because the target landed in a different section.

another advantage is that for funcs which are defined in arch code,
putting the attributes on the prototype allow all the arches to get
the right markings without worrying about someone copying & pasting
wrongly.
-mike
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
