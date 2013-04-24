From: John David Anglin <dave.anglin@bell.net>
Subject: Fwd: Bug#706050: logrotate: spurious "error: getting file ACL" messages
Date: Wed, 24 Apr 2013 07:27:11 -0400
Message-ID: <BLU0-SMTP185E1C91F553E01372591697B50@phx.gbl>
References: <20130424110157.GA24835@thinkpad.nowster.org.uk>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is with 3.9-rc6.

Begin forwarded message:

> From: Paul Martin <pm@debian.org>
> Date: April 24, 2013 7:01:58 AM GMT-04:00
> To: Dave Anglin <dave.anglin@bell.net>, 706050@bugs.debian.org
> Cc: control@bugs.debian.org
> Subject: Re: Bug#706050: logrotate: spurious "error: getting file  
> ACL" messages
>
> tags 706050 pending
> thanks
>
> On Sun, Apr 21, 2013 at 09:49:08AM -0400, Dave Anglin wrote:
>> Installed 3.8.3-3 on system with ext3 file systems without ACL  
>> support.
>> Now get mail with following with following content:
>>
>> /etc/cron.daily/logrotate:
>> error: getting file ACL /var/log/mysql.log: Function not implemented
>> error: getting file ACL /var/log/syslog.1: Function not implemented
>
> [snip]
>
>> Shouldn't these be supressed?
>
> Yes, they should.
>
> The test is
>
>        if ((prev_acl = acl_get_fd(fdcurr)) == NULL) {
>                if (errno != ENOTSUP) {
>                        message(MESS_ERROR, "getting file ACL %s: %s 
> \n",
>                                currLog, strerror(errno));
>
>
> and your kernel is responding with ENOSYS instead.  This contradicts
> the manpage acl_get_fd(3):
>
>     [ENOTSUP]          The file system on which the file identified  
> by fd is
>                        located does not support ACLs, or ACLs are  
> disabled.
>
> Upstream haven't spotted this, so I'll fix the logic in the next  
> upload...
>
> -- 
> Paul Martin <pm@debian.org>
>

--
John David Anglin	dave.anglin@bell.net



