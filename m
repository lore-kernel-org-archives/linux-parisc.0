Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F07F485A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Dec 2001 03:19:03 -0700 (MST)
Date: Thu, 27 Dec 2001 10:09:33 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Christian Suder <csuder@cisco.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] [Q] on EISA support
In-Reply-To: <4.3.2.7.2.20011226135241.027fc090@mira-sjc5-9.cisco.com>
Message-ID: <Pine.NEB.4.33.0112271005540.27112-100000@www2.scram.de>
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

Hi Christian,

> Note these cards use a memory window - is that possible with the
> current EISA support ?

There seems to be an issue with memory mapped windows currently. I have
similar problems with an token ring card which is detected correctly
(detection only uses port IO), but the memory window is only partially
seen by the CPU.

Cheers,
Jochen
