Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20020305064844.9BD04482B@dsl2.external.hp.com>
Date: Mon,  4 Mar 2002 23:48:44 -0700 (MST)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] fb_ioctl.diff
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

Hi all,

See ftp.parisc-linux.org:patches/fb_ioctl.diff

I looked at the missing ioctls for 64-bit/FB and took a first whack at them.
I now get some garbage on my FB (c3k, vis-eg) with a 64-bit kernel
and the system locks up - have to unplug it. I suspect the wrapper isn't
doing address conversion properly since two pointers get passed back
to user space for one of them.  I'll look at the return values tomorrow
to see if I can figure anything out.

later,
grant
