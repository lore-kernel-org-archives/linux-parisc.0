From: Sasha Levin <Alexander.Levin@microsoft.com>
Subject: Re: [PATCH AUTOSEL for 4.15 118/124] signal/parisc: Document a
 conflict with SI_USER with SIGFPE
Date: Wed, 21 Mar 2018 18:18:44 +0000
Message-ID: <20180321181842.rhniantbvz25bu2f@sasha-lappy>
References: <20180319154645.11350-1-alexander.levin@microsoft.com>
 <20180319154645.11350-118-alexander.levin@microsoft.com>
 <87zi327ozu.fsf@xmission.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <87zi327ozu.fsf@xmission.com>
List-ID: <linux-parisc.vger.kernel.org>

Hey Eric,

On Tue, Mar 20, 2018 at 10:20:21AM -0500, Eric W. Biederman wrote:
>Sasha Levin <Alexander.Levin@microsoft.com> writes:
>
>What is the justification for backporting this and the other similar
>Documentation commits?

It was flagged as a bug fixing patch by a new process we're testing, and
when I looked at it I thought that the commit message suggests it fixes
an ABI issue.

>These commits just introduce a define _FIXME with value of 0, to
>document that the userspace ABI was handled incorrectly long ago.
>
>These commits do not fix anything.  Thes commits do not change anything
>except a little how they are handled in siginfo_layout.  And I don't see
>the changes that introduce siginfo_layout in kernel/signal.c being
>backported.
>
>Further these commits don't even have a fixes tag so I am curious
>what is triggering them for backport.

We're testing out a new mechanism where we train a neural network to
detect bug fixing patches and flag them for manual review. We're working
on a FAQ + more detailed information right now.

>Eric
>
>> From: "Eric W. Biederman" <ebiederm@xmission.com>
>>
>> [ Upstream commit b5daf2b9d1c9a2b4f03ca93f75913ba2da3b3eaa ]
>>
>> Setting si_code to 0 results in a userspace seeing an si_code of 0.
>> This is the same si_code as SI_USER.  Posix and common sense requires
>> that SI_USER not be a signal specific si_code.  As such this use of 0
>> for the si_code is a pretty horribly broken ABI.
>>
>> Further use of si_code =3D=3D 0 guaranteed that copy_siginfo_to_user saw=
 a
>> value of __SI_KILL and now sees a value of SIL_KILL with the result
>> that uid and pid fields are copied and which might copying the si_addr
>> field by accident but certainly not by design.  Making this a very
>> flakey implementation.
>>
>> Utilizing FPE_FIXME siginfo_layout will now return SIL_FAULT and the
>> appropriate fields will reliably be copied.
>>
>> This bug is 13 years old and parsic machines are no longer being built
>> so I don't know if it possible or worth fixing it.  But it is at least
>> worth documenting this so other architectures don't make the same
>> mistake.
>>
>> Possible ABI fixes includee:
>>   - Send the signal without siginfo
>>   - Don't generate a signal
>>   - Possibly assign and use an appropriate si_code
>>   - Don't handle cases which can't happen
>>
>> Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: linux-parisc@vger.kernel.org
>> Ref: 313c01d3e3fd ("[PATCH] PA-RISC update for 2.6.0")
>> Histroy Tree: https://na01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftglx%2Fhistory=
.git&data=3D04%7C01%7CAlexander.Levin%40microsoft.com%7C3dfe7dd42625456fdb0=
f08d58e7639e6%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C1%7C6365715607897505=
33%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwifQ%3D%3D%7C-1&sdata=3DlXlraRxI0IHdS736PA%2BLO8A4JQJveGitz1pPfpo7QKM%3D&=
reserved=3D0
>> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
>> Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
>> ---
>>  arch/parisc/include/uapi/asm/siginfo.h | 7 +++++++
>>  arch/parisc/kernel/traps.c             | 2 +-
>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/parisc/include/uapi/asm/siginfo.h b/arch/parisc/includ=
e/uapi/asm/siginfo.h
>> index 4a1062e05aaf..be40331f757d 100644
>> --- a/arch/parisc/include/uapi/asm/siginfo.h
>> +++ b/arch/parisc/include/uapi/asm/siginfo.h
>> @@ -8,4 +8,11 @@
>>
>>  #include <asm-generic/siginfo.h>
>>
>> +/*
>> + * SIGFPE si_codes
>> + */
>> +#ifdef __KERNEL__
>> +#define FPE_FIXME	0	/* Broken dup of SI_USER */
>> +#endif /* __KERNEL__ */
>> +
>>  #endif
>> diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
>> index 8453724b8009..c919e6c0a687 100644
>> --- a/arch/parisc/kernel/traps.c
>> +++ b/arch/parisc/kernel/traps.c
>> @@ -629,7 +629,7 @@ void notrace handle_interruption(int code, struct pt=
_regs *regs)
>>  			si.si_signo =3D SIGFPE;
>>  			/* Set to zero, and let the userspace app figure it out from
>>  			   the insn pointed to by si_addr */
>> -			si.si_code =3D 0;
>> +			si.si_code =3D FPE_FIXME;
>>  			si.si_addr =3D (void __user *) regs->iaoq[0];
>>  			force_sig_info(SIGFPE, &si, current);
>>  			return;

--=20

Thanks,
Sasha=
