Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: jsoe0708@tiscali.be
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb 
In-Reply-To: Message from jsoe0708@tiscali.be
   of "Thu, 29 Aug 2002 19:12:18 +0200." <3D53B3B70000897C@ocpmta1.be.tiscali.com>
References: <3D53B3B70000897C@ocpmta1.be.tiscali.com> 
Date: Thu, 29 Aug 2002 12:11:48 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020829181149.032A74829@dsl2.external.hp.com>
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

jsoe0708@tiscali.be wrote:
> >for (i=0 ; i<16 ; i++){
> >    if (*uip+i != 0x00) return FALSE;
> >}
> >return TRUE;
> >
> Quick test and yes that works (reduce response time 1/10).

You've avoided the first visible symptom but not solved the problem.
The next reference to the int embedded in the struct will cause
an unaligned access fault.

grant
