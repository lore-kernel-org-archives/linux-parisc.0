Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA5F6482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Nov 2001 12:23:42 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 76F21B00C; Tue,  6 Nov 2001 19:24:47 +0000 (GMT)
Date: Tue, 6 Nov 2001 19:24:47 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Albert Strasheim <fullung@ilink.nis.za>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: hppa binutils/glibc updates
Message-ID: <20011106192447.O8938@linuxcare.com>
References: <20011105024952.C4441@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0111050136140.2956-100000@spawn.hockeyfiend.com> <20011105214227.M505@tausq.org> <20011106101650.A29917@dogbert.localdomain> <20011106152317.A4530@dogbert.localdomain> <20011106155428.A4719@dogbert.localdomain> <20011106143616.E4441@parcelfarce.linux.theplanet.co.uk> <20011106161613.M8938@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011106161613.M8938@linuxcare.com>; from rhirst@linuxcare.com on Tue, Nov 06, 2001 at 04:16:13PM +0000
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

On Tue, Nov 06, 2001 at 04:16:13PM +0000, Richard Hirst wrote:
> apt-get works fine for me, btw (715/75 and a500), running apt 0.5.4

Hmm, having switch from chroot to real root on the a500, I'm
now seeing this same SIGILL.

Richard
