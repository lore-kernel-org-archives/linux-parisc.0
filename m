Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from jaguar.mkp.net (jaguar.mkp.net [66.11.169.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id 336B54829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Feb 2003 10:58:07 -0700 (MST)
To: baddy@free.fr
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B132L+ and PCI cards
From: "Martin K. Petersen" <mkp@mkp.net>
References: <yam9164.1199.146359312@mail.club-internet.fr>
Date: 03 Feb 2003 12:58:22 -0500
In-Reply-To: <yam9164.1199.146359312@mail.club-internet.fr>
Message-ID: <yq1smv5p7pd.fsf@austin.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>>>>> "baddy" == baddy  <baddy@free.fr> writes:

baddy> I've got a B132L+ with which I am trying to have a 16 ou 24
baddy> bits (better than the original 8-bits framebuffer mode) : I've
baddy> inserted a S3Trio64V2/DX based card but the B132L+ lock at
baddy> boot.

Unfortunately it seems that HP has a check in the firmware that only
allows booting with HP-branded graphics cards.

I have tried several brands in both C160 and C3000, and both machines
refuse to boot with non-HP graphics cards installed.

OTOH, the firmware appears fairly relaxed about unknown
SCSI/network/whatever cards.  It's only graphics.  Sadly :/

-- 
Martin K. Petersen	Wild Open Source, Inc.
mkp@wildopensource.com	http://www.wildopensource.com/
