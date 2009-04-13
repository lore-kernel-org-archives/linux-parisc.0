From: Thibaut VARENE <varenet@parisc-linux.org>
Subject: Re: 2.6.30-rc1 hangs on boot
Date: Mon, 13 Apr 2009 17:44:49 +0200
Message-ID: <7d01f9f00904130844t435fa5e8xacde73f713df73b2@mail.gmail.com>
References: <20090411114219.GA14981@mayall.koti>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: jukka.taimisto@iki.fi
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090411114219.GA14981@mayall.koti>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Apr 11, 2009 at 1:42 PM, Jukka Taimisto
<jukka.taimisto@mail.suomi.net> wrote:
> Hi,
>
> It seems that almost every other boot with 2.6.30-rc1 my HP c3700 wit=
h
> single PA8700 (PCX-W2) 750MHz cpu hangs with following printed on ser=
ial
> console:

> [17179569.184000] timer_interrupt(CPU 0): delayed! cycles FFFFFFFFFFE=
494D4 rem 2A0894 =C2=A0next/now E004EEDA1/E00338275
> [6166094260.418448] timer_interrupt(CPU 0): delayed! cycles 15EA6E45D=
E rem 24C09E next/now E003740A1/23EAA5867F

I've seen that happening randomly on my A500 SMP 64bit, and it goes
way back with old kernels (2.6.19-ish, maybe even before). Very
random, but certainly not new.

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
