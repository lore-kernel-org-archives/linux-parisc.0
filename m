Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB1C6482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 09:09:01 -0700 (MST)
Date: Sat, 29 Dec 2001 17:08:52 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Hinrich Aue <H_Aue@t-online.de>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
	Grant Grundler <grundler@dsl2.external.hp.com>
Subject: Re: [parisc-linux] DSL on a 715/80 with rp-pppoe
In-Reply-To: <16KKs9-1CicwSC@fwd05.sul.t-online.com>
Message-ID: <Pine.LNX.4.43.0112291700110.20276-100000@alpha.bocc.de>
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

I guess you use T-Online (TDSL flatrate?). In this case make sure you 
place the userid in /etc/ppp/pap-secrets in single quotes or the # will be 
treated as a start of comment:

'AAAAAAAAAAAATTTTTTTTTTTT#0001@t-online.de'     *       PPPPPPP        *

Of course you must replace the A, T and P with the data you got from 
t-online.

Cheers,
Jochen
