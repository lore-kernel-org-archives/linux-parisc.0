Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2B72482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jul 2003 08:56:50 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157001142.dialin.heagmedianet.de [213.157.1.142])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.9/8.12.7) with ESMTP id h6FEuitd009300
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jul 2003 16:56:47 +0200
Message-ID: <3F1414A8.6020606@hrzpub.tu-darmstadt.de>
Date: Tue, 15 Jul 2003 16:50:16 +0200
From: =?ISO-8859-1?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: [Fwd: Re: [parisc-linux] real2.S in linux-2.5]
Content-Type: multipart/mixed;
 boundary="------------090204010400080205050000"
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

This is a multi-part message in MIME format.
--------------090204010400080205050000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

This should go to the mailing list also...

--------------090204010400080205050000
Content-Type: message/rfc822;
 name="Re: [parisc-linux] real2.S in linux-2.5"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Re: [parisc-linux] real2.S in linux-2.5"

Message-ID: <3F13AABB.1030106@hrzpub.tu-darmstadt.de>
Date: Tue, 15 Jul 2003 09:18:19 +0200
From: =?ISO-8859-1?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.4) Gecko/20030624
X-Accept-Language: de-de, de, en-us, en
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] real2.S in linux-2.5
References: <3F12C763.7010305@hrzpub.tu-darmstadt.de> <20030714152317.GI23808@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030714152317.GI23808@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Matthew Wilcox schrieb:

>Done.
>
Thanks.

>
> restore_control_regs:
>-       load32  PA(save_cr_space + (N_SAVED_REGS * REG_SZ)), %r26
>+       load32  PA(save_cr_space+(N_SAVED_REGS*REG_SZ)), %r26
>        POP_CR(%cr15, %r26)
>
>I'm a little annoyed this fix wasn't committed to 2.5 already.  I wonder
>what other bits went into the 2.4 tree without going into 2.5 first?
>
Looking at the mail archive for cvs I found the following checkins this 
month for linux-2.4 which had no similar checkin to linux-2.5. But I 
don't know much about kernel development, so perhaps these changes are 
nonly needed in linux-2.4.

    
http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2003-July/032783.html
    
http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2003-July/032788.html

>
>BTW, it's not for gcc-3.3's benefit, but for binutils' benefit.
>
Yes, I know. It was a quick'n'dirty email. ;)



--------------090204010400080205050000--
