Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA06025
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 18:34:59 -0600
Message-Id: <5.0.0.25.0.20001026173406.037ca150@mail.webcash.com>
Date: Thu, 26 Oct 2000 17:34:22 -0700
To: Alan Modra <alan@linuxcare.com.au>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] glibc problem
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0010270955420.1135-100000@front.linuxcare.co
 m.au>
References: <5.0.0.25.0.20001026125217.00a43eb0@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

Yes the line is there.

At 10:03 AM 10/27/00 +1100, Alan Modra wrote:
>On Thu, 26 Oct 2000, Kailashnath V Rampure wrote:
>
> > I did upgrade to latest glibc from the cvs and tried I still get the same
> > error.
>
>Did you upgrade from the CVS repository on puffin.external.hp.com?  Please
>check glibc/csu/Makefile.  Starting at line 160, you should see
>
>$(addprefix $(objpfx),$(filter-out $(start-installed-name),$(csu-dummies))):
>         @-rm -f $(@:.o=.c)
>         echo > $(@:.o=.c)
>         $(COMPILE.c) $(@:.o=.c) $(OUTPUT_OPTION)
>         rm -f $(@:.o=.c)
>
>--
>Linuxcare.  Support for the Revolution.
>
>---------------------------------------------------------------------------
>To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
>`unsubscribe' as the subject.
