Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3CA2482E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Nov 2002 12:38:49 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id 96B461FFECD
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Nov 2002 20:38:44 +0100 (CET)
Date: Thu, 14 Nov 2002 19:37:55 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Cc: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Message-ID: <Pine.BSF.4.44.0211141928040.39295-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] strange mail routing problem for mail from this list
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

Hi,

I have seen some strange headers on the mail from Grant Grundler's
reply to my posting regarding "[2.5] rtc doesn't build".
I noticed this because the mail came in with a delay > 1 day.

The problem here seems that the mailsystems down under have nothing to
do with either hp, parisc or my mailhosts from what I know.

My question to the list would be if anybody else received mails from
the list going through these systems.

a simple grep for 144.249.122.105 and 212.125.75.12 should be
sufficient.

for me this was:
	egrep -E '(144.249.122.105|212.125.75.12)' Mail/LISTS.linux.parisc

if this is postive for you too please contact me off-list.

Thanks.

PS: the same simple grep should word for the maillogs on
parisc-linux.org if anybody else with access there can find the time.

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/

> Received: from mail pickup service by naex017w.apci.com with Microsoft
>     SMTPSVC;
> 	 Wed, 13 Nov 2002 23:39:46 -0500
> Received: from Local ([144.249.122.105]) by 144.249.122.105 with Trend
>     Micro InterScan Messaging Security Suite for SMTP v5.01; Tue,
>      12 Nov 2002 14:01:07 -0500
...
> Received: from mail4.messagelabs.com ([212.125.75.12]) by Local with
>     Microsoft SMTPSVC(5.0.2195.4905);
> 	 Tue, 12 Nov 2002 14:01:07 -0500
