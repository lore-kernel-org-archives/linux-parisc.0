Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "EVERSON,SETH (HP-Loveland,ex1)" <seth_everson2@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Sucky I/O IDE Support? 
In-Reply-To: Message from "EVERSON,SETH (HP-Loveland,ex1)" <seth_everson2@hp.com>
   of "Tue, 21 May 2002 14:08:30 PDT." <F341E03C8ED6D311805E00902761278C0CD12BEF@xfc04.fc.hp.com>
References: <F341E03C8ED6D311805E00902761278C0CD12BEF@xfc04.fc.hp.com> 
Date: Wed, 22 May 2002 12:15:38 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020522181538.CBEA3482B@dsl2.external.hp.com>
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

"EVERSON,SETH (HP-Loveland,ex1)" wrote:
> There have been a few iterations of kernel hacking since the release notes
> for the .93 release,
> and I was wondering if anyone has done any work on getting the IDE support
> for Sucky I/O going?

yes. thomas bogendoerfer got the CD support working and I don't think
anyone else has done more.

> I did see a script in CVS that created the special files for IDE, and it
> could actually read CD's on the IDE CD-ROM in my C3600, but sustained
> transfers always resulted in an error.

Well, post the kernel output (and other related data, ie kernel version
and CD-ROM type) and see if there are any takers.

grant
