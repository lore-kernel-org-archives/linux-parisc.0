From: John David Anglin <dave.anglin@bell.net>
Subject: Re: systemd real-time signals choices clash with Linux/PARISC available
 SIGRT range, WAS: fanotify_mark()
Date: Tue, 27 Aug 2013 11:52:56 -0400
Message-ID: <521CCB58.30806@bell.net>
References: <20130813154958.7514d525@marga.jer-c2.orkz.net> <520AA546.2070503@gmx.de> <20130814005400.3766f068@marga.jer-c2.orkz.net> <20130826014657.05f4c466@marga.jer-c2.orkz.net> <521BC84B.4090602@gmx.de> <BLU0-SMTP101B187CC9D02E87059A7C297490@phx.gbl> <20130827164601.4accbbfb@marga.jer-c2.orkz.net> <521CC531.6020106@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <521CC531.6020106@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 8/27/2013 11:26 AM, John David Anglin wrote:
> Can we change _NSIG to 69 so there are 32 RT signals as on other arches?
It looks like it needs to be a power of 2.  MIPS uses 128.

Dave

-- 
John David Anglin    dave.anglin@bell.net

