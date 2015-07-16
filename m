From: Paul Martin <pm@debian.org>
Subject: Re: Bug#706050: logrotate: spurious "error: getting file ACL"
 messages
Date: Thu, 16 Jul 2015 07:55:48 +0100
Message-ID: <20150716065547.GB13102@thinkpad.nowster.org.uk>
References: <BLU0-SMTP118606EF06DBC860DA78C097B40@phx.gbl>
 <20130424110157.GA24835@thinkpad.nowster.org.uk>
 <BLU0-SMTP60C4315DE3E426704E80A897B50@phx.gbl>
 <BLU436-SMTP10577C68AA6B4B3605CAF59979E0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 706050@bugs.debian.org, Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP10577C68AA6B4B3605CAF59979E0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jul 11, 2015 at 11:51:12AM -0400, John David Anglin wrote:

> The spurious mail  has come back with logrotate 3.8.7-2.  File system is ext4:
> /dev/sdc6 on /var type ext4 (rw,relatime,data=ordered)
> 
> /etc/cron.daily/logrotate:
> error: getting file ACL /var/log/apt/term.log: Operation not supported
> error: getting file ACL /var/log/apt/history.log: Operation not supported
> ...

Are you running with SELinux enabled by any chance?

-- 
Paul Martin <pm@debian.org>
