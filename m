Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F6664829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 23:53:15 -0600 (MDT)
Date: Fri, 30 Aug 2002 07:46:16 +0200
Message-ID: <3D3815BD00009582@ocpmta5.be.tiscali.com>
In-Reply-To: <200208291710.g7THAnVF025339@hiauly1.hia.nrc.ca>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
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
>Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
>To: jsoe0708@tiscali.be
>From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
>Cc: parisc-linux@lists.parisc-linux.org
>Date: Thu, 29 Aug 2002 13:10:49 -0400 (EDT)
>
>
>> p is of type partition define as follow:
>> struct partition {
>>     unsigned char boot_ind;     /* 0x80 - active */
>>     unsigned char head;     /* starting head */
>>     unsigned char sector;       /* starting sector */
>>     unsigned char cyl;      /* starting cylinder */
>>     unsigned char sys_ind;      /* What partition type */
>>     unsigned char end_head;     /* end head */
>>     unsigned char end_sector;   /* end sector */
>>     unsigned char end_cyl;      /* end cylinder */
>>     unsigned int start_sect;    /* starting sector counting from 0 */
>>     unsigned int nr_sects;      /* nr of sectors in partition */
>> };
>
>The problem is that a struct of the above type is being allocated
>at an unaligned address.

Sorry I do not understand, can you tell me more or where can I found additional
 explanation?

>  That's not normal.  The cast isn't the
>problem.
>

Thanks in advance,
    Joel
