From: anton.wuerfel@fau.de
Subject: Re: [PATCH 08/11] tty: serial: 8250: Add parentheses to macro
Date: Fri, 18 Dec 2015 12:36:36 +0100
Message-ID: <99efe3549ef3d0b399b78b2f8f66947c.squirrel@faumail.uni-erlangen.de>
References: <1450280177-4460-1-git-send-email-anton.wuerfel@fau.de>
    <1450280177-4460-9-git-send-email-anton.wuerfel@fau.de>
    <1450365401.30729.142.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-kernel@i4.cs.fau.de, anton.wuerfel@fau.de,
	phillip.raffeck@fau.de
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1450365401.30729.142.camel@linux.intel.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Andy,

> What about the rest of the drivers under drivers/tty/serial?
>
> What do you propose to do with, for example, the following
>
> drivers/tty/serial/cpm_uart/cpm_uart_core.c:1392:#define
> CPM_UART_CONSOLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&cpm_scc_ua=
rt_console
> drivers/tty/serial/cpm_uart/cpm_uart_core.c:1394:#define
> CPM_UART_CONSOLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL
>
>> =C2=A0#else
>> =C2=A0#define SERIAL8250_CONSOLE	NULL
>> =C2=A0#endif
>

thanks for your reply. Phillip and me are newcomers to kernel developme=
nt,
so we tried to touch as few files as possible and gain some experience =
in
creating patches and communication on LKML. We will consider sending
further patches in the future.

Regards,
Phillip Raffeck
Anton Wuerfel

> --
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Intel Finland Oy
>
>


--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
