Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (d208.dhcp212-198-140.noos.fr [212.198.140.208])
	by dsl2.external.hp.com (Postfix) with ESMTP id 217FB4831
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Oct 2002 05:28:16 -0600 (MDT)
Date: Fri, 11 Oct 2002 13:28:11 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Cc: q-funk@pp.fishpool.fi, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] hardware features of 712-60 ?
Message-Id: <20021011132811.6e84c1d8.varenet@esiee.fr>
In-Reply-To: <Pine.LNX.4.21.0210111227030.24681-100000@hal.pp.fishpool.fi>
References: <02Oct11.113022cest.119055@ns.hiscom.nl>
	<Pine.LNX.4.21.0210111227030.24681-100000@hal.pp.fishpool.fi>
Mime-Version: 1.0
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

On Fri, 11 Oct 2002 12:34:43 +0300 (EEST)
"Martin-" <q-funk@pp.fishpool.fi> wrote:

> On Fri, 11 Oct 2002, "Beerse, Corné" wrote:
> 
> > > At this point, I apt-got kernel-source-2.4.19-hppa and 
> > > unpacked it, and already
> > > selected the 7100LC/7300LC CPU option.  What else?  Has 
> > > anybody compiled a FAQ
> > > on parisc-linux that provides .config files optimized for 
> > > each PA-RISC hardware
> > > or, alternately, a checklist of hardware one finds in product 
> > > xxx, referenced by
> > > Linux kernel feature or module name? 
Well, as for any kind of 'PC' box, a quick look at lspci output, and even more at 'dmesg', will tell you everything you need to know.

> > 
> > Have you checked the hardware database on the website?
> > (http://www.parisc-linux.org/) That gives an overview on what whas in the
> > origional box.
> 
> http://hwdb.parisc-linux.org/view.php3?type=machine&name=712%2F60
> 
> That page could have been written in Chinese, it would have been equally clear.  
> if
> you have graphics card XXX select the driver with the same name". I've
> chip does what, as every line in that page starts with Gecko.
Did you notice that each chip is labelled with its driver name ?
See, the text between '()' at the end of each line ?

I wonder if we should make it bold, or maybe flashing ? :o)

A last point, subscribing to this mailing-list would be a good idea, or at least taking a look at archives. You would have then noticed that the last version of the PA-RISC/Linux Boot HOWTO has been released about 4 days ago, giving you many useful tips about kernel compiling...
http://pateam.esiee.fr/doc.html
http://lists.parisc-linux.org/pipermail/parisc-linux/

Hope that helps,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
