Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost (IP-213157009069.dialin.heagmedianet.de [213.157.9.69])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85AEE483B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Jul 2002 05:49:22 -0600 (MDT)
Received: from dreamind by localhost with local (Exim 3.35 #1 (Debian))
	id 17VWG8-0001KQ-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Jul 2002 13:49:20 +0200
Date: Fri, 19 Jul 2002 13:49:20 +0200
From: Stefan Pfetzing <dreamind@dreamind.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020719114920.GA4928@dreamind.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Cdrecord and parisc64 kernel
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

I just installed Debian/hppa on my HP Visualize C200.

After I've compiled a kernel for 64bit and tried to use cdrecord it crashed
the whole machine. It was not availible via network and din't respond any more
to keyboard requests. (btw. what key is SysRq?  Alt-Printscreen doesn't work)

The problem is, I saw noting, not on the console, and not in the syslog.

bye

Stefan

-- 
        http://www.dreamind.de/
Oroborus and Debian GNU/Linux Developer.
