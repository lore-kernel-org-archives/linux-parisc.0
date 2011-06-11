From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc, don't claim cpu irqs more than once
Date: Sat, 11 Jun 2011 16:56:46 -0400
Message-ID: <20110611205646.GA26431@hiauly1.hia.nrc.ca>
References: <20110611185524.GA1369@hiauly1.hia.nrc.ca> <1617203.1AoiWjTfrU@donald.sf-tec.de>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org, kyle@mcmartin.ca, deller@gmx.de,
	jejb@parisc-linux.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1617203.1AoiWjTfrU@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 11 Jun 2011, Rolf Eike Beer wrote:

> >         int i;
> > +#ifdef CONFIG_SMP
> > +       static int irqs_claimed;
> > +       if (irqs_claimed)
> > +               return;
> > +       irqs_claimed = 1;
> > +#endif
> 
> Shouldn't this be bool then? Now that we have it.

Yes but I would like to here with this approach is acceptable.  Another
alternative might be a function init_IRQ_SMP that doesn't call claim_cpu_irqs.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
