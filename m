Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm6.tiscalinet.be [212.35.2.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B61A4830
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Oct 2002 10:06:16 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscalinet)
	id 182Zdc-0005Pn-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Oct 2002 18:06:12 +0200
Date: Fri, 18 Oct 2002 19:02:27 +0200
Message-ID: <3DA56CAE00003256@ocpmta8.be.tiscali.com>
In-Reply-To: <3DA56CAE00003154@ocpmta8.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] jfs-1.0.22 and 1.0.23 break fb console on k-2.4.19-pa22
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

>-- Original Message --
>From: jsoe0708@tiscali.be
>Subject: RE: [parisc-linux] FW: [Bug #3332] jfs-1.0.22 and 1.0.23 break
fb
>console on k-2.4.19-pa22
>To: parisc-linux@lists.parisc-linux.org
>Date: Fri, 18 Oct 2002 16:43:08 +0200
>
>
>>
>>Hi all,
>>
>>May be much hppa specific problem.
>>
>>All advise is well come.
>>
>>Thanks in advance,
>>    Joel
>>
>>--- Start of the Attached Message ---
>>
>>Date: Thu, 17 Oct 2002 12:47:30 -0400
>>To: joel.soete@tiscali.be
>>Subject: [Bug #3332] jfs-1.0.22 and 1.0.23 break fb console on k-2.4.19-pa22
>>From: admin@www-124.southbury.usf.ibm.com
>>
>>
>>Bug #3332 has been submitted pending email address confirmation. 
>>Here is a current snapshot of the bug.
>>
>>Project: 
>>Category: kernel
>>Status: Open
>>Bug Group: bug
>>Priority: 5
>>Summary: jfs-1.0.22 and 1.0.23 break fb console on k-2.4.19-pa22
>>
>>Details: Hi all,
>>
>>Test your tools, I test early with success 1.0.17 (against k-2.4.18-pa54
>>and latter).
>
>
>Hmm I was wrong: I come back to jfs-2.4-1.0.17 against k-2.4.19-pa22 and
>the problem is the same. So the actual problem is a change between 2.4.18(pa54)
>and 2.4.19(pa22).
>
>Any idea?

The very first patch 2.4.19 I still have was pa5 and the same problem occur.
It seems definitely that JFS and STI FB in 2.4.19 are incompatible.

Where do I have to start my investigation?

>>Just an anoying problem the fb console is broken:
>>just when kernel launches to detect the first scsi device the screen scroll
>>stop and the rest of messages are all display over others on  the very
top
>>line of the screen.
>>
Thanks in advance for help,
   Joel
