Return-Path: <sieler@allegro.com>
Received: from opus.allegro.com (opus.allegro.com [209.10.39.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DBFA4855
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Dec 2003 16:23:56 -0700 (MST)
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200312162323.hBGNNeX24439@opus.allegro.com>
Subject: Re: [parisc-linux] Question about cache flushing and fork
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 16 Dec 2003 15:23:40 -0800 (PST)
In-Reply-To: <200312162251.hBGMpd15018573@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Dec 16, 2003 05:51:38 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org,
	LaMont Jones <lamont@mmjgroup.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Re:

> Is it possible to do PDC calls from user space under hpux to determine
> cache parameters?

Not that I know of.  I have a driver that lets me do it.  PDC calls
generally run with virtual address translation turned off.

Wait ... I forgot ...  yes, sort of.  
/dev/diag/diag2 allows you to do (some) PDC calls.  
Unfortunately, it's not documented :(
 
-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com
