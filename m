Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id EEC1F482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 08:59:53 -0700 (MST)
Date: Sat, 29 Dec 2001 16:59:42 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Hinrich Aue <H_Aue@t-online.de>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
	Grant Grundler <grundler@dsl2.external.hp.com>
Subject: Re: [parisc-linux] DSL on a 715/80 with rp-pppoe
In-Reply-To: <16KKs9-1CicwSC@fwd05.sul.t-online.com>
Message-ID: <Pine.LNX.4.43.0112291658220.20276-100000@alpha.bocc.de>
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

Hi Hinrich,

> rcvd [LCP ConfReq id=0x66 <mru 1492> <auth pap> <magic 0x3ddff70f>]
> sent [LCP ConfRej id=0x66 <auth pap>]

You reject to identify yourself. Is your userid / password setup 
correctly in /etc/ppp/pap-secrets?

Cheers,
Jochen
