Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E8DA4840
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Nov 2003 00:52:58 -0700 (MST)
Received: from hrzpub.tu-darmstadt.de (IP-213157011159.dialin.heagmedianet.de [213.157.11.159])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.10/8.12.7) with ESMTP id hAJ7pBcH008109
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Nov 2003 08:52:33 +0100
Message-ID: <3FBB2114.9050003@hrzpub.tu-darmstadt.de>
Date: Wed, 19 Nov 2003 08:51:48 +0100
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Boot-up challenges on a 715/75
References: <1e2.13b31f0d.2cebe9ab@aol.com>
In-Reply-To: <1e2.13b31f0d.2cebe9ab@aol.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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
JjDunnjr@aol.com schrieb:

>
> I have tried several ways to call up this CD-RW.  I have specified the 
> scsi address; I have rewritten the PATHs to direct boot up.  All to no 
> avail
> It is clear that the 715/75 recognizes the TEAC but does not recognize 
> the scsi Address.

have you checked whether the external scsi bus is correctly terminated? 
Perhaps that why your machine doesn't recognize the scsi address.
FYI, i have a Plextor cd-drive connected to my 715/100 (internal), which 
works without any problems.

>
> any help
>
> Thanks in advance
> jack dunn

Ruediger
