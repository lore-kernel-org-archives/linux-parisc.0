Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4105B483E
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 13:21:33 -0700 (MST)
Message-Id: <200202042021.g14KLRtv019511@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] XGCC MacOSX/hppa64-linux build error
To: varenet@esiee.fr (Thibaut VARENE)
Date: Mon, 4 Feb 2002 15:21:27 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <CD0E8AAC-19AB-11D6-B4EE-0030656F07A2@esiee.fr> from "Thibaut VARENE" at Feb 4, 2002 09:14:32 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> build/gcc/gcc/xgcc -B/Users/varenet/palinux-builds/xc-build/gcc/gcc/ 
> -B/usr/local/palinux/hppa64-linux/bin/ 
> -B/usr/local/palinux/hppa64-linux/lib/ -isystem 
> /usr/local/palinux/hppa64-linux/include --print-libgcc-file-name`
> collect2: ld terminated with signal 10 [Bus error], core dumped

It may be totally unrelated but I am also having trouble with ld
segfaulting when it tries to build a shared library on hppa64-hp-hpux11.11.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
