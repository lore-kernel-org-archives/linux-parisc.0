Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from x.dreamin.de (IP-213157009071.dialin.heagmedianet.de [213.157.9.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id 824704834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 Oct 2002 11:58:19 -0600 (MDT)
Date: Thu, 24 Oct 2002 19:58:02 +0200
From: Stefan Pfetzing <dreamind@dreamind.de>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20021024175802.GA9490@dreamind.de>
References: <3DB5776100000362@ocpmta8.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DB5776100000362@ocpmta8.be.tiscali.com>
Subject: [parisc-linux] Re: mkfs.xfs (xfsprogs-2.3.5) failled
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

* jsoe0708@tiscali.be <jsoe0708@tiscali.be> [021023 09:30]:
> Hi Stephan,
> 
> As you do earlier, I build a xfs-kernel diff versus 2.4.19 vanilla kernel,
> apply it against 2.4.19-pa22 (with very small problem) and obtain a bootable
> (and operational) kernel.
Yup.

> Now I rebuild debian package of xfsprogs-2.3.5 (cvs form) and obtain tools
> binaries (without warning or error) but even mkfs -t xfs (mkfs.xfs) failed
> with this concise message: "mkfs.xfs: cannot reserve space [28 - No space
> left on device]".
> (I try to xfs_check which failed also with a lot of error messages).
Yea thats a problem, still in the Linux/Parisc kernel. It gives garbage with
BLKGETSIZE64. Simply look in the xfslibs directory where BLGKETSIZE64 is used
and comment that out. Thats a disgusting hack but it leads to a set of working
xfsprogs.

If you want I can make a patch for you, but this will take some time, since I
have the source not right by hand now.

bye

Stefan

-- 
        http://www.dreamind.de/
Oroborus and Debian GNU/Linux Developer.
