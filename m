Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm6.tiscalinet.be [212.35.2.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14C974829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Oct 2002 12:39:50 -0600 (MDT)
Message-ID: <3DB1B65F.5020203@freebel.net>
Date: Sat, 19 Oct 2002 19:45:35 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
References: <3DA56CAE00003256@ocpmta8.be.tiscali.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] jfs-1.0.23 as well xfs-cvs break fb console on k-2.4.19-pa22
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

Funny isn't it?

Excepted those anoying problem all seems to work fine (I already 
sucessfully tested a jfs fs (over a evms lvm) and still have to test a xfs).

Really no idea?

Joel

jsoe0708@tiscali.be wrote:
>>-- Original Message --
>>From: jsoe0708@tiscali.be
>>Subject: RE: [parisc-linux] FW: [Bug #3332] jfs-1.0.22 and 1.0.23 break
> 
> fb
> 
>>console on k-2.4.19-pa22
>>To: parisc-linux@lists.parisc-linux.org
>>Date: Fri, 18 Oct 2002 16:43:08 +0200
>>
>>
>>
>>>Hi all,
>>>
>>>May be much hppa specific problem.
>>>
>>>All advise is well come.
>>>
>>>Thanks in advance,
>>>   Joel
>>>
>>>--- Start of the Attached Message ---
>>>
>>>Date: Thu, 17 Oct 2002 12:47:30 -0400
>>>To: joel.soete@tiscali.be
>>>Subject: [Bug #3332] jfs-1.0.22 and 1.0.23 break fb console on k-2.4.19-pa22
>>>From: admin@www-124.southbury.usf.ibm.com
>>>
>>>
>>>Bug #3332 has been submitted pending email address confirmation. 
>>>Here is a current snapshot of the bug.
>>>
>>>Project: 
>>>Category: kernel
>>>Status: Open
>>>Bug Group: bug
>>>Priority: 5
>>>Summary: jfs-1.0.22 and 1.0.23 break fb console on k-2.4.19-pa22
>>>
>>>Details: Hi all,
>>>
>>>Test your tools, I test early with success 1.0.17 (against k-2.4.18-pa54
>>>and latter).
>>
>>
>>Hmm I was wrong: I come back to jfs-2.4-1.0.17 against k-2.4.19-pa22 and
>>the problem is the same. So the actual problem is a change between 2.4.18(pa54)
>>and 2.4.19(pa22).
>>
>>Any idea?
> 
> 
> The very first patch 2.4.19 I still have was pa5 and the same problem occur.
> It seems definitely that JFS and STI FB in 2.4.19 are incompatible.
> 
> Where do I have to start my investigation?
> 
> 
>>>Just an anoying problem the fb console is broken:
>>>just when kernel launches to detect the first scsi device the screen scroll
>>>stop and the rest of messages are all display over others on  the very
>>
> top
> 
>>>line of the screen.
>>>
>>
> Thanks in advance for help,
>    Joel
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
