Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 734CC482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 06:53:06 -0700 (MST)
Date: Thu, 22 Nov 2001 14:53:04 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power button on 712
Message-ID: <20011122145304.F23305@lug-owl.de>
References: <003801c1735c$6581b7b0$56dc10c3@amos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <003801c1735c$6581b7b0$56dc10c3@amos>
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

On Thu, 2001-11-22 15:48:41 +0200, Kaj-Michael Lang <milang@tal.org>
wrote in message <003801c1735c$6581b7b0$56dc10c3@amos>:
> This might sound really strange but anyway:
> 
> Should the power button work under Linux ?
> Even after halting I need to pull the cord to get my machine to power down,
> as it won't respond to the the power button.

During initialisation of hardware (the front LED is blinking) you
can "easily" switch off the machine. But, after the OS was started,
it's not such a good idea to allow an user to simply fiddle with
the BRS (-> big red switch). Try to /sbin/poweroff or to /sbin/halt
your box and try again:-)

MfG, JBG

-- 
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	http://lug-owl.de/~jbglaw/software/snapshot2cvs/
