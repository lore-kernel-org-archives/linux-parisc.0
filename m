Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beloit.edu (beloit.edu [144.89.40.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D7B3482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 11:02:04 -0700 (MST)
Received: from localhost ([144.89.185.182])
	by beloit.edu (AIX4.3/8.9.3/8.9.0) with ESMTP id LAA32704
	for <parisc-linux@lists.parisc-linux.org>; Fri, 9 Nov 2001 11:56:26 -0600
Date: Fri, 9 Nov 2001 12:02:02 -0600
Subject: Re: [parisc-linux] C110 install and boot part 3... 
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v472)
From: Daniel Williams <dan@bigw.org>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200111091730.KAA32672@puffin.external.hp.com>
Message-Id: <E096047F-D53B-11D5-B326-0030657D1C94@bigw.org>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Actually, fairly sure it was this, I copied it down verbatim.  Though I 
could check again.

ncr53c8xx_reset: pid=0 resetflags=2 serial_number=18 
serial_number_at_timeout=18

It kept doing all these lines, except increasing the serial_number and 
serial_number_at_timeout from 18 to whenever I stopped it, which I think 
was 35 at one point.  I could check again, but I distinctly remember 
seeing BOTH the ncr53c8xx and ncr53c720-0 stuff on the console.  This is 
the graphical console install, not the serial console install.

0.9.2 ISO stock.

Dan

On Friday, November 9, 2001, at 11:30 AM, Grant Grundler wrote:

> Daniel Williams wrote:
>> scsi bus is being reset for host 1 channel 0
>> ncr53c8xx_reset: pid-0 resetflags=2 serial_number=18
>> serial_number_at_timeout=18
>> ncr53c720-0: restart(scsi reset)
>> SCSI host 1 abort (pid0) timed out - resetting.
>
> uhm...shouldn't that be the sym53c8xx driver?
> I only ask because I couldn't find ncr53c8xx_reset in the sym53c8xx 
> driver.
>
> grant
