Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 881F64852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 11:12:27 -0700 (MST)
Message-ID: <40379FAE.4050802@tiscali.be>
Date: Sat, 21 Feb 2004 18:13:02 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] b2k scsi disk pb
References: <402A4CA500006E8D@ocpmta2.freegates.net>
	<Pine.LNX.4.58.0402201900540.26386@sal.ucc.ie>
In-Reply-To: <Pine.LNX.4.58.0402201900540.26386@sal.ucc.ie>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



M. Grabert wrote:
> On Fri, 20 Feb 2004, Joel Soete wrote:
> 
> 
>>on my b2k since I can run 2.6 (32bit with gcc-3.3 or 64bit with gcc-3.0)
>>i noticed from time to time such dmesg:
>>sym0:5:0: ABORT operation timed-out.
>>sym0:5:0: ABORT operation started.
> 
> 
> [...]
> 
> 
>>sym0:5:0: ABORT operation timed-out.
>>sym0:5:0: DEVICE RESET operation started.
>>sym0:5:0: DEVICE RESET operation timed-out.
>>sym0:5:0: BUS RESET operation started.
>>sym0: SCSI BUS reset detected.
>>sym0: SCSI BUS has been reset.
>>sym0:5:0: BUS RESET operation complete.
>>
>>and during this time the system naturaly hang.
> 
> 
> (or is at least *very* slow)
> 
hmm for me everything stop: ls, top, ... every cmd are pending.
> 
>>scsi id 5 is the one of the working boot disk (a quantum model atlas5-9lvd)
>>and if there is well a second disk (a seagate model ST336704LC) it is not
>>used.
> 
> 
> Had the same problem when attaching a SE-SCSI device (also a Seagate, 20GB)
> on my C3k (which has 2 internal LVD SCSI-drives).
> 
> Got rid of it by not using the SE-SCSI driver ;)
> Try to physically detach the (not-used) ST336704LC.
> 
It is an internal disk also but as I don't use it any more, I can try to remove it ;)

> 
>>OTC with 2.4 and sym2 driver, I never noticed this behavior (even with recent
>>2.4.25-rc?-pa0 :) ), so I presume that there is no disk failure (and a dd
>>if=/dev/sda of=/dev/null bs=1024k reach to read fully the disk without any
>>error).
> 
> 
> Yes, I think reading is fine, just (lots of) writing is triggering it.

Max, thanks for advise,
	Joel
