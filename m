Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout02.sul.t-online.com (mailout02.sul.t-online.com [194.25.134.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id A2CFA482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Dec 2001 05:02:36 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: H_Aue@t-online.de (Hinrich Aue)
To: Jochen Friedrich <jochen@scram.de>
Subject: [parisc-linux] DSL on a 715/80 with rp-pppoe
Date: Sun, 30 Dec 2001 13:06:14 +0100
References: <Pine.LNX.4.43.0112291700110.20276-100000@alpha.bocc.de>
In-Reply-To: <Pine.LNX.4.43.0112291700110.20276-100000@alpha.bocc.de>
Cc: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Message-ID: <16KefW-21OIi0C@fwd05.sul.t-online.com>
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

Am Samstag, 29. Dezember 2001 17:08 schrieben Sie:
> Hi Hinrich,
>
> > rcvd [LCP ConfReq id=0x66 <mru 1492> <auth pap> <magic 0x3ddff70f>]
> > sent [LCP ConfRej id=0x66 <auth pap>]
>
> I guess you use T-Online (TDSL flatrate?). In this case make sure you
> place the userid in /etc/ppp/pap-secrets in single quotes or the # will be
> treated as a start of comment:
>
> 'AAAAAAAAAAAATTTTTTTTTTTT#0001@t-online.de'     *       PPPPPPP        *
>
> Of course you must replace the A, T and P with the data you got from
> t-online.
>
> Cheers,
> Jochen

I have tried the syntax you told me, but, I still reject to <auth pap>.
This is strange, couse I think that I reject to auth myself.
"sent [LCP ConfRej id=0x66 <auth pap>]"
 So this must be a config Problem. Do I have to put something else into my 
pap-secrets?
I don't think that auth fails, but somethings wrong with my pap-secrets.
