Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2BEE482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Nov 2001 12:52:37 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 161CGr-00010E-00
	for parisc-linux@lists.parisc-linux.org; Tue, 06 Nov 2001 21:52:29 +0200
Date: Tue, 6 Nov 2001 21:51:28 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: hppa binutils/glibc updates
Message-ID: <20011106215128.B5797@dogbert.localdomain>
References: <20011105024952.C4441@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0111050136140.2956-100000@spawn.hockeyfiend.com> <20011105214227.M505@tausq.org> <20011106101650.A29917@dogbert.localdomain> <20011106152317.A4530@dogbert.localdomain> <20011106155428.A4719@dogbert.localdomain> <20011106143616.E4441@parcelfarce.linux.theplanet.co.uk> <20011106161613.M8938@linuxcare.com> <20011106192447.O8938@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011106192447.O8938@linuxcare.com>
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

Hello,

Seems with all the apt db madness, libstdc++ didn't get installed the
first time. I installed it again, and things worked (better). There is
something strange going on with my nfsroot. Don't know if it's some nfs
setting or something... I get "too many symlinks" and "I/O" errors.

On Tue, 06 Nov 2001, Richard Hirst wrote:

> On Tue, Nov 06, 2001 at 04:16:13PM +0000, Richard Hirst wrote:
> > apt-get works fine for me, btw (715/75 and a500), running apt 0.5.4
> 
> Hmm, having switch from chroot to real root on the a500, I'm
> now seeing this same SIGILL.

Hehe. Can't help you there...

Anyway, I'm going to attempt a 3.0.15 boot-floppies install now. I
presume this is probably not going to work yet? We'll soon find out...

Seems the lifimage I crafted with palo is a bit ill. I'm going try to
kick my nfsroot into shape, and try to debootstrap onto my SCSI disk.

Regards,

Albert
