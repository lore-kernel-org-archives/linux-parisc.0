Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29561482B
	for <parisc-linux@parisc-linux.org>; Sat, 27 Oct 2001 00:43:50 -0600 (MDT)
Message-Id: <200110270639.AAA14566@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] card probing 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Sat, 27 Oct 2001 02:20:58 BST." <20011027022058.A23520@parcelfarce.linux.theplanet.co.uk>
Date: Sat, 27 Oct 2001 00:39:41 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Matthew Wilcox wrote:
> I don't know what Elroy does on reads of unassigned addresses.  This will
> probably affect the decision of how to fix this since we want to ship
> a 32-bit kernel that can boot on everything from a 720 to a J7000.

C3000 HPMC's. I just commited -pa72 in order to test this.
I built HP100 as a module w/o CONFIG_EISA defined.
"modeprobe hp100" results in an HPMC.

Off hand, I don't have any good ideas on fixing the problem.
I'll think about it some more.

grant
