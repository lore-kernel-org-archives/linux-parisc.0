Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-1.gci.net (mta-1.gci.net [208.138.130.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63CE0482A
	for <parisc-linux@parisc-linux.org>; Wed, 19 Dec 2001 19:41:14 -0700 (MST)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-1.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GOMFGO02.PJM for
          <parisc-linux@parisc-linux.org>; Wed, 19 Dec 2001 17:41:12 -0900
Date: Wed, 19 Dec 2001 17:38:56 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] LibC errors on C180 install 
In-Reply-To: <20011219200133.8E40A482A@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.33.0112191720550.1930-100000@goliath.alaskatech.org>
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

> Tom wrote:
> > I had a segfault in the base-config, which bombed the rest of the install.

> Grant:
> "debsums -s" will tell you which packages got corrupted during install.
> Sounds like you could mount the CD and "dpkg -i" the base packages again.
> Then run apt-get update/dist-upgrade.

debsums came back with an all-OK, I could install anything unless it
needed a libc6 update, in which case it failed.

Since this was a brand-new install, I used the prior palo options to
disable everything 'good' on the FWSCSI, then reinstalled. Everything so
far has worked perfectly...

I guess this was just "gremlins" :-)
