Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover (rover.mkp.net [209.217.122.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62A416029
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 18:17:43 -0700 (MST)
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: "James P. Kinney III" <jkinney@localnetsolutions.com>,
	palinux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C160 STI console woes
References: <200112130025.RAA12183@puffin.external.hp.com>
From: "Martin K. Petersen" <mkp@mkp.net>
Date: 12 Dec 2001 20:17:29 -0500
In-Reply-To: <200112130025.RAA12183@puffin.external.hp.com>
Message-ID: <yq1k7vrdil2.fsf@austin.mkp.net>
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

>>>>> "Grant" == Grant Grundler <grundler@puffin.external.hp.com> writes:

Grant> You mean the keying of the PCI slot?  I don't know if C160
Grant> supports 3.3v, 5.5v, or both. I'd need to dig up a product data
Grant> sheet to tell you which the C160 (not C160L) supported. But if
Grant> your card doesn't fit the keys in the slot, it's *not*
Grant> electrically compatible.

C160 has 3.3V only (i.e. it doesn't take most cheapo PC cards).

I ended up buying Symbios branded SCSI controllers for my C160s.  They
support both 3.3 and 5V operation.

And I have yet to see a PCI graphics board with universal/3.3V
connector.  Except for HP ones, that is.

-- 
Martin K. Petersen      Cereal Bowl Engineer, Linuxcare, Inc.
http://mkp.net/         SGI XFS, Linux/PA-RISC, GNOME
