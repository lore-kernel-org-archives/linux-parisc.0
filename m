Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e146.dhcp212-198-142.noos.fr [212.198.142.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2DF14829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 13:25:12 -0700 (MST)
Received: from Tatooine (varenet@Tatoine [192.168.69.3])
	by mail.zigoo.net (8.12.5/8.12.1) with SMTP id h0AKPAiL001249
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 21:25:11 +0100
Date: Fri, 10 Jan 2003 23:25:10 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] unaligned accesses
Message-Id: <20030110232510.25aef7c2.varenet@esiee.fr>
In-Reply-To: <20030110231313.1215dc79.varenet@esiee.fr>
References: <20030110170813.X26554@parcelfarce.linux.theplanet.co.uk>
	<3E1AA8D500000AF7@ocpmta8.freegates.net>
	<20030110231313.1215dc79.varenet@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 10 Jan 2003 23:13:13 +0100
"Thibaut VARENE" <varenet@esiee.fr> wrote:

I hate to reply to myself but I said crap in my previous mail.
All apologies:
> FWIW, the default option (used by most people) is data=journal, and is not affected by that bug. We've been using 2.4.20 with ext3 for weeks pretty safely here.
it was: "the default option is data=ordered" of course, which is safe.

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
