Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 93E114832
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Jun 2002 00:46:48 -0600 (MDT)
To: Jeremy Drake <jeremyd@apptechsys.com>
Subject: Re: [parisc-linux] CVS kernel broken?
Message-ID: <1025160385.3d1ab4c1b6078@webmail.tiscalinet.be>
Date: Thu, 27 Jun 2002 08:46:25 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
References: <Pine.LNX.4.44.0206262237000.17764-100000@garibaldi.apptechsys.com>
In-Reply-To: <Pine.LNX.4.44.0206262237000.17764-100000@garibaldi.apptechsys.com>
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

Quoting Jeremy Drake <jeremyd@apptechsys.com>:

> I am unable to build the current cvs kernel.  make oldconfig says 
> scripts/Configure: drivers/hil/Config.in: No such file or directory
> make[1]: *** [oldconfig] Error 1
> 
> and make menuconfig says 
> Preparing scripts: functions, parsingscripts/Menuconfig: line 1: 10304 
> Segmentation fault      awk "$1"
> Awk died with error code 139. Giving up.
> ...
> 
> Is this just me, or is there some problem I don't know about?
> 

No problem for me.
Do you try "make distclean" before oldconfig?

Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
