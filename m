Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83AC5601A
	for <parisc-linux@parisc-linux.org>; Wed,  5 Dec 2001 11:31:04 -0700 (MST)
Message-Id: <m16Bgow-000OucC@bame.riverrock.org>
To: bame@riverrock.org
Cc: parisc-linux@parisc-linux.org, bame@www.riverrock.org
Subject: Re: [parisc-linux] itimer/ntpdate 64-bit patch 
In-Reply-To: Your message of "Wed, 05 Dec 2001 10:58:57 MST."
             <m16BgJt-000OuYC@bame.riverrock.org>
References: <m16BgJt-000OuYC@bame.riverrock.org> 
Date: Wed, 05 Dec 2001 11:31:02 -0700
From: Paul Bame <bame@riverrock.org>
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

On Helge's suggestion I stopped freeing bootmem, and the problem
no longer manifests.  No more time to work on it.  I won't commit
the syscall wrapper patch for now.

	-P
