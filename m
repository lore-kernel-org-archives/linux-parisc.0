Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server.da-kot (21-40.CampusNet.ucl.ac.be [130.104.21.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9FC0482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 May 2003 15:54:20 -0600 (MDT)
Received: from gmsoft.tuxicoman.be ([2001:6f8:204:20:210:a7ff:fe10:1a3e])
	by server.da-kot with esmtp (Exim 3.36 #1 (Debian))
	id 19FLFZ-0000fI-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 May 2003 23:54:25 +0200
From: Guy Martin <gmsoft@gentoo.org>
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 12 May 2003 23:51:57 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Message-Id: <200305122351.57449.gmsoft@gentoo.org>
Subject: [parisc-linux] gcc and -march=2.0 flag bug
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

Hi All,

I had some problems with gcc. When I set the CFLAGS/CXXFLAGS -march=2.0, most 
of the applications builded are b0rked. This occured on many stations. Using 
-march=1.1 works well.

Is this a 'feature' of unimplemented 64bit userspace or is this a bug ?

In case of a bug, what do you need to debug it.

Regards

-- 
Guy Martin
Gentoo - HPPA port Lead / IPv6 team
Lug Charleroi (Belgium)
