Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id EDAF84A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Feb 2001 03:01:02 -0700 (MST)
Sender: delahaym@esiee.fr
Message-ID: <3A9A295A.60A9E4D8@esiee.fr>
Date: Mon, 26 Feb 2001 11:00:58 +0100
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Unregister driver patch
References: <200102260530.VAA23229@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> 
> Hi Matthieu,
> Ok. I lied. One more issue with the patch in register_pa_dev().
> 
> Matthieu Delahaye wrote:
> > @@ -145,16 +187,16 @@
> >  {
> >       struct pa_iodc_driver *driver = pa_drivers;
> >
> > -     while ((0 == hp_dev->managed) && (NULL != driver)) {
> > +     while ((NULL == hp_dev->driver) && (NULL != driver)) {
> >
> >               if (compare_spec(hp_dev,driver))
> > -                     hp_dev->managed =
> > -                             ((*driver->callback)(hp_dev,driver) == 0);
> > +                     hp_dev->driver =
> > +                             (((*driver->callback)(hp_dev,driver) == 0)?driv
> >   er:NULL);
> >
> >               driver = driver->next;
> >       }
> >
> > -     return hp_dev->managed;
> > +     return (hp_dev->driver==driver);
> 
> In the case a device is managed,  "driver" points to "->next" after
> we exit the loop and we end up returning false.  Right?
> 
> I think "return (NULL != hp_dev->driver)" is the correct code.
> 
You're right. I couldn't test this function because I didn't find a way
to add devices only after some drivers were already registered.

Matthieu

> grant
> 
> Grant Grundler
> parisc-linux {PCI|IOMMU|SMP} hacker
> +1.408.447.7253
