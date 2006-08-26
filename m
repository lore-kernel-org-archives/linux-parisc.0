From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] How hp implemented 'undefined instruction'?
Date: Sat, 26 Aug 2006 17:11:47 -0500
Message-ID: <200608261711.47468.mszick@morethan.org>
References: <44F04733.1050305@scarlet.be>
	<20060826152143.GM1455@athena.road.mcmartin.ca>
	<44F0A3B5.605@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44F0A3B5.605@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat August 26 2006 14:40, Joel Soete wrote:
>

That seems to be two different situations.
Can be hard to understand even for native English readers.
 
> 
> Ok I understand what you mean but I thought to such e.g. ldcw:
> "The address must be 16-byte aligned. If the address is unaligned, the operation of the instruction is undefined."
> (just for example)
> 

Here, it is "the operation" (how it accomplishes its task) that is undefined.
The instruction definition lists the logical steps the instruction follows when
the operation is aligned.  
There is no list of logical steps for when it is not aligned.

> or may be a better example ssm/mtsm:
> "Setting the PSW Q-bit, PSW{60}, to 1 with this instruction, if it was not already 1, is an undefined operation."
> 

Here, it is what the "result of the operation" is that is undefined.
A software attempt to make a change 0 to 1 and how the hardware follows
that change attempt is not defined.

> I am still trying to understand this soft lockup bug and why this lock is not unlocked? 
>

Ah, yes, the key question.
The results of the tests that you are running now should help us understand the answer.

> (could it be because PSW_I bit is not enabled when we exepted? 
>

No.
But if it is not enabled during the "busy wait" the waiting cpu
will not "see" IPI messages while waiting for the lock.

The "busy wait" time should not be long enough to matter if the
lock is not broken.
If the "busy wait" time happens to be too long with the IPI
messages disabled, then things begin to break.

> The 'atomic' ldcw(,co) doesn't operate as we expect?) 
> 

My favorite theory is that the lock release does not operate
as we expect, but that is only a theory.

> Thanks,
> 	Joel
> 
Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
