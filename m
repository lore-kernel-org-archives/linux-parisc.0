From: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Re: Install GNOME on 712/80
Date: 06 Feb 2004 10:49:42 -0500
Message-ID: <1076082583.1823.23.camel__37539.6797121086$1416623179$gmane$org@mulgrave>
References: <02d601c3ebef$e3241650$8100a8c0@punk>
	<200402060007.27911.deller@gmx.de>
	<009801c3ecc6$d637d990$8100a8c0@punk>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
	debian-hppa@lists.debian.org
To: Jens Simmoleit <simmel@anymotion.de>
Return-Path: <James.Bottomley@SteelEye.com>
In-Reply-To: <009801c3ecc6$d637d990$8100a8c0@punk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, 2004-02-06 at 10:35, Jens Simmoleit wrote:
> But now something strange happens, I type in my user and the password at the
> gnome desktop login, the screen turns black and after a certain amount of
> time the box comes back with the Gnome login prompt (where I started from)?

Gnome is a known consumer of colour resources, and it's applications
aren't very graceful when they run out (as they do with our 8 bit
framebuffer), it could be that you are simply running out of them.

You can use a true colour visual at this depth (the colours are pretty
ratty, but at least you never run out) by adding

Visual "TrueColor"

To the SubSection "Display" part that covers you.

James
