Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34920482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Dec 2001 10:53:04 -0700 (MST)
Message-Id: <200112131746.KAA20378@puffin.external.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: mkp@mkp.net (Martin K. Petersen),
	parisc-linux@lists.parisc-linux.org (palinux)
Subject: Re: [parisc-linux] C160 STI console woes 
In-Reply-To: Message from Alan Cox <alan@lxorguk.ukuu.org.uk>
   of "Thu, 13 Dec 2001 01:33:05 GMT." <E16EKkD-0003Dp-00@the-village.bc.nu>
Date: Thu, 13 Dec 2001 10:46:52 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Alan Cox wrote:
> > And I have yet to see a PCI graphics board with universal/3.3V
> > connector.  Except for HP ones, that is.
> 
> You want 5v for the fan 8(

I'm told the "3.3v" vs "5v" only indicates which voltage is
used for signalling - not which power rail the card is using.
Some 3.3v cards pull power from the 5v rail and convert it to 3.3v
in order to get a "cleaner" or more accurate 3.3v than what
the PCI Spec (and some vendors) provides.

And for PCI 2.1, 3.3v power rail is optional.
That turned into a requirement for PCI 2.2 compliance.

(Caveat: this is all second hand info - I'm a SW dork - not HW eng.
  but I believe it's correct.)

grant
