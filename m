From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] parisc: time: Convert read_persistent_clock() to read_persistent_clock64()
Date: Fri, 20 Apr 2018 17:23:55 +0200
Message-ID: <CAK8P3a0PWLG4XZEMU2XoYiKirdq1nnkOVTLyr=S59cxvNvHuTw@mail.gmail.com>
References: <4914b33abd8969906d2db0ae5c3da4f205f0bfe9.1524120572.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Baolin Wang <baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4914b33abd8969906d2db0ae5c3da4f205f0bfe9.1524120572.git.baolin.wang@linaro.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Apr 19, 2018 at 8:51 AM, Baolin Wang <baolin.wang@linaro.org> wrote:
> The read_persistent_clock() uses a timespec, which is not year 2038 safe
> on 32bit systems. On parisc architecture, we have implemented generic RTC
> drivers that can be used to compensate the system suspend time, but the
> RTC time can not represent the nanosecond resolution, so this patch just
> converts to read_persistent_clock64() with timespec64.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

I have created the exact same patch a while ago but never submitted that.

If the parisc maintainers want to apply yours with my Ack, that
would be appreciated.

Acked-by: Arnd Bergmann <arnd@arndb.de>
