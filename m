Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta203-rme.xtra.co.nz (mta203-rme.xtra.co.nz [210.86.15.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id 556FA4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 07:15:11 -0600 (MDT)
Received: from mta1-rme.xtra.co.nz ([210.86.15.143])
          by mta203-rme.xtra.co.nz with ESMTP
          id <20030416131508.KGUY14069.mta203-rme.xtra.co.nz@mta1-rme.xtra.co.nz>
          for <parisc-linux@lists.parisc-linux.org>;
          Thu, 17 Apr 2003 01:15:08 +1200
Received: from peanut ([210.54.70.151]) by mta1-rme.xtra.co.nz with SMTP
          id <20030416131507.ELWM29186.mta1-rme.xtra.co.nz@peanut>
          for <parisc-linux@lists.parisc-linux.org>;
          Thu, 17 Apr 2003 01:15:07 +1200
Message-Id: <3.0.2.32.20030417011531.00a2bf20@pop3.xtra.co.nz>
Date: Thu, 17 Apr 2003 01:15:31 +1200
To: parisc-linux@lists.parisc-linux.org
From: Gavin Hubbard <ghub005@xtra.co.nz>
In-Reply-To: <20030416123824.22413.48893.Mailman@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] Re: Presicionbook success
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

>On Wed, Apr 16, 2003 at 01:07:06PM +0100, M. Grabert wrote:
>> I just wanted you to inform that I successfully installed
>> Debian testing on my Presicionbook.
>
>Sweet!
>
>> - The precompiled kernel from the EISEE team may hang ...
>> 
>>   ... since it has support for the CMD PCI0643 IDE Busmaster chip,
>>   which is obviously used in the Presicionbook, but the driver
>>   doensn't/mustn't be used in Linux, since it causes confusion!
>>   So add "ide=nodma" or something similar to the kernel parameters
>>   (using the IPL) or simply recompile the kernel with no IDE support.
>> 
>>   (The Presicionbook uses 2.5" IDE harddrives, obviously connected
>>    to the CMD chip, but they automagically appear as SCSI drives on LASI
>>    SCSI.)
>
>*blink*.  That's pretty weird.  Could you send the device listing that
>dmesg produces, and the results of lspci?


Before anyone loses too much sleep over this, the Precisionbook has
internal SCSI-IDE bridges that sit between the HBA and the drives. I
believe a similar system was used in some of the earlier Apple Powerbooks.

Regards,

Gavin
