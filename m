Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id DFE034829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Jun 2003 07:08:21 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h5MAqQRQ011480;
	Sun, 22 Jun 2003 11:52:27 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h5MAqLMK011478;
	Sun, 22 Jun 2003 11:52:21 +0100
Subject: Re: [parisc-linux] ARP resolution trouble
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: baddy@free.fr
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <yam9303.300.149243336@esteban.rebellion>
References: <yam9303.300.149243336@esteban.rebellion>
Content-Type: text/plain
Message-Id: <1056279139.2075.6.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 22 Jun 2003 11:52:21 +0100
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

On Sul, 2003-06-22 at 09:17, baddy@free.fr wrote:
>     - this request is not see at all by the B132L which already have the
>     mac address of the host in his mac address table (I think it is because
>     the B132L keep it from a previous trafic).

Sounds like you have a buggy bridge somewhere. Some vendors can't read
the specs and drop rather than flood unknown mac addresses. This breaks
stuff just as you describe.
