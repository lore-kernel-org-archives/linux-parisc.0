Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from laas.laas.fr (laas.laas.fr [140.93.0.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F672482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Apr 2002 05:48:01 -0600 (MDT)
Message-ID: <3CC69B80.1020509@tuxfamily.org>
Date: Wed, 24 Apr 2002 13:48:16 +0200
From: Thomas Marteau <marteaut@tuxfamily.org>
MIME-Version: 1.0
To: s-clarob@st-aidans.cumbria.sch.uk
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Setting blackbox as default WM
References: <5.1.0.14.0.20020424115946.00a67b30@10.106.16.2>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi,

> How do I specify black box to be my default windows manager, it's a long 
> time since I have had to do this and that was on a RH6 based system.

put the complete path to black box executable in your ~/.xinitrc and 
startx will automatically run black box as your window manager.

Since it is not a parisc kernel devel issue, please send this knid of 
question eslewhere :-) debian-user@lists.debian.org for example.

Thomas.
