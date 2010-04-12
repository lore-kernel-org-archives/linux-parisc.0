From: Helge Deller <deller@gmx.de>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Mon, 12 Apr 2010 23:02:34 +0200
Message-ID: <4BC38A6A.3020404@gmx.de>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com> <20100409151330.GA23889@hiauly1.hia.nrc.ca> <4BC0E3AD.4050802@gmx.de> <20100410225355.GA2812@hiauly1.hia.nrc.ca> <4BC219F7.5020204@gmx.de> <20100411222554.GA10147@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100411222554.GA10147@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04/12/2010 12:25 AM, John David Anglin wrote:
> On Sun, 11 Apr 2010, Helge Deller wrote:
> 
>> Nevertheless, I still see the crashes with all kernel patches applied.
>>
>> What I usually do is to start up more than 8 screen sessions. In each of the
>> sessions I start the bash loop:
>> -> i=0; while true; do i=$(($i+1)); echo Run $i; ./minifail; done;
>> and detach from the screen sessions.
>> After some time, the load goes up to 8-16 and a few crashes fill the syslog.
>> I'm sure the crashes are related to how much load the machine is, and how
>> often process switches will happen.
>> How many minifail testcases do you run in parallel?
> 
> Sigh, never more than one...
> 
> That said, I did realize last night that the cache flush in ptep_set_wrprotect
> based on pte_dirty was flawed.  In a SMP kernel with a user on a different
> cpu pounding on the page to be write protected, there was a race between
> the pte_dirty check and the write protect.
> 
> Further, I don't believe the dirty bit is reliable.  Our cmpxchg is not
> atomic with respect to changes in the dirty bit.  Thus, there is a small
> window where a change in the dirty bit could get lost.
> 
> So for now, I think it safest to move the flush after the setting of the
> write protect bit, and do it unconditionally.  This should be ok since
> page faults are disabled.  I recognize that this will hurt performance.
> 
> I'm going to test the following on my rp3440.  The flushing has greatly
> improved SMP userspace stability.  However, I have still seen a few issues
> in the GCC testsuite.
> 
> Maybe it will help your B2000.  However, let's just go one step at a time.

Sadly no luck :-(
minifail still crashes...

Helge
