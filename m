From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Latest palinux crash
Date: Mon, 08 Aug 2005 19:29:26 +0000
Message-ID: <42F7B296.7020504@tiscali.be>
References: <200507261637.j6QGb4vs008289@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: carlos@systemhalted.org,
 parisc-linux@parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507261637.j6QGb4vs008289@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



John David Anglin wrote:
>>(but I could never experiment it because of it's so big size: iirc about 60Mb for the 2.4 and this time my dump (swap) area was too 
> 
> 
> That doesn't make sense.  The addition of debug info shouldn't change
> the size of a core dump.  It's the code and data needed to actual do
> the dump that increases the kernel size.
> 
Ah sorry for confusion but the two things are not related and not related to coredump size:
	o first the executable vmlinux was very big
	  (as plao doesn't yet support a compressed vmlinuz it was
	   hard to find a place at this time to copy it to an easy
	   access path /boot a dedicated slice of only 30Mb
	   but now increased to 128 for this reason ;-)
	o oth the ram of the system 2Gb (N4k) and only 256Mb of swap
	  also used to dump the kernel core; even thought linux didn't
	  use the all ram but well regualry about 1.4Gb
	  (or I would have to sacrify another fs?)

> 
>>>I recommend building
>>>with -O1 instead of -O2.
>>>
>>
>>mmm could it not be too much invasive?
> 
> 
> I don't think so.  Optimization shouldn't change code behavior. While
Agreed.

> it's true that a change in execution speed might break some realtime
> code, if this happens in linux, it's probably a bug.
> 
> 
>>I mean we are going to change completely the insn flow and btw the time diagram as I experiment:
>>some weeks ago, I was working on ccio-dma for 64bit kernel on a d380 on which I noticed a dramtic slow down of the boot (more then 
>>an hour in place of 5 min for its 32bit twin).
> 
> 
> In most cases, there's only a small change in execution speed and sometimes
> -O1 is faster.  The above change is abnormally large and suggests that a
> major chunk of code is being optimized away.

Ah also, I missed but I doubt in this case: just change a const determining the number of printk change the behaviour, though.

> 
> Dave

Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
