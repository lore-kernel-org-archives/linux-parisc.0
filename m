Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83B07482B
	for <parisc-linux@parisc-linux.org>; Fri,  2 Nov 2001 15:25:49 -0700 (MST)
Message-Id: <200111022221.PAA07613@puffin.external.hp.com>
To: Daniel Williams <dan@bigw.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] More Install on C110: Kernel doesn't load... 
In-Reply-To: Message from Daniel Williams <dan@bigw.org>
   of "Thu, 01 Nov 2001 21:18:31 CST." <4A91AEBA-CF40-11D5-A1E4-0030657D1C94@bigw.org>
Date: Fri, 02 Nov 2001 15:21:46 -0700
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

Daniel Williams wrote:
> Error: read from boot device failed (status = -4)
> byteio_read: seekread() returned -1 expected 2048
> Error:  segment 0 read() failed
> 
> Any thoughts?

When burning the IA64 boot CD, i was warned to use the 2x (vs 4x) burn
speed. This sounded like hogwash to me but the person was told the disk
burned at 4x may not work well with older/slower CD drives. If someone
could confirm this I'd appreciate it...anyway, the ia64 CD worked fine.

grant
