Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id C442D484C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Jun 2002 07:08:02 -0600 (MDT)
To: Patrick Caulfield <patrick@tykepenguin.com>
Subject: Re: [parisc-linux] mke2fs odd number:
Message-ID: <1024316831.3d0dd59f20e61@webmail.tiscalinet.be>
Date: Mon, 17 Jun 2002 14:27:11 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
References: <20020617095042.GE1177@tykepenguin.com>
In-Reply-To: <20020617095042.GE1177@tykepenguin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting Patrick Caulfield <patrick@tykepenguin.com>:

> Does anyone else get with from mke2fs:
> 
> This filesystem will be automatically checked every 22 mounts or
> 1.23076e-312 days, whichever comes first.  Use tune2fs -c or -i to
> override.

Also notice this last Friday (but no time to report.

> 
> I really hope it doesn't want to check the filesystem that often :)
> 
Dono, if tune2fs more relevant:

palinux:~# tune2fs -l /dev/sde1
tune2fs 1.27 (8-Mar-2002)
Filesystem volume name:   <none>
Last mounted on:          <not available>
Filesystem UUID:          9ef6bb62-df16-47c1-84ad-7a9ec6dc71a3
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal filetype sparse_super
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              262144
Block count:              523915
Reserved block count:     26195
Free blocks:              93589
Free inodes:              258235
First block:              0
Block size:               4096
Fragment size:            4096
Blocks per group:         32768
Fragments per group:      32768
Inodes per group:         16384
Inode blocks per group:   512
Last mount time:          Mon Jun 17 14:33:21 2002
Last write time:          Mon Jun 17 14:33:32 2002
Mount count:              4
Maximum mount count:      37
Last checked:             Fri Jun 14 19:09:41 2002
Check interval:           15552000 (6 months)
Next check after:         Wed Dec 11 18:09:41 2002
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:		  128
Journal UUID:             <none>
Journal inode:            8
Journal device:	          0x0000
First orphan inode:       0

Joel

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
