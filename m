Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 42617482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 09:13:28 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: H_Aue@t-online.de (Hinrich Aue),
	"parisc-linux" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] DSL on a 715/80 with rp-pppoe
Date: Sat, 29 Dec 2001 17:10:47 +0100
References: <16KKs9-1CicwSC@fwd05.sul.t-online.com>
In-Reply-To: <16KKs9-1CicwSC@fwd05.sul.t-online.com>
MIME-Version: 1.0
Message-Id: <200112291710.47812.deller@gmx.de>
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

> Q:
> Does anybody know why:
> "read /dev/ppp: Resource temporarily unavailable"
> and
> "kernel does not support PPP filtering" ?
> What the hell is PPP filtering? Do I have to activate it in the Kernel?

Just a suggestion: Networking Options -> Socket Filtering (CONFIG_FILTER).
This is not enabled by default.

Helge
