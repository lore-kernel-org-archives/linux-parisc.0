From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: fix NATIVE set up in build
Date: Sat, 04 May 2013 19:33:59 +0200
Message-ID: <295dc694487be4c9f609633c4c3e7474@sf-mail.de>
References: <1367686258-28525-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Cc: <linux-parisc@vger.kernel.org>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1367686258-28525-1-git-send-email-vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Am 04.05.2013 18:50, schrieb Mike Frysinger:
> The ifeq operator does not accept globs, so this little bit of code 
> will
> never match (unless uname literally prints out "parsic*").  Rewrite to
                                                   ^^^^^^

That would never match ;)

Eike
