From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Bug#706050: logrotate: spurious "error: getting file ACL"
 messages
Date: Sun, 12 Jul 2015 09:15:55 +0100
Message-ID: <1436688955.2344.1.camel@HansenPartnership.com>
References: <BLU0-SMTP118606EF06DBC860DA78C097B40@phx.gbl>
	 <20130424110157.GA24835@thinkpad.nowster.org.uk>
	 <BLU0-SMTP60C4315DE3E426704E80A897B50@phx.gbl>
	 <BLU436-SMTP10577C68AA6B4B3605CAF59979E0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Paul Martin <pm@debian.org>, 706050@bugs.debian.org,
	Debian Bug Tracking System <control@bugs.debian.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP10577C68AA6B4B3605CAF59979E0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2015-07-11 at 11:51 -0400, John David Anglin wrote:
> On 2013-04-24, at 7:36 AM, John David Anglin wrote:
> 
> > On 24-Apr-13, at 7:01 AM, Paul Martin wrote:
> > 
> >> The test is
> >> 
> >>       if ((prev_acl = acl_get_fd(fdcurr)) == NULL) {
> >>               if (errno != ENOTSUP) {
> >>                       message(MESS_ERROR, "getting file ACL %s: %s\n",
> >>                               currLog, strerror(errno));
> >> 
> >> 
> >> and your kernel is responding with ENOSYS instead.  This contradicts
> >> the manpage acl_get_fd(3):
> >> 
> >>    [ENOTSUP]          The file system on which the file identified by fd is
> >>                       located does not support ACLs, or ACLs are disabled.
> > 
> > Thanks, forwarded your response to the parisc-linux list for review.
> 
> 
> The spurious mail  has come back with logrotate 3.8.7-2.  File system is ext4:
> /dev/sdc6 on /var type ext4 (rw,relatime,data=ordered)
> 
> /etc/cron.daily/logrotate:
> error: getting file ACL /var/log/apt/term.log: Operation not supported
> error: getting file ACL /var/log/apt/history.log: Operation not supported
> ...

It looks like you built your kernel without CONFIG_EXT4_FS_POSIX_ACL.
The warning is harmless because ACLs aren't required for logs ... it's
merely trying to duplicate the ACL on the rotated file.

James


