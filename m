From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] More ??'s
Date: Wed, 12 May 2004 11:28:03 -0600
Message-ID: <20040512172803.GA3378@colo.lackof.org>
References: <20040512125116.B15273BE18@free.linux.hp.com>
	<000501c43845$082f6840$6401a8c0@nwoods>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Nathaniel Woods <nwoods29321@chater.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <000501c43845$082f6840$6401a8c0@nwoods>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, May 12, 2004 at 01:17:33PM -0400, Nathaniel Woods wrote:
> vid card in X = Fixed, I set "depth = 8", now it works but if I try to set
> it to anything else it says "FBIOPUT_VSCREENINFO: Invalid Argument".
> So I'll just leave it at 8.

It has to be set to whatever "fbset" command says it is.
Some of the *supported* graphics chips do work with higher color depth.

> I'm new to linux so, How do I get the messages to send?? Since the floppy
> drive won't work, I would have to transe them to my win 2k pro system via my
> network then send them. How would I do this?? I have telnet on both machines
> and a telnet server on my win 2k system. Would I be able to transfer the
> files through telnet?

cut/paste the dmesg output from the telnet window into an email.
Or redirect dmesg output to a file and rcp/scp the file so
it can be attached or appended to an email.

> As for the HP 9000/720, I have all the Original documentation and Official
> HP-UX CD's I am not very worried about the speaker connector on the back,
> BUT The parisc-linux says there is now Full Hil support.
> I have the 2.4.17 Kernel.

"apt-get install kernel-image-2.4.25-32" should be the latest 2.4.x kernel.
(or something reasonably close to that)

> How do I update to the Newest Kernel version and configure it and X
> for the hil keyboard and mouse?

IIRC, the parisc-linux FAQ has this answer.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
