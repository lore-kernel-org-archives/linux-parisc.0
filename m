Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 74B52482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Feb 2002 16:59:15 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16a3sE-0005KR-00; Sun, 10 Feb 2002 23:59:10 +0000
Date: Sun, 10 Feb 2002 23:59:10 +0000
From: Matthew Wilcox <willy@debian.org>
To: Yasholomew Yashinski <yashy@mail.yashy.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B1000
Message-ID: <20020210235910.O1173@parcelfarce.linux.theplanet.co.uk>
References: <20020210184529.Y48612-100000@mail.yashy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020210184529.Y48612-100000@mail.yashy.com>; from yashy@mail.yashy.com on Sun, Feb 10, 2002 at 06:53:54PM -0500
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

On Sun, Feb 10, 2002 at 06:53:54PM -0500, Yasholomew Yashinski wrote:
>  I recently purchased an HP 9000/785/B1000. I tried to use the
> pasrisc*.iso as I've been using on my 712/*'s, however there appears to be
> issues using 32-bit as default. Setting up a serial console for this
> machine will not be a trivial task, due to its location. Is there anyone

Hmm.. this machine should work in both 32 and 64 bit mode.  I suspect
we don't currently support the graphics card in this machine (I assume
it has the same problems as the C3000... helge?)

> on the list that has such a beast, I could discuss installation with?
>  My next attempt will be to setup an install using rbootd, however it
> appears I will require serial console access.

rbootd is for much older machines (715/Scorpio and earlier).  Everything
since the 712 uses bootp (or dhcp) and tftp.

-- 
Revolutions do not require corporate support.
