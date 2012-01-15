From: John David Anglin <dave.anglin@bell.net>
Subject: Use compat_ioctl?
Date: Sun, 15 Jan 2012 17:33:37 -0500
Message-ID: <BLU0-SMTP629D613FF8EF578FA85A0197820@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Occasionally, I see messages like:

ioctl32(python:29268): Unknown cmd fd(7) cmd(00005302){t:'S';sz:0}  
arg(fe1f3fcc) on /dev/pts/5

I read somewhere that this may be caused by not using the compat_ioctl  
method (32-bit apps
running on 64-bit kernel).

Dave
--
John David Anglin	dave.anglin@bell.net



