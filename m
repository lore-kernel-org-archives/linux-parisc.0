Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0F1B482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 12:08:36 -0700 (MST)
Date: Tue, 15 Jan 2002 20:07:55 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Randolph Chung <randolph@tausq.org>
Cc: linux-tr@linuxtr.net,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] IBM TR patch
In-Reply-To: <20020115181158.GT3247@tausq.org>
Message-ID: <Pine.LNX.4.43.0201152004580.11606-100000@alpha.bocc.de>
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

Hi Randolph,

> I suspect your patch will break the driver on PCI devices...
> (assuming there are both PCI and [E]ISA versions of the device that
> share the same driver).

Nope, it's ISA and PCMCIA only. And LE stays LE on PCI devices, as well.

--jochen
