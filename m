Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 605164829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Mar 2003 09:07:01 -0700 (MST)
Date: Fri, 21 Mar 2003 17:06:58 +0100
Subject: Re: [parisc-linux] HP J5600
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v551)
Cc: Stefan Witzel <stefan.witzel@zvw.uni-goettingen.de>,
	PARISC-LINUX <parisc-linux@lists.parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20030321121432.GI14520@parcelfarce.linux.theplanet.co.uk>
Message-Id: <24D5869E-5BB7-11D7-9B6B-0030656F07A2@esiee.fr>
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

Le vendredi, 21 mar 2003, =E0 13:14 Europe/Paris, Matthew Wilcox a =E9crit=
 :

> On Fri, Mar 21, 2003 at 12:52:58PM +0100, Stefan Witzel wrote:
>> Hello,
>>
>> I try to install parisc-linux on a J5600 workstation. When the
>> welcome screen from Debian appears I press the enter key
>> (german keyboard, USB) to continue but there is no reaction.
>>
>> So I looked in the mailing list archives and found that there
>> are/were some problems with J5600 workstations.
>>
>> What is the current state? Are J5600 supported?
>
> Yes, but USB wasn't in Debian 3.0.  Back in November, Grant replied to=20=

> someone with a similar problem:
>
>> I suspect the kernel in debian stable might just be too old.
>> Can you try newer net-install images from ESIEE?
>>         (ftp://ftp.parisc-linux.org/cd-images/testing/auto-isos/)
>>
>> FWIW, at least three developers are *using* C3000 including myself.
>> But I've never cold installed using the debian since I've had bits
>> on this machine since well before any ISOs were available.
>> Probably would be a good exercise....
>
> No reply was received indicating whether or not this worked, so I'm
> reluctant to add a FAQ entry for it.  Please let us know how you get =
on
> with this.
>
http://pateam.esiee.fr/cd-images/testing/
these are the latest ones (I know I should put them on dsl2, have to=20
script that somehow).

They do work.
this is the same problem we had with B2000 and B2600 here, and we=20
received numerous confirmations
that it worked for J as well.

This should be a FAQ, i'll add it later if nobody does.
See the boot howto for details:
http://pateam.esiee.fr/doc.html

HTH


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/=
