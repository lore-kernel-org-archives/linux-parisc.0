From: Graham Gower <graham.gower@gmail.com>
Subject: Re: failure to link kernel 3.0.3 with cross binutils-2.21.1/gcc-4.6.1
Date: Wed, 14 Sep 2011 11:14:43 +0930
Message-ID: <CAFk90B-FxDH8TMFq92reOjMs-hdGC0k-orGhgyAck6Q4P9EBNQ@mail.gmail.com>
References: <CAFk90B8F17-o3HqRGygu8OUb-Ncurqi-Ui+_u9kfaqmQG5nK4Q@mail.gmail.com>
	<4E6F60D9.5030203@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E6F60D9.5030203@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 13 September 2011 23:25, John David Anglin <dave.anglin@bell.net> wrote:
> If this is a 22-bit call, then you will have to remove some stuff from your
> .config.
> Maybe use more modules.

It was a 22 bit call and cutting down my config made it link. Thanks.

-Graham
