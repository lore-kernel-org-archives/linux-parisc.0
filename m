Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id EEF52486E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Feb 2002 15:09:15 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Yasholomew Yashinski <yashy@mail.yashy.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo not booting kernel
Date: Thu, 21 Feb 2002 23:05:32 +0100
References: <20020220232407.T96452-100000@mail.yashy.com>
In-Reply-To: <20020220232407.T96452-100000@mail.yashy.com>
MIME-Version: 1.0
Message-Id: <200202212305.32076.deller@gmx.de>
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

On Thursday 21 February 2002 22:54, Yasholomew Yashinski wrote:
>  Also wondering how the Vis EG-PCI support is coming, is
> parisc-linux-announce the best way to track this? Anxious to use graphics
> console :)

It's nearly finished. 
The current CVS version 2.4.17-pa28 now boots my c3000 w/ VisEG PCI and
has working sticon and stifb in case you _boot_ via serial console (after bootup
you may of course use sticon/stifb).
Booting from graphics console will still crash your machine - but we're working on that.

Helge
