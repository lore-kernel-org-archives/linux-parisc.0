Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA03399
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 17:01:51 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Oct 2000 23:03:20 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA01497;
	Fri, 27 Oct 2000 10:03:15 +1100
Date: Fri, 27 Oct 2000 10:03:15 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Kailashnath V Rampure <kailasr@webcash.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] glibc problem
In-Reply-To: <5.0.0.25.0.20001026125217.00a43eb0@mail.webcash.com>
Message-ID: <Pine.LNX.4.21.0010270955420.1135-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 26 Oct 2000, Kailashnath V Rampure wrote:

> I did upgrade to latest glibc from the cvs and tried I still get the same 
> error.

Did you upgrade from the CVS repository on puffin.external.hp.com?  Please
check glibc/csu/Makefile.  Starting at line 160, you should see

$(addprefix $(objpfx),$(filter-out $(start-installed-name),$(csu-dummies))):
	@-rm -f $(@:.o=.c)
	echo > $(@:.o=.c)
	$(COMPILE.c) $(@:.o=.c) $(OUTPUT_OPTION)
	rm -f $(@:.o=.c)

-- 
Linuxcare.  Support for the Revolution.
