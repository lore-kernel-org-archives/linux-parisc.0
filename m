Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: jsoe0708@tiscali.be
Cc: "Ryan Bradetich" <rbradetich@uswest.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] highmem_io for the sym53c8xx_2 driver?? 
In-Reply-To: Message from jsoe0708@tiscali.be
   of "Tue, 26 Nov 2002 16:07:40 +0100." <3DAAAD4600004A10@ocpmta1.be.tiscali.com>
References: <3DAAAD4600004A10@ocpmta1.be.tiscali.com> 
Date: Tue, 26 Nov 2002 11:45:57 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021126184557.5F5594829@dsl2.external.hp.com>
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
> Am I wrong or sg_virt_address() should be called sg_virt_addr()?

you've got it right.

grant
