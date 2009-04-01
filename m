From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: kernel/traps.c PARISC_BUG_BREAK_INSN undeclared
Date: Wed, 1 Apr 2009 20:42:31 +0400
Message-ID: <a4423d670904010942w1144327cm1ac3688b5122a397@mail.gmail.com>
References: <a4423d670903250702k2e5d803jb2caf9f9752f1e0a@mail.gmail.com>
	 <20090325140909.GF19208@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090325140909.GF19208@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

2009/3/25 Kyle McMartin <kyle@mcmartin.ca>:
> On Wed, Mar 25, 2009 at 05:02:21PM +0300, Alexander Beregalov wrote:
>> arch/parisc/kernel/traps.c: In function 'handle_break':
>> arch/parisc/kernel/traps.c:321: error: 'PARISC_BUG_BREAK_INSN'
>> undeclared (first use in this function)
>>
>> # CONFIG_BUG is not set
>> CONFIG_EMBEDDED=3Dy
>>
>> Is it a reasonable config?
>
> imho, no.
>
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index aacf11d..efac22a 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -12,6 +12,7 @@ config PARISC
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select RTC_CLASS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select RTC_DRV_PARISC
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select INIT_ALL_POSSIBLE
> + =C2=A0 =C2=A0 =C2=A0 select BUG
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The PA-RISC microprocessor is desig=
ned by Hewlett-Packard and used
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in many of their workstations & ser=
vers (HP9000 700 and 800 series,
>
It still fails.
Could you please add it to your branch.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
