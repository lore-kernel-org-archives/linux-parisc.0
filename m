Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep11-int.chello.at (viefep11-int.chello.at [213.46.255.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77C8B4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Sep 2002 12:28:42 -0600 (MDT)
Message-ID: <3D974657.F355C89A@gmx.at>
Date: Sun, 29 Sep 2002 20:28:39 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Stephan <stephan@itp.bg>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Serial MUX
References: <20020929180739.27FFE4829@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii
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

Hello,

this driver is under development !
This driver can be used on machines having a non-supported
multi-serial interface like a E35/45/55 or some K-series
machines. 

The first and already tested driver is the PDC console
driver, to use only port-0 of the multi serial board
as console. Now an alternative native MUX driver 
is under development, but this driver can currently 
ONLY access port-0 (first port). The multi-line support
is not coded yet, and some short tests by me show
problems (machine hangs up !).

So you cannot access the multiple serial ports, so sorry.

Christoph P.


Stephan wrote:
> 
> Hello,
> i just compiled kernel with serial mux support
> how I can use it?
> how to create ttyB*?
> REgards
> 
> ________________________________________________
> This mail was sent by Godzilla 1.0
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
