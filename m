Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from esteban.rebellion (f11v-4-204.d1.club-internet.fr [213.44.163.204])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18C9D4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Jun 2003 15:14:59 -0600 (MDT)
Received: from x-plorer.rebellion
	([192.168.10.1] helo=rebellion ident=badmax)
	by esteban.rebellion with smtp (Exim 3.36 #1 (Debian))
	id 19Uv7x-00018m-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Jun 2003 23:14:57 +0200
From: Bad Max <badmax@club-internet.fr>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 24 Jun 2003 22:15:59 +0200
Message-ID: <yam9305.2982.147282904@esteban.rebellion>
In-Reply-To: <1056279139.2075.6.camel@dhcp22.swansea.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [parisc-linux] Re: ARP resolution trouble
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

Hello

On 22-juin-03, you wrote:

| > On Sul, 2003-06-22 at 09:17, baddy@free.fr wrote:
| >>    - this request is not see at all by the B132L which already have
| >> the
| >>    mac address of the host in his mac address table (I think it is
| >> because
| >>    the B132L keep it from a previous trafic).
| > 
| > Sounds like you have a buggy bridge somewhere. Some vendors can't read
| > the specs and drop rather than flood unknown mac addresses. This breaks
| > stuff just as you describe.
| > 

Thanks Alan it was effectively my Cabletron switch the faulty device. I
plugged
every host on a 3Com switch and everythink look good.

The most strange is that this switch was working perfectly for one year and
the
B132L was the only host affected by the bug (I never encountered this bug
with
the other host).
-------
Bad Max
========
Amiga User
GNU User
WWW: perso.club-internet.fr/badmax
