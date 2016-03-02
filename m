From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/6] rtc: generic: allow building on all architectures
Date: Wed, 02 Mar 2016 10:05:18 +0100
Message-ID: <1620536.OtjnSSLgCT@wuerfel>
References: <1456851608-3374907-1-git-send-email-arnd@arndb.de>
 <1456851608-3374907-2-git-send-email-arnd@arndb.de>
 <CAMuHMdW5+jZ1n9WnCwBrGSGjUa8ziNTTqf-H15EFTQC_iwnw+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: Alessandro Zummo <a.zummo@towertech.it>,
 Parisc List <linux-parisc@vger.kernel.org>,
 RTCLINUX <rtc-linux@googlegroups.com>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kyle McMartin <kyle@mcmartin.ca>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdW5+jZ1n9WnCwBrGSGjUa8ziNTTqf-H15EFTQC_iwnw+Q@mail.gmail.com>
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org

On Wednesday 02 March 2016 09:57:27 Geert Uytterhoeven wrote:
> > @@ -33,13 +35,21 @@ static const struct rtc_class_ops generic_rtc_ops = {
> >         .read_time = generic_get_time,
> >         .set_time = generic_set_time,
> >  };
> > +#else
> > +#define generic_rtc_ops *(struct rtc_class_ops*)NULL
> > +#endif
> >
> >  static int __init generic_rtc_probe(struct platform_device *dev)
> >  {
> >         struct rtc_device *rtc;
> > +       const struct rtc_class_ops *ops;
> > +
> > +       ops = dev_get_platdata(&dev->dev);
> > +       if (!ops)
> > +               ops = &generic_rtc_ops;
> 
> I hope no compiler version treats "&*(struct rtc_class_ops*)NULL" as
> undefined behavior?

It's a bit odd, but I think it's syntactically correct C, and not
much too different from 

#define offsetof(TYPE, MEMBER)  ((size_t)&((TYPE *)0)->MEMBER)

is it? My last patch gets rid of it again.

	Arnd
