Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp013.mail.yahoo.com (smtp013.mail.yahoo.com [216.136.173.57])
	by dsl2.external.hp.com (Postfix) with SMTP id 3736C482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Feb 2002 19:48:19 -0700 (MST)
Message-ID: <3C673358.2070404@yahoo.com>
Date: Mon, 11 Feb 2002 02:58:32 +0000
From: Jbit <james_a_n_lee@yahoo.com>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] lp0 kablooie
References: <Pine.LNX.4.21.0202091555570.7869-100000@maestro.symsys.com>
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

Greg Ingram wrote:

> Writing data from my C100 to /dev/lp0 makes the kernel go kablooie.  It's
> the kernel from the recent (0.9.3?) iso.  Known problem?  Any more info I
> could supply that would help?  I've appended everything on the console
> from the crash, through the power cycle, to mounting disks again.  


Hrm, not knowing what the exact problem is, i'd say its worth trying the latest cvs kernel
(the debian-hppa-0.9.3 kernel is 2.4.9, IIRC)

Then, if it still gives an error, submit a bug report or somthing ;)

--jbit


_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
