Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3CFAA4840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 19:43:41 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AN1Gl-0001RX-K0; Fri, 21 Nov 2003 02:43:39 +0000
Date: Fri, 21 Nov 2003 02:43:39 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [BUG] dcopserver: ICE Connection rejected!
Message-ID: <20031121024339.GR30485@parcelfarce.linux.theplanet.co.uk>
References: <20031121005838.GC13007@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031121005838.GC13007@colo.lackof.org>
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

On Thu, Nov 20, 2003 at 05:58:38PM -0700, Grant Grundler wrote:
> A few days ago, after an apt-get upgrade, konqueror wouldn't properly
> start anymore. Error output is:
> grundler@debian:~$ konqueror 
> _KDE_IceTransmkdir: Owner of /tmp/.ICE-unix should be set to root
> ICE Connection rejected!

The obvious question ... what're the ownership/permissions on
your /tmp/.ICE-unix?  Mine are:

drwxrwxrwt    2 root     root         4096 Nov  9 18:24 .ICE-unix

Inside it, I have:

srwxrwxrwx    1 willy    willy           0 Nov  9 18:24 578

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
