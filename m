Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server.da-kot (21-40.CampusNet.ucl.ac.be [130.104.21.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id 46F90482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 May 2003 12:06:02 -0600 (MDT)
Received: from gmsoft.tuxicoman.be ([2001:6f8:204:20:210:a7ff:fe10:1a3e])
	by server.da-kot with esmtp (Exim 3.36 #1 (Debian))
	id 19FeA5-000169-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 May 2003 20:06:01 +0200
From: Guy Martin <gmsoft@gentoo.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc and -march=2.0 flag bug
Date: Tue, 13 May 2003 20:03:28 +0200
References: <200305131753.h4DHrmPJ007374@hiauly1.hia.nrc.ca>
In-Reply-To: <200305131753.h4DHrmPJ007374@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200305132003.28348.gmsoft@gentoo.org>
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

> You didn't say which compiler version that you were using.

Yes sorry, I forgot. I use gcc-3.2.2. I'll try gcc-3.3 asap.

Thanks

> As I mentioned, the 3.2 branch is closed for bug fixes.  The failure
> doesn't occur with 3.3.  It has a number of -march=2.0 fixes.  The
> problem could be C++ related as well.  There are a huge number of C++
> fixes in 3.3 relative to 3.3.
>
> Dave

-- 
Guy Martin
Gentoo - HPPA port Lead / IPv6 team
Lug Charleroi (Belgium)
