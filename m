Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hermes.fachschaften.tu-muenchen.de (hermes.fachschaften.tu-muenchen.de [129.187.176.19])
	by dsl2.external.hp.com (Postfix) with SMTP id D0F75482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 10:16:18 -0600 (MDT)
Date: Wed, 29 May 2002 18:16:17 +0200 (CEST)
From: Andreas Deresch <aderesch@fs.tum.de>
Reply-To: Andreas Deresch <aderesch@fs.tum.de>
To: Matthew Wilcox <willy@debian.org>
Cc: marc <marc@centraltx.com>, <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Java and SSH
In-Reply-To: <20020529170802.R10366@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.NEB.4.44.0205291813260.25776-100000@tethys.fachschaften.tu-muenchen.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 29 May 2002, Matthew Wilcox wrote:

> On Wed, May 29, 2002 at 11:04:58AM -0500, marc  wrote:
> >
> > >Check for OpenSSH, I'm pretty sure it's part of the compiled
> > >packages.  As for Java, I'm pretty sure there is no pre-compiled form
> > >for HPPA, but you can try to compile it, or try Kaffe
> > >Aaron
> >
> > `apt-cache search ssh` returns nothing.
> >
> > Any other ideas?
>
> try an apt-get update first?
ssh is in non-US isn't it? If there is no line like

deb ftp://ftp.de.debian.org/debian-non-US unstable/non-US main
(change for your favourite server, protocol, etc.)

in /etc/apt/sources.list, that won't do anything.

ad
