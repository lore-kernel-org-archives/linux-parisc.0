Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 797CB482C
	for <parisc-linux@parisc-linux.org>; Mon, 19 Nov 2001 16:46:58 -0700 (MST)
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 19 Nov 2001 16:46:54 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20011119234654.7A9FB37E86@carmen.fc.hp.com>
Subject: [parisc-linux] Toolchain improved, archive better, proceed with caution
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

The hppa-linux toolchain is much improved and in the Debian "unstable" 
archive. The "woody" tree still probably needs a few days to get sane again. 
There are still some outstanding toolchain problems but nothing major that 
affects runtime. So...

It is reasonably safe[1] to apt-get upgrade your "unstable" hppa-linux boxes. 
Some services, sshd in particular, may need to be restarted by hand. Keep this 
in mind when upgrading remotely.

Once the archive is reasonably stable and a few other things are done, we will 
be looking at doing another release, hopefully in the next week or so.

Please update your systems and report any problems to the correct list,

kernel and toolchain -> parisc-linux@parisc-linux.org
userspace and packaging -> debian-hppa@lists.debian.org

[1] as safe as it ever is to upgrade an "unstable" system

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
