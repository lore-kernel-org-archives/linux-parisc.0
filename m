Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 727ED482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Aug 2002 07:13:55 -0600 (MDT)
Date: Mon, 26 Aug 2002 09:11:34 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: christian@familieschmitt.de
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Woody and new kernel
Message-ID: <20020826131134.GD30545@systemhalted>
References: <3D6A1F11.1050609@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D6A1F11.1050609@gmx.de>
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

> Hi,
> 
> i am using a 710 here (quite old, but interesting) with Woody installed. 
> Since it has the 2.4.17-32 kernel supplied, I would like to update it to 
> 2.4.19. I downloaded the vanilla kernel sources but it does not compile 
> with the gcc-3.0.4. Do I have to use the special -pa kernel from cvs or 
> should it also work with the normal kernel sources? The main reason for 
> this update is to get the HIL mouse working.
> 
> Chris
>

A vanilla kernel is not quite up to date :)

The best source for the most recent changes is:
http://cvs.parisc-linux.org

You can get instructions on CVS downloading/building from:
http://www.parisc-linux.org/kernel/index.html

Cheers,
Carlos.
