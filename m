Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web10901.mail.yahoo.com (web10901.mail.yahoo.com [216.136.131.37])
	by dsl2.external.hp.com (Postfix) with SMTP id 39C12482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jan 2002 16:16:39 -0700 (MST)
Message-ID: <20020104231637.42697.qmail@web10901.mail.yahoo.com>
Date: Fri, 4 Jan 2002 15:16:37 -0800 (PST)
From: Rogelio Robles <rogelio_robles@yahoo.com>
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Help getting xf86 cfg file for a HP PA 9000/J210XC running debian hppa Linux
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

Hello Guys,

I'm close to have success running XFree86 4.1.0 that
comes with HPPA GNU/Linux 0.9.3 but I'm still
receiving a "parameter error" message.

I'm sending you this message to ask for your help
getting to run XFree86 on a HP 9000 J210XC workstation
running the latest version of debian GNU/Linux.

I have a debian pa-risc GNU/Linux 0.9.3 running on my
system, everything seems that it's working fine but
XFree86 X server. After several hours invested in this
past holiday season I haven't had luck getting this
guy to start running.

I had a partial success in my XF86Config file, I'm
using the frame buffer driver or "fbdev" and it seems
that it's working because I receive infomrational
messages from the driver itself: video ram 2MB, etc,
but it terminates quickly saying that there is a
"parameter error". It seems that there is something
specified in the file that it doesn't like it. 

I would like you to share with me, if you don't mind,
your XF86Config file or maybe pointing me to the right
place so I can find what I need to state in my xf86
cfg file to start the X server on this system.

I've been using GNU/Linux since some years ago mostly
on x86 platforms with incremental success and some GNU
SW on Sun Solaris. Currently I have a RedHat 7.1
system running at home with the latest versions of
available programs and I'd like to replicate the same
in this system that I just got.

Thanks in advance for your help,
Rogelio


__________________________________________________
Do You Yahoo!?
Send your FREE holiday greetings online!
http://greetings.yahoo.com
