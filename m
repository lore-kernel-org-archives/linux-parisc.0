Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gremg1.net.external.hp.com (grenmg1.net.external.hp.com [155.208.254.57])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5FACD4A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Mar 2001 03:07:19 -0700 (MST)
Received: from concerto.grenoble.hp.com (concerto.grenoble.hp.com [15.128.15.118])
	by gremg1.net.external.hp.com (Postfix) with ESMTP id 2081231E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Mar 2001 11:07:03 +0100 (MET)
Received: from debian.grenoble.hp.com (debian.grenoble.hp.com [15.128.129.155])
	by concerto.grenoble.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit6.0.6 OpenMail) with ESMTP id LAA05820
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Mar 2001 11:06:57 +0100 (MET)
Received: from thomas by debian.grenoble.hp.com with local (Exim 3.22 #1 (Debian))
	id 14gOT5-0007gp-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Mar 2001 11:06:51 +0100
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Interoperability
References: <200103230054.RAA24759@puffin.external.hp.com>
From: Nicolas THOMAS <thomas@ispserv.grenoble.hp.com>
Date: 23 Mar 2001 11:06:50 +0100
In-Reply-To: <200103230054.RAA24759@puffin.external.hp.com>
Message-ID: <o051yrobxz9.fsf@debian.grenoble.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Nicolas THOMAS <thomas@debian.grenoble.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler <grundler@puffin.external.hp.com> writes:

> Nicolas THOMAS wrote:
> > Does anyone of you have references/URL/opinion.... on interoperabilty
> > purpose?
> 
> Could you provide details on what you mean by "interoperability"?
> (Or specific applications that you need to run if you don't need
> to build them from scratch)

The main goal is to be able to have a back-end on one host and a front-end 
on the other. Communication is done with the network (sockets).



> 
> > The systems I would like to be able to interoperate are :
> > - Linux x86
> > - Linux PA-risc 32bits
> > - Linux PA-risc 64bits
> > - HP-UX 11 64bits
> 
> Obviously not all four can run the same application binaries.
Of course :-)

Thanks for your help.

Nicolas
