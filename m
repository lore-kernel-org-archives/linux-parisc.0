Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 413A64838
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Apr 2004 03:30:07 -0600 (MDT)
Date: Tue, 27 Apr 2004 11:29:43 +0200
Message-ID: <408D43600000070F@ocpmta1.freegates.net>
In-Reply-To: <Pine.LNX.4.58.0404270915440.4406@sal.ucc.ie>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Linux-2.6.6-rc1-pa3 and Linux-2.6.6-rc2
To: "M. Grabert" <xam@cs.ucc.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


> The Changelog to 2.6.6-rc2 contains the following:

Well, I don't know about Matthew merge project but yesterday I apply the
upstream patch-2.6.6-rc1-rc2 (http://www.kernel.org/pub/linux/kernel/v2.6/testing/incr/patch-2.6.6-rc1-rc2.bz2)
against our pa tree and it is quiet straighforward (just have to redo by
hand the hunk related to arch/parisc/kernel/cache.c, very short and easy).

I boot it with success on my b180 :) (not yet on my b2k :( ) but I trust
you could try it also?

That said, knowing that my serial console works fine, there are two additional
hw pieces that you can try to remove one by one to locate accurately the
pb, though I don't have usb kbd/mouse to test)

hth,
    Joel




----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
