Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C2544829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 11:12:28 -0600 (MDT)
Date: Thu, 29 Aug 2002 19:12:18 +0200
Message-ID: <3D53B3B70000897C@ocpmta1.be.tiscali.com>
In-Reply-To: <3D53B3B70000896D@ocpmta1.be.tiscali.com>
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

>
>So anyway there is a bug because I presume that the for loop is there to
>scan the 4 int what it doen't do (?) and find another way to say an 'int'
>is null ( hmm why not simply 
>u_int8_t *uip = (u_int8_t *)p;
>for (i=0 ; i<16 ; i++){
>    if (*uip+i != 0x00) return FALSE;
>}
>return TRUE;
>
Quick test and yes that works (reduce response time 1/10).

Anyway all better idea is well come :)

Thanks a lot,
    Joel
