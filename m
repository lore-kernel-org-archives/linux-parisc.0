Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26AED4835
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Apr 2002 07:42:35 -0600 (MDT)
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] gcc-3.2 experimental debs
Message-ID: <1019655726.3cc6b62e8fdcf@webmail.tiscalinet.be>
Date: Wed, 24 Apr 2002 15:42:06 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <3CC2B937.8020509@freebel.net> <20020421162538.G5225@parcelfarce.linux.theplanet.co.uk> <20020423111903.A8545@systemhalted> <1019582168.3cc596d87ba8a@webmail.tiscalinet.be> <20020423174758.C8545@systemhalted>
In-Reply-To: <20020423174758.C8545@systemhalted>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Quoting "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>:

> > 
> > Joel
> > 
> > PS1: about step 4.2 of your howto-xc, I notice a small difference
> between html
> > and pdf (in html you use gcc option "enable-shared" in pdf
> "disable-shared").
> > But this not the cause of the above problem.
> > 
> > PS2: I also make an apt-get dist-upgrade (with ftp.de.debian.org) so
> that native
> > gcc is now 3.0.4-5 (I think it was already installed last week)
> > 
> >
> 
> Both the HTML and PDF version are the same (just double checked).
> 
> http://www.baldric.uwo.ca/~carlos/HOWTO-Parisc/index.html
>
http://www.baldric.uwo.ca/~carlos/HOWTO-Parisc/HOWTO-Building_PARISC-LINUX_CrossCompiler.pdf
> 
> In section 4.2 you are bootstraping the C compiler without glibc
> so you must use --disable-shared.
> 
> In section 4.5 you have already built glibc and you can turn
> shared support back on with --enable-shared.
> 
> c.

Yes you have right (as it is my html which was wrong I do have forgot to
'reload' the page). Sorry for confusion.

Thanks also for explanation and attention.
    Joel

> 
> p.s. The HTML and PDF do have some formatting differences...
>      I'll get around to making them look similar later :}
>      Dang... just noticed I missed one of the path changes in
>      the pdf...
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
