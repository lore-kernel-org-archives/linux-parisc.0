Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 68FBB4848
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Dec 2001 15:31:24 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Christian Suder <csuder@cisco.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [Q] on EISA support
Date: Wed, 26 Dec 2001 23:30:16 +0100
References: <4.3.2.7.2.20011226135241.027fc090@mira-sjc5-9.cisco.com>
In-Reply-To: <4.3.2.7.2.20011226135241.027fc090@mira-sjc5-9.cisco.com>
MIME-Version: 1.0
Message-Id: <20011226223124.68FBB4848@dsl2.external.hp.com>
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

On Wednesday 26 December 2001 23:13, Christian Suder wrote:
> Tried a NE2000 clone too, which was detected but with the wrong interrupt.
> That might be because it's a "hard" configured plug&pray card. PCs have no
> problems detecting the settings correctly, though.

Hi Christian,

Did you tried the "eisa_irq_edge=3,4,5,7,9,10,11,14,15" palo parameter ?
In case your NE2000 card is an ISA card you need to set the EISA irq's to
edge mode which is done with the above command.
Maybe we should think about adding a /proc-interface here ?

Greetings,
Helge 
