Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BC314829
	for <parisc-linux@parisc-linux.org>; Sat,  1 Feb 2003 22:22:46 -0700 (MST)
Date: Sat, 1 Feb 2003 21:19:40 -0800
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Compiler switches
Message-ID: <20030202051940.GR20940@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030202035920.F21040@parcelfarce.linux.theplanet.co.uk> <200302020456.h124ueYd025040@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200302020456.h124ueYd025040@hiauly1.hia.nrc.ca>
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

> Cross my fingers, but I believe that the distance problem for calls
> is fixed 3.2.2.  However, if there really are objects with .text larger

Lamont still saw some function-section failures with Debian gcc 
3.2.2-pre7 (20030128)

This one looks pretty small:
http://buildd.debian.org/fetch.php?&pkg=synopsis&ver=0.4.1cvs20030125-1&arch=hppa&stamp=1044017572&file=log&as=raw

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
