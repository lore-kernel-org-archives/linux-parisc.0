Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2586F482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 07:00:12 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17Fws6-0000sV-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 06 Jun 2002 14:00:10 +0100
Date: Thu, 6 Jun 2002 14:00:06 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Probleme while compiling last CVS kernel.
Message-ID: <20020606130006.GE1080@tykepenguin.com>
References: <3CFF593A.18910E50@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <3CFF593A.18910E50@admin.france.hp.com>
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

On Thu, Jun 06, 2002 at 02:44:42PM +0200, Bruno Vidal wrote:
> 	Hi
> I've started this morning to download latest CVS bits.
> I've prepared a patche for this version from my dump driver,
> and try to recompile everything, but I've found a problem
> with LVM !!! See:


Does LVM work on 64bit HP ?

I remember doing the ioctl32.c support for sparc64 some time ago but I can
easily beleive that the mods to that file haven't been propogated to other
32/64bit systems - if you're feeling adventurous and really need LVM then you
might be able to cut out those bits and drop them into the HP.

On the other hand you could try LVM2. I know LVM2 runs well on my 32bit HP
machines and also on 64bit Alpha.

patrick
