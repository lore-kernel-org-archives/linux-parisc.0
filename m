Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94090482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 May 2003 12:13:53 -0600 (MDT)
Date: Tue, 13 May 2003 11:18:05 -0700
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.3 and c++
Message-ID: <20030513181805.GF548@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200305131853.03798.gmsoft@gentoo.org> <200305131753.h4DHrmPJ007374@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200305131753.h4DHrmPJ007374@hiauly1.hia.nrc.ca>
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

> As I mentioned, the 3.2 branch is closed for bug fixes.  The failure
> doesn't occur with 3.3.  It has a number of -march=2.0 fixes.  The
> problem could be C++ related as well.  There are a huge number of C++
> fixes in 3.3 relative to 3.3.

Reading this inspired us to try compiling the 'menu' debian package 
with g++-3.3. Historically this package has been very problematic on
hppa because of its use of exceptions. It's been broken for a very long
time (couple years?).... but with latest g++-3.3 it actually compiles 
and works!!

Dave, many many thanks again for all your work on gcc.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
