Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from esteban.rebellion (f06a-1-118.d1.club-internet.fr [212.194.120.118])
	by dsl2.external.hp.com (Postfix) with ESMTP id D79CD4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Jun 2003 00:31:42 -0600 (MDT)
From: Bad Max <badmax@club-internet.fr>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
Date: Wed, 25 Jun 2003 07:32:40 +0200
Message-ID: <yam9306.2029.145319488@esteban.rebellion>
In-Reply-To: <1056490704.1223.12.camel@dhcp22.swansea.linux.org.uk>
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

On 24-juin-03, you wrote:

| > On Maw, 2003-06-24 at 21:15, Bad Max wrote:
| >> The most strange is that this switch was working perfectly for one year
| >> and the
| >> B132L was the only host affected by the bug (I never encountered this
| >> bug with
| >> the other host).
| > 
| > Most boxes have regular traffic - samba broadcasts, snmp probes, ipx
| > rip/sap whatever. 
| > 

The B132L is a PDC/DNS/DHCP/Router on my network. The other host are
mostly clients, no ipx, no snmp. DHCP requests were accepted and the
B132L was reachable until ARP timeout. 

The only thing I don't understand is why the B132L was the only host
affected by the trouble.
-------
Bad Max
========
Amiga User
GNU User
WWW: perso.club-internet.fr/badmax
