Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 54F2A4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Aug 2002 00:00:41 -0600 (MDT)
Date: Fri, 30 Aug 2002 07:53:41 +0200
Message-ID: <3D3815BD0000958D@ocpmta5.be.tiscali.com>
In-Reply-To: <20020829181149.032A74829@dsl2.external.hp.com>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb 
To: "Grant Grundler" <grundler@dsl2.external.hp.com>
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
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
>To: jsoe0708@tiscali.be
>Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
>	parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
>
>Date: Thu, 29 Aug 2002 12:11:48 -0600
>From: Grant Grundler <grundler@dsl2.external.hp.com>
>
>
>jsoe0708@tiscali.be wrote:
>> >for (i=0 ; i<16 ; i++){
>> >    if (*uip+i != 0x00) return FALSE;
>> >}
>> >return TRUE;
>> >
>> Quick test and yes that works (reduce response time 1/10).
>
>You've avoided the first visible symptom but not solved the problem.
>The next reference to the int embedded in the struct will cause
>an unaligned access fault.
>

Ah ok but where is located the actual problem (gcc, ld, kernel ?).
I am not a computer science engineer and have not enough knowledge to understand
this problem of unalign access and unalign adress. Can you give me some source
of information explaining that stuff?

Thanks for adivises,
    Joel
