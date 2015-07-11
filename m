From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Bug#706050: logrotate: spurious "error: getting file ACL" messages
Date: Sat, 11 Jul 2015 11:51:12 -0400
Message-ID: <BLU436-SMTP10577C68AA6B4B3605CAF59979E0@phx.gbl>
References: <BLU0-SMTP118606EF06DBC860DA78C097B40@phx.gbl> <20130424110157.GA24835@thinkpad.nowster.org.uk> <BLU0-SMTP60C4315DE3E426704E80A897B50@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset="us-ascii"
Cc: Paul Martin <pm@debian.org>, 706050@bugs.debian.org,
	Debian Bug Tracking System <control@bugs.debian.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP60C4315DE3E426704E80A897B50@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2013-04-24, at 7:36 AM, John David Anglin wrote:

> On 24-Apr-13, at 7:01 AM, Paul Martin wrote:
> 
>> The test is
>> 
>>       if ((prev_acl = acl_get_fd(fdcurr)) == NULL) {
>>               if (errno != ENOTSUP) {
>>                       message(MESS_ERROR, "getting file ACL %s: %s\n",
>>                               currLog, strerror(errno));
>> 
>> 
>> and your kernel is responding with ENOSYS instead.  This contradicts
>> the manpage acl_get_fd(3):
>> 
>>    [ENOTSUP]          The file system on which the file identified by fd is
>>                       located does not support ACLs, or ACLs are disabled.
> 
> Thanks, forwarded your response to the parisc-linux list for review.


The spurious mail  has come back with logrotate 3.8.7-2.  File system is ext4:
/dev/sdc6 on /var type ext4 (rw,relatime,data=ordered)

/etc/cron.daily/logrotate:
error: getting file ACL /var/log/apt/term.log: Operation not supported
error: getting file ACL /var/log/apt/history.log: Operation not supported
...

Dave
--
John David Anglin	dave.anglin@bell.net



