From: Helge Deller <deller@gmx.de>
Subject: Re: Question about execve.
Date: Thu, 01 Apr 2010 20:55:17 +0200
Message-ID: <4BB4EC15.3000803@gmx.de>
References: <20100401133353.D99774E77@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca,
	carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100401133353.D99774E77@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04/01/2010 03:33 PM, John David Anglin wrote:
> Hi Helge,
>
>> I installed this libc on one of my servers.
>> I didn't ran any bigger tests yet, but at least it seems to have fixed the issue that an ssh into the machine often didn't let me in the first time. Now it just works...
>
> I think this might be another issue.  Strangely, I used to see this
> one my c3750 and it' now gone away.

Sadly I was wrong and answered too fast.
The ssh-issue came back at some point, so the new glibc didn't fixed it.... :-(
  
> I originally noticed a problem with Carlos's vfork testcase when compiled
> with -static.  The parent pid printed by the parent was corrupted (always
> same value) by the vfork call (r19 was not saved across syscall).  If you
> check that it now works, the problem is probably fixed in glibc.
>
> I have attached below a kernel fix for this bug.  This allows old user
> code to work correctly.

Thanks for the work you and Carlos do!

Helge
