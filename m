Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fa0008.coopertire.com (unknown [63.150.221.254])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F3244835
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Mar 2002 09:42:33 -0700 (MST)
Message-ID: <426B4FEBE684D411B0A60090273B1D24024856DC@aa0016.auburn.auto.cooperintra.ctb>
From: "Kurc, Marcin A." <makurc@cooperstandard.com>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 19 Mar 2002 11:40:04 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] fb support
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

Hi,
I'm trying to set up a framebuffer.
I have the framebuffer support compiled into the kernel
[*]   Generic STI frame buffer device support
[*] STI console

however, when I try to run fbset it says
open /dev/fb0: No such device

What did I miss? 
thanks

Marcin Kurc
 
