Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from moutvdom.kundenserver.de (moutvdom.kundenserver.de [195.20.224.200])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A48E4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 13:28:34 -0600 (MDT)
From: "Tobias Giesen" <tobias_subscriber@tgtools.com>
To: "'Helge Deller'" <deller@gmx.de>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Re: [PATCH] Voodoo framebuffer on PARISC
Date: Thu, 19 Sep 2002 21:28:54 +0200
Message-ID: <000401c26012$cb73ffd0$0100a8c0@PLUTO>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
In-Reply-To: <200209160829.35216.deller@gmx.de>
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

Hello again,

I tried some more today, and I changed my setting to

#define DEFAULT_MODE 2

and recompiled and installed the new kernel, but it seems
the Voodoo2 is simply misconfigured by the driver. My monitor 
can take anything, so that's not the problem.

Are there any kernel parameters that I could try? Could it
be that my Voodoo2 is not compatible with Helge's?

I am on a Visualize C200.

Cheers,
Tobias
